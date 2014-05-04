#!/usr/bin/env python

import re
import os
import sys
import subprocess
import threading
import datetime
import math
import json
import argparse

# configuration
from benchdata import *

class IncorrectOutput(Exception):
    def __init__(self, expected, actual):
        self.expected = expected
        self.actual = actual

    def __str__(self):
        return 'expected: "%s", actual: "%s"' % (self.expected, self.actual)

def delete(fnames):
    for fname in fnames:
        try:
            os.unlink(fname)
        except OSError:
            pass  # file does not exist, ignore

def exec_timeout(command, timeout_sec, stdin=None, expected_stdout=None):
    """ Return the process's runtime in seconds or None if timed out. """

    sub = subprocess.Popen(command, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    stdout = [None]
    def work():
        stdout[0] = sub.communicate(input=stdin)[0].strip()

    thread = threading.Thread(target=work)
    thread.start()

    t1 = datetime.datetime.now()
    thread.join(timeout_sec)
    t2 = datetime.datetime.now()

    if thread.is_alive():
        sub.terminate()
        thread.join()
        return None # timed out
    else:
        if (expected_stdout is not None) and (stdout[0] != expected_stdout):
            raise IncorrectOutput(expected_stdout, stdout[0])

        return (t2-t1).total_seconds()

def prn(s):
    sys.stdout.write(s)
    sys.stdout.flush()

def exec_multi(attempts, command, timeout_sec, cleanup=None, stdin=None, expected_stdout=None):
    ts = []
    for i in xrange(attempts):
        if cleanup:
            cleanup()

        t = exec_timeout(command, timeout_sec, stdin=stdin, expected_stdout=expected_stdout)
        if t is not None:
            ts.append(t)

        prn('%d ' % (i+1))

    N = len(ts)
    mean = sum(ts) / N if N else None
    ssq = sum((t - mean)**2 for t in ts)

    return {
        'mean': mean,
        'stdev': math.sqrt(ssq / (N-1)) if N != 1 else None,
        'N': N,
        'attempts': attempts,  # including timeouts
        'ts': ts,
    }

def run_benchmark(bname, binfo, iters):
    print 'Running benchmark: %s' % bname

    def cleanup():
        delete(
            fn for fn in os.listdir('.')
            if fn.endswith('.ibc') or fn == bname
        )

    prn('  compiling: ')
    t_comp = exec_multi(iters,
        ['idris', bname + '.idr', '-o', bname],
        timeout_sec=TIMEOUT_sec,
        cleanup=cleanup,
    )
    print ''

    t_runtime = []
    for isize in binfo['input_sizes']:
        prn('  input size %d: ' % isize)
        t_run = exec_multi(iters,
            ['./' + bname],
            timeout_sec=TIMEOUT_sec,
            stdin=binfo['mk_input'](isize),
            expected_stdout=binfo['mk_output'](isize),
        )
        t_runtime.append((isize, t_run))
        print ''

    cleanup()

    return {
        'compilation': t_comp,
        'runtime': t_runtime,
    }

def main(args):
    # run the benchmarks
    results = []
    for bname, binfo in BENCHMARKS:
        result = run_benchmark(bname, binfo, args.iters)
        results.append((bname, result))

    # save results
    with open(args.outfile, 'w') as f:
        f.write(json.dumps(results, indent=2))

parser = argparse.ArgumentParser(description='Run benchmarks and save the results into a JSON file.')
parser.add_argument('-o',
        metavar='FILE', type=str, default='results.json',
        dest='outfile', help='Where the results should be written [results.json]'
)
parser.add_argument('-i', '--iters',
        metavar='N', type=int, default=10,
        dest='iters', help='How many times every measurement should be repeated [10]'
)
main(parser.parse_args())
