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
001-shl-bin     compile 0.63 0.63 0.64 0.63 0.65 -- avg = 0.636, sd = 9.0e-3
001-shl-bin     run     2.13 2.08 2.07 2.06 2.08 -- avg = 2.084, sd = 2.7e-2
[2/3] 002-add-bins
002-add-bins    compile 3.06 3.04 3.04 3.06 3.05 -- avg = 3.05, sd = 1.0e-2
002-add-bins    run     3.88 3.90 3.89 4.14 3.86 -- avg = 3.934, sd = 0.116
[3/3] 003-palindrome    
003-palindrome  compile 1.57 1.60 1.59 1.60 1.56 -- avg = 1.584, sd = 1.8e-2
003-palindrome  run     0.10 0.09 0.12 0.09 0.11 -- avg = 0.102, sd = 1.3e-2
```
