library(data.table)
# read in data privided
DT <- fread("./input/day01.txt", header = FALSE, col.names = "calories")

# part 1
# create an elf id to group on
DT[, id.elf := rleid(is.na(calories))]
# calculate sum
max(DT[!is.na(calories), .(total = sum(calories)), by = .(id.elf)]$total)
#[1] 67633

# part 2
DT.sum <- DT[!is.na(calories), .(total = sum(calories)), by = .(id.elf)]
sum(DT.sum[order(total, decreasing = TRUE), total[1:3]])
# [1] 199628