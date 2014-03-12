#!/bin/bash

TIMEOUT="10s"
RUNS=5

bench() {
    prog="$1"
    shift
    label="$1"
    shift

    >time.txt
    for run in $(seq $RUNS); do
        rm -f *.ibc
        cat ${prog}-input.txt 2>/dev/null \
            | timeout $TIMEOUT   \
                /usr/bin/time -a -o time.txt -f %U \
                "$@" > /dev/null \
            || echo "TIMEDOUT" >> time.txt
    done
    
    echo -e "$prog\t$label\t$(tr '\n' ' ' < time.txt)-- $(runhaskell stats.hs < time.txt)"
}

progs="$(ls *.idr | egrep '^[0-9]{3}-.*\.idr' | cut -d. -f1)"
prog_cnt="$(echo "$progs" | wc -l)"

i=1
for prog in $progs; do
    echo "[$i/$prog_cnt] $prog"
    bench "$prog" "compile" idris ${prog}.idr -o $prog
    bench "$prog" "run" ./$prog
    i=$((i+1))
done

rm -f *.ibc $progs time.txt *~
