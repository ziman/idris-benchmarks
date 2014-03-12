## Some benchmarks

Everything is in seconds.

### master

```
[1/2] 001-shl-bin
001-shl-bin compile 0.59 0.63 0.64 0.60 0.62 -- avg = 0.616, sd = 2.1e-2
stats.hs: Prelude.read: no parse
001-shl-bin run TIMEOUT TIMEOUT TIMEOUT TIMEOUT TIMEOUT -- 
[2/2] 002-add-bins
002-add-bins    compile 2.96 2.98 2.98 2.98 3.00 -- avg = 2.98, sd = 1.4e-2
002-add-bins    run 4.44 4.42 4.43 4.46 4.49 -- avg = 4.448, sd = 2.8e-2
```

### erasure

```
[1/2] 001-shl-bin
001-shl-bin compile 0.60 0.60 0.59 0.60 0.60 -- avg = 0.598, sd = 4.0e-3
001-shl-bin run 1.98 1.98 1.94 1.94 1.97 -- avg = 1.962, sd = 2.0e-2
[2/2] 002-add-bins
002-add-bins    compile 3.01 2.98 2.96 2.96 2.96 -- avg = 2.974, sd = 2.2e-2
002-add-bins    run 3.87 3.89 3.88 3.90 4.19 -- avg = 3.946, sd = 0.137
```
