library(data.table)
library(tictoc)
# read in data provided
tic()
DT <- fread("./input/aoc_2022_day01_large_input.txt", header = FALSE, col.names = "calories")
toc()
# 0.92 sec elapsed

tic()
# part 1
# create an elf id to group by
DT[, id.elf := rleid(is.na(calories))]
# calculate sum
max(DT[!is.na(calories), .(total = sum(calories)), by = .(id.elf)]$total)
toc()
#[1] 67633
# 3.25 sec elapsed

tic()
# part 2
# order the data.table with summed totala in decreasing order
DT.sum <- DT[!is.na(calories), .(total = sum(calories)), by = .(id.elf)]
# take the top 3, and sum
sum(DT.sum[order(total, decreasing = TRUE), total[1:3]])
# [1] 199628
toc()
# 8.43 sec elapsed