#!/usr/bin/env python

import json
import argparse
import jinja2
import subprocess

def rootname(inp):
    return '.'.join(inp.split('/')[-1].split('.')[:-1])

def load_input(inp):
    with open(inp, 'r') as f:
        return json.loads(f.read())

def main(args):
    inputs = [load_input(inp) for inp in args.inputs]
    inames = [rootname(inp) for inp in args.inputs]
    bnames = [n for n, _ in inputs[0]]

    compilation = {}
    runtime = {}
    for iname, inp in zip(inames, inputs):
        for bname, bench in inp:
            if bname not in compilation:
                compilation[bname] = {}
            compilation[bname][iname] = bench['compilation']

            if bname not in runtime:
                runtime[bname] = {}
            runtime[bname][iname] = bench['runtime']

    for bname in bnames:
        plots = []

        for i, iname in enumerate(inames):
            with open('tmp/%s-%s-compilation.txt' % (bname, iname), 'w') as f:
                c = compilation[bname][iname]
                f.write('%g %g\n' % (c['mean'], c['stdev']))

            with open('tmp/%s-%s-runtime.txt' % (bname, iname), 'w') as f:
                for isize, stat in runtime[bname][iname]:
                    f.write('%g %g %g\n' % (isize, stat['mean'], stat['stdev']))

            plots.append('"tmp/%s-%s-runtime.txt" with errorbars title "" lw 1' % (bname, iname))
            plots.append('"tmp/%s-%s-runtime.txt" using 1:2 with lines lw 1 title "%s"' % (bname, iname, iname))

        with open('tmp/%s-runtime.gpl' % bname, 'w') as f:
            f.write("""
                set title '{0}';
                set ylabel 'Time (seconds)';
                set xlabel 'Data size';
                set term pngcairo size 640,480 fontscale 0.75 background '#ffffff';
                set output '{1}';
                plot \\\n  {2};
            """.format(
                bname,
                'report/%s-runtime.png' % bname,
                ',\\\n  '.join(plots),
            ) + '\n')

        subprocess.check_call(['gnuplot', 'tmp/%s-runtime.gpl' % bname])

parser = argparse.ArgumentParser(description='Generate an HTML report from benchmark JSONs.')
parser.add_argument(
        metavar='JSON', nargs='+', dest='inputs',
        help='Input JSON files.'
)
main(parser.parse_args())
