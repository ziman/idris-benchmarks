#!/usr/bin/env python

import re
import os
import subprocess
import threading
import datetime
import math

# configuration
from benchdata import *

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

    N = len(ts)
    mean = sum(ts) / N
    ssq = sum((t - mean)**2 for t in ts)

    return {
        'mean': mean,
        'stdev': math.sqrt(ssq / (N-1)),
        'N': N,
        'attempts': attempts,  # including timeouts
    }

def run_benchmark(bname, binfo):
    def cleanup():
        delete(
            fn for fn in os.listdir('.')
            if fn.endswith('.ibc') or fn == bname
        )

    t_comp = exec_multi(N_runs,
        ['idris', '--warnreach', bname + '.idr', '-o', bname],
        timeout_sec=30,
        cleanup=cleanup,
    )

    t_runtime = []

    cleanup()

    return {
        'compilation': t_comp,
        'runtime': t_runtime,
    }

# run the benchmarks
results = {}
for bname, binfo in BENCHMARKS:
    results[bname] = run_benchmark(bname, binfo)

print results
