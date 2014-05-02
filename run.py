#!/usr/bin/env python

import re
import os

def run_benchmark(bmark):
    return {}

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
