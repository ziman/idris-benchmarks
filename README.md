## Some benchmarks

Everything is in seconds.

### master

```
[1/3] 001-shl-bin
001-shl-bin     compile 0.64 0.64 0.67 0.63 0.63 -- avg = 0.642, sd = 1.6e-2
001-shl-bin     run     TIMEOUT TIMEOUT TIMEOUT TIMEOUT TIMEOUT -- 
[2/3] 002-add-bins
002-add-bins    compile 2.94 2.95 2.95 2.96 2.96 -- avg = 2.952, sd = 8.0e-3
002-add-bins    run     4.45 4.44 4.39 4.45 4.41 -- avg = 4.428, sd = 2.7e-2
[3/3] 003-palindrome
003-palindrome  compile 1.44 1.43 1.44 1.44 1.44 -- avg = 1.438, sd = 4.0e-3
003-palindrome  run     TIMEOUT TIMEOUT TIMEOUT TIMEOUT TIMEOUT -- 
```

### erasure

```
[1/3] 001-shl-bin
001-shl-bin     compile 0.61 0.61 0.59 0.58 0.62 -- avg = 0.602, sd = 1.6e-2
001-shl-bin     run     2.00 2.09 2.03 2.03 2.00 -- avg = 2.03, sd = 3.7e-2
[2/3] 002-add-bins
002-add-bins    compile 2.96 2.92 2.96 2.97 2.95 -- avg = 2.952, sd = 1.9e-2
002-add-bins    run     3.88 3.89 3.88 3.85 3.90 -- avg = 3.88, sd = 1.9e-2
[3/3] 003-palindrome    
003-palindrome  compile 1.50 1.52 1.52 1.52 1.51 -- avg = 1.514, sd = 9.0e-3
003-palindrome  run     0.11 0.13 0.12 0.12 0.10 -- avg = 0.116, sd = 1.1e-2
```
