#!/usr/bin/env python

import json
import argparse
import jinja2
import subprocess

from benchdata import *

def rootname(inp):
    return '.'.join(inp.split('/')[-1].split('.')[:-1])

def load_input(inp):
    with open(inp, 'r') as f:
        return json.loads(f.read())

def main(args):
    inputs = [load_input(inp) for inp in args.inputs]
    inames = [rootname(inp) for inp in args.inputs]
    bnames = [n for n, _ in inputs[0]]
    units  = {bname: info['units'] for bname, info in BENCHMARKS} 

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
        # data for R
        try:
            with open('tmp/%s-runtime-R.txt' % bname, 'w') as f:
                f.write('"version" "dsize" "runtime"\n')

                for iname in inames:
                    for isize, stat in runtime[bname][iname]:
                        for t in stat['ts']:
                            f.write('"%s" %f %f\n' % (iname, isize, t))

            with open('tmp/%s-compilation-R.txt' % bname, 'w') as f:
                f.write('"version" "time"\n')

                for iname in inames:
                    for t in compilation[bname][iname]['ts']:
                        f.write('"%s" %f\n' % (iname, t))
        except KeyError:
            pass # XXX: ts not found

        # data for Gnuplot
        cplots = []
        rplots = []

        for i, iname in enumerate(inames):
            with open('tmp/%s-%s-compilation-gpl.txt' % (bname, iname), 'w') as comp_gpl:
                c = compilation[bname][iname]
                comp_gpl.write('%d %g %g\n' % (i, c['mean'], c['stdev']))

            cplots.append('"tmp/%s-%s-compilation-gpl.txt" with boxerrorbars title "%s" fill pattern 10 lw 2'
                % (bname, iname, iname))

            with open('tmp/%s-%s-runtime-gpl.txt' % (bname, iname), 'w') as f:
                for isize, stat in runtime[bname][iname]:
                    f.write('%g %g %g\n' % (isize, stat['mean'], stat['stdev']))

            rplots.append('"tmp/%s-%s-runtime-gpl.txt" with errorbars title "" lw 1' % (bname, iname))
            rplots.append('"tmp/%s-%s-runtime-gpl.txt" using 1:2 with lines lw 1 title "%s"' % (bname, iname, iname))

        with open('tmp/%s-compilation.gpl' % bname, 'w') as f:
            f.write("""
                set title '{0}';
                set ylabel 'Compilation time (seconds)';
                set xlabel 'Version';
                set term pngcairo size 640,480 fontscale 0.75 background '#ffffff';
                set output '{1}';
                set xtics nomirror ({2});
                set xrange [-1:{3}];
                set yrange [0:{4}];
                set grid;
                set boxwidth 0.75;
                plot {5};
            """.format(
                bname,
                'report/%s-compilation.png' % bname,
                ', '.join('"%s" %d' % (iname, i) for i, iname in enumerate(inames)),
                len(inames),
                1.2 * max(c['mean'] + c['stdev'] for c in (d for d in compilation[bname].itervalues())),
                ', '.join(cplots),
            ) + '\n')

        with open('tmp/%s-runtime.gpl' % bname, 'w') as f:
            f.write("""
                set title '{0}';
                set ylabel 'Runtime (seconds)';
                set xlabel 'Data size ({1})';
                set term pngcairo size 640,480 fontscale 0.75 background '#ffffff';
                set output '{2}';
                set grid;
                plot \\\n  {3};
            """.format(
                bname,
                units[bname],
                'report/%s-runtime.png' % bname,
                ',\\\n  '.join(cplots),
            ) + '\n')

        subprocess.check_call(['gnuplot', 'tmp/%s-compilation.gpl' % bname])
        subprocess.check_call(['gnuplot', 'tmp/%s-runtime.gpl' % bname])

parser = argparse.ArgumentParser(description='Generate an HTML report from benchmark JSONs.')
parser.add_argument(
        metavar='JSON', nargs='+', dest='inputs',
        help='Input JSON files.'
)
main(parser.parse_args())
