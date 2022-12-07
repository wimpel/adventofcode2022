library(data.table)
DT <- fread("./input/day07.txt", header = FALSE, col.names = "line", sep = "")

# part 1
# create paths
L <- list(path = as.character(rep("", nrow(DT))),
          size = as.numeric(rep(0, nrow(DT))))
for (i in seq.int(nrow(DT))) {
  # root dir
  if (DT$line[i] == "$ cd /") {L$path[i] <- "/";L$size[i] <- 0;next}
  # ls command
  if (DT$line[i] == "$ ls") {L$path[i] <- L$path[i-1];L$size[i] <- 0;next}
  # dir command
  if (grepl("dir", DT$line[i])) {L$path[i] <- L$path[i-1];L$size[i] <- 0;next}
  # file found
  if (grepl("^[0-9]", DT$line[i])) {L$path[i] <- L$path[i-1];L$size[i] <- as.numeric(gsub("^([0-9]+) .*", "\\1", DT$line[i]));next}
  # cd command
  if (grepl("^\\$ cd [a-z]", DT$line[i])) {L$path[i] <- paste0(L$path[i-1], gsub("^.*?([a-z]+)$", "\\1", DT$line[i]), "/");L$size[i] <- 0;next}
  # cd ..
    if (DT$line[i] == "$ cd ..") {L$path[i] <- gsub("^(.*?)[a-z]+\\/$", "\\1", L$path[i-1]);L$size[i] <- 0;next}
}
# bind together
allpaths <- setDT(dplyr::bind_rows(L))
# all unique paths
final <- data.table(path = unique(allpaths$path))
setkey(final, path)
# self join, summarise by eachi
final[final, filetotal := {
  # regex for path
  pattern = paste0("^", i.path)
  # subset allpaths
  filtered.data <- allpaths[grepl(pattern, path)]
  list(sum(filtered.data$size))
}, by = .EACHI]
# find dirs with value < 100000
final[filetotal <= 100000, .(sum(filetotal))]
# V1
# 1: 1908462

# part 2
total.space <- 70000000
space.needed <- 30000000
space.occupied <- total.space - final[path == "/", ]$filetotal
needed <- space.needed - space.occupied
final[, delta.needed := abs(needed - filetotal)]
final[delta.needed == min(delta.needed), filetotal]
#[1] 3979145