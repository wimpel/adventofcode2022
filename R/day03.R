library(data.table)
# read data
DT <- fread("./input/day03.txt", header = FALSE, col.names = "contents")

# part 1
# cut strings in halves
DT[, `:=`(part1 = substr(contents, 1, nchar(contents)/2),
          part2 = substr(contents, nchar(contents)/2+1, nchar(contents)))][]
DT[, common := sapply(seq.int(nrow(DT)), function(i) {
  intersect(unlist(strsplit(DT$part1[i], "")), unlist(strsplit(DT$part2[i], "")))
})][]
# create lookup table with values
lookup <- data.table(letter = c(letters[1:26], LETTERS[1:26]),
                     value = 1:52)
# join values
DT[lookup, value := i.value, on = .(common = letter)][]
# sum
sum(DT$value)
#[1] 7428

#part 2
# create groups of 3, put contents in a list
DT.grouped <- DT[,.(contents = list(contents)), by = ((0:(nrow(DT)-1)) %/% 3) + 1][]
# find common letter of each group
DT.grouped[, common := sapply(contents, function(x) Reduce(intersect, strsplit(x, "")))][]
# join to lookup
DT.grouped[lookup, value := i.value, on = .(common = letter)][]
# sum
sum(DT.grouped$value)
#[1] 2650