## Some benchmarks

* HTML output with charts:
  * http://ziman.functor.sk/erasure-bm/
  * http://ziman.functor.sk/erasure-bm-big/

* Everything is in seconds.

* Build options: `-fgmp -fFFI`

### master

```
[1/3] 001-shl-bin
001-shl-bin	compile	0.50 0.54 0.52 0.52 0.52 -- avg = 0.52, sd = 1.4e-2
001-shl-bin	run	TIMEOUT TIMEOUT TIMEOUT TIMEOUT TIMEOUT -- 
[2/3] 002-add-bins
002-add-bins	compile	2.38 2.36 2.37 2.37 2.37 -- avg = 2.37, sd = 7.0e-3
002-add-bins	run	4.21 4.19 4.22 4.21 4.22 -- avg = 4.21, sd = 1.2e-2
[3/3] 003-palindrome
003-palindrome	compile	1.27 1.31 1.29 1.31 1.30 -- avg = 1.296, sd = 1.7e-2
003-palindrome	run	TIMEOUT TIMEOUT TIMEOUT TIMEOUT TIMEOUT -- 
```

`TIMEOUT` = 30 seconds or more

### erasure

```
[1/3] 001-shl-bin
001-shl-bin	compile	0.57 0.54 0.57 0.56 0.56 -- avg = 0.56, sd = 1.2e-2
001-shl-bin	run	1.90 1.90 1.90 1.91 1.90 -- avg = 1.902, sd = 4.0e-3
[2/3] 002-add-bins
002-add-bins	compile	2.48 2.55 2.49 2.50 2.52 -- avg = 2.508, sd = 2.8e-2
002-add-bins	run	3.81 3.78 3.86 3.81 4.09 -- avg = 3.87, sd = 0.126
[3/3] 003-palindrome
003-palindrome	compile	1.39 1.39 1.39 1.41 1.39 -- avg = 1.394, sd = 9.0e-3
003-palindrome	run	0.11 0.12 0.11 0.12 0.10 -- avg = 0.112, sd = 8.0e-3
```
