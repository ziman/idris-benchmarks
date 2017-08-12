#!/usr/bin/env python3

import json
import argparse

def main(args):
    with open(args.fname_in) as f:
        doc = json.load(f)

    print('"program","treatment","stage","input_size","duration"')
    for prog_name, data in doc:
        for t in data['compilation']['ts']:
            print('"%s","compilation",NA,%f' % (
                prog_name, t
            ))

        for input_size, stats in data['runtime']:
            for t in stats['ts']:
                print('"%s","runtime",%f,%f' % (
                    prog_name, input_size, t
                ))

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('fname_in')
    main(ap.parse_args())
