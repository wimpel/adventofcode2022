library(data.table)
DT <- fread("./input/day04.txt", header = FALSE, col.names = c("task1", "task2"))

# part 1
# split columns
DT[, c("from1", "to1") := lapply(tstrsplit(task1, "-"), as.numeric)]
DT[, c("from2", "to2") := lapply(tstrsplit(task2, "-"), as.numeric)]
# find and count overlaps
nrow(DT[(from1 >= from2 & to1 <= to2) | from2 >= from1 & to2 <= to1, ])
# 453

# part 2
nrow(DT[(to1 >= from2 & from1 <= to2) | (to2 >= from1 & from2 <= to1), ])
#[1] 919