library(data.table)

str <- readLines("./input/day06.txt")

# fundtion to find the correct value
find_end_char <- function(str, n) {
  L <- lapply(seq.int(nchar(str) - n - 1), function(x) substr(str, x, x + n - 1))
  return(match(n, lapply(L, function(x) sum(!!stringr::str_count(x, letters)))) + n - 1)
}

find_end_char(str, 4)  # part 1
find_end_char(str, 14) # part 2
