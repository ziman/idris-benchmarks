#!/usr/bin/env python

import json
import argparse
import jinja2

def rootname(inp):
    return '.'.join(inp.split('/')[-1].split('.')[:-1])

def load_input(inp):
    with open(inp, 'r') as f:
        return json.loads(f.read())

def main(args):
    inputs = [(rootname(inp), load_input(inp)) for inp in args.inputs]
    print inputs

parser = argparse.ArgumentParser(description='Generate an HTML report from benchmark JSONs.')
parser.add_argument(
        metavar='JSON', nargs='+', dest='inputs',
        help='Input JSON files.'
)
main(parser.parse_args())
