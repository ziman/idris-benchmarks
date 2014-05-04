#!/usr/bin/R -f

generate <- function(bname)
{
    xs <- read.table(paste('tmp/', bname, '-runtime.txt', sep=''), h=T)
    print(xs)
}

for (bname in c("001-shl-bin", "002-add-bins", "003-palindrome"))
{
    generate(bname)
}
