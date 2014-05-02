#!/usr/bin/env python

import re
import os
import subprocess
import threading
import datetime
import math

def delete(fnames):
    for fname in fnames:
        try:
            os.unlink(fname)
        except OSError:
            pass  # file does not exist, ignore

def exec_timeout(command, timeout_sec):
    """ Return the process's runtime in seconds or None if timed out. """

    sub = subprocess.Popen(command)
    thread = threading.Thread(target=sub.communicate)
    thread.start()

    t1 = datetime.datetime.now()
    thread.join(timeout_sec)
    t2 = datetime.datetime.now()

    if thread.is_alive():
        sub.terminate()
        thread.join()
        return None # timed out
    else:
        return (t2-t1).total_seconds()

def exec_multi(attempts, command, timeout_sec, cleanup=None):
    ts = []
    for _ in xrange(attempts):
        if cleanup:
            cleanup()

        t = exec_timeout(command, timeout_sec)
        if t is not None:
            ts.append(t)

        if cleanup:
            cleanup()

    N = len(ts)
    mean = sum(ts) / N
    ssq = sum((t - mean)**2 for t in ts)

    return {
        'mean': mean,
        'stdev': math.sqrt(ssq / (N-1)),
        'N': N,
        'attempts': attempts,  # including timeouts
    }

def run_benchmark(bmark):
    t_comp = exec_multi(5,
        ['idris', '--warnreach', bmark + '.idr', '-o', bmark],
        timeout_sec=30,
        cleanup=lambda: delete(fn for fn in os.listdir('.') if fn.endswith('.ibc') or bmark == fn),
    )

    return {
        'compilation': t_comp,
    }

# find all benchmarks
bmarks = [
    match.group(1) for match in [
        re.match(r'([0-9]{3}-.*)\.idr', fname) for fname in os.listdir('.')
    ] if match
]

# run the benchmarks
results = {}
for bmark in bmarks:
    results[bmark] = run_benchmark(bmark)

print results
