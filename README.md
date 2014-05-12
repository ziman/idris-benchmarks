## Some benchmarks

* HTML output with charts:
  * http://ziman.functor.sk/erasure-bm/

## Usage

```
$ (cd $IDRIS_DIR; git checkout branch1; cabal install)
$ ./run_benchmarks -o measurements/branch1.json

$ (cd $IDRIS_DIR; git checkout branch2; cabal install)
$ ./run_benchmarks -o measurements/branch2.json

$ ./compare measurements/branch1.json measurements/branch2.json
```
