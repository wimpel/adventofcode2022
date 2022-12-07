library(data.table)
library(tictoc)
library(RcppRoll)
str <- readLines("./input/day06.txt")

# fundtion to find the correct value
find_end_char <- function(str, n) {
  L <- lapply(seq.int(nchar(str) - n + 1), function(x) substr(str, x, x + n - 1))
  return(match(n, lapply(L, function(x) sum(!!stringr::str_count(x, letters)))) + n - 1)
}

find_end_char2 <- function(str, n) {
  i = 1
  while(!sum(!!stringr::str_count(substr(str, i, i + n - 1), letters)) == n) {
    i <- i + 1
  }
  return(i + n - 1)
}

allsubstr <- function(x, n) substring(x, 1:(nchar(x) - n + 1), n:nchar(x))
find_end_char3 <- function(str, n) match(n, lapply(strsplit(allsubstr(str, n),""), function(x) length(unique(x)))) + n - 1

find_end_char4 <- function(str, n) {
  match(n, frollapply(x = as.numeric(charToRaw(str)), n = n, FUN = uniqueN))
}

find_end_char4(str, 4)

microbenchmark::microbenchmark(
  brute_force_list = find_end_char(str, 14),
  while_loop = find_end_char2(str, 14),
  strsplit = find_end_char3(str, 14),
  rollapply = find_end_char4(str, 14),
  times = 3L)

