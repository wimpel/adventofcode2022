library(data.table)
#         [F] [Q]         [Q]        
# [B]     [Q] [V] [D]     [S]        
# [S] [P] [T] [R] [M]     [D]        
# [J] [V] [W] [M] [F]     [J]     [J]
# [Z] [G] [S] [W] [N] [D] [R]     [T]
# [V] [M] [B] [G] [S] [C] [T] [V] [S]
# [D] [S] [L] [J] [L] [G] [G] [F] [R]
# [G] [Z] [C] [H] [C] [R] [H] [P] [D]
#  1   2   3   4   5   6   7   8   9 

# read moves
moves <- fread("./input/day05.txt", skip = 10, sep = "", header = FALSE, col.names = "input")
# extract numeric values from moves 
moves[, c("number", "from", "to") := transpose(lapply(stringr::str_extract_all(moves$input, "\\d+"), as.numeric))]

# part 1
#manually enter starting situation
L <- sapply(list("GDVZJSB", "ZSMGVP", "CLBSWTQF", "HJGWMRVQ", "CLSNFMD", "RGCD", "HGTRJDSQ", "PFV", "DRFSTJ"),
            strsplit, "")
# loop over the moves, update L in the process
for (i in seq.int(nrow(moves))) {
  from <- L[[moves$from[i]]]
  to <- L[[moves$to[i]]]
  move.part <- rev(tail(from, moves$number[i]))
  new.to <- c(to, move.part)
  new.from <- head(from, -moves$number[i])
  L[[moves$from[i]]] <- new.from
  L[[moves$to[i]]] <- new.to
}
# get the last entry of each list element
paste0(sapply(L, tail, 1), collapse = "")
# "WCZTHTMPS"

# part 2
#manually enter starting situation
L <- sapply(list("GDVZJSB", "ZSMGVP", "CLBSWTQF", "HJGWMRVQ", "CLSNFMD", "RGCD", "HGTRJDSQ", "PFV", "DRFSTJ"),
            strsplit, "")
# loop over the moves, update L in the process
for (i in seq.int(nrow(moves))) {
  from <- L[[moves$from[i]]]
  to <- L[[moves$to[i]]]
  move.part <- tail(from, moves$number[i])
  new.to <- c(to, move.part)
  new.from <- head(from, -moves$number[i])
  L[[moves$from[i]]] <- new.from
  L[[moves$to[i]]] <- new.to
}
# get the last entry of each list element
paste0(sapply(L, tail, 1), collapse = "")
# "BLSGJSDTS"


L <- sapply(list("ZN", "MCD", "P"), strsplit, "")
# [[1]]
# [1] "Z" "N"
# 
# [[2]]
# [1] "M" "C" "D"
# 
# [[3]]
# [1] "P"


