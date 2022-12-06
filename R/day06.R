library(data.table)
library(tictoc)

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


tic("brute-force part 1")
find_end_char(str, 4)  # part 1 >> 1093
tic("brute-force part 2")
find_end_char(str, 14) # part 2 >> 3534
tic("while part 1")
find_end_char2(str, 4)
tic("while part 1")
find_end_char2(str, 14)
tic("substring 1")
find_end_char3(str, 4)
tic("substring 1")
find_end_char3(str, 14)
toc()
toc()
toc()
toc()
toc()
toc()
