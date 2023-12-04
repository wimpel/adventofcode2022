library(data.table)
# day 10 
# test

# read input
#DT <- fread("./input/day10_test.txt", sep = "", header = FALSE, col.names = c("input"))
DT <- fread("./input/day10.txt", sep = "", header = FALSE, col.names = c("input"))
###########
# PART 1
###########
DT[, id := .I][]
# split values if any
DT[, c("text", "add") := tstrsplit(input, " ", fill = 0, type.convert = TRUE)][, input := NULL][]
# add columns for cycles
DT[, c("c1", "c2") := NA_integer_][]
# melt
DT <- melt(DT, id.vars = c("id", "text", "add"), value.name = "cycle")
setkey(DT, id, variable)
DT <- DT[!(text == "noop" & variable == "c2"), ]
DT[, cycle := .I][]

# add start
#DT <- rbindlist(list(data.table(id = 0, text = "", add = 0, variable = "c1", cycle = 0, X = 1), DT), use.names = TRUE, fill = TRUE)
# 
DT[, duringX := NA_integer_]
DT[1, duringX := 0][]
# initialise
#DT[!duplicated(id), addX := shift(DT[, add[.N], by=id]$V1)[.GRP], by = id]
DT[variable == "c2", addX := add]
DT[is.na(addX), addX := 0][]
DT[1, addX := 1][]
DT[, finalX := cumsum(addX)]
DT[2:nrow(DT), duringX := c(1,shift(finalX)[2:.N])][]
#DT[, X := 1 + cumsum(addX)]
# cycles
cycles <- c(20,60,100,140,180,220)
# output
DT[cycles, sum(cycle * duringX)]


###########
# PART 2
###########
n = 40
matrix(1:nrow(DT), ncol = n, byrow = TRUE)
m <- matrix()

#DT[, pixelpos := duringX %% n]
DT[, row := ceiling(cycle / n)]
DT[, pixelpos := cycle - (row - 1) * n - 1]
DT[, pixel := "."]
DT[duringX >= pixelpos - 1 & duringX <= pixelpos + 1, pixel := "#"]


m <- matrix(DT$pixel, ncol = n, byrow = TRUE)
apply(m, 1, paste0, collapse = "")
