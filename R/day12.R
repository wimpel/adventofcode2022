# Sabqponm
# abcryxxl
# accszExk
# acctuvwj
# abdefghi

library(data.table)
library(igraph)
input <- data.table::fread("Sabqponm
abcryxxl
accszExk
acctuvwj
abdefghi", header = FALSE)
input <- data.table::fread("./input/day12.txt", header = FALSE)

# parse input to a long datatable with col, row and value
m <- matrix(unlist(tstrsplit(input$V1, split = "")), nrow = nrow(input))
DT <- setDT(reshape2::melt(m))
setnames(DT, c("row", "col", "letter"))
# lookup table for numbervalue
lookup <- data.table(letter = c("S", letters[1:26], "E"), letterwaarde = 0:27)
# find neighbours
DT[lookup, celwaarde := i.letterwaarde, on = .(letter = letter)]
DT[, celid := .I]
DT[, celnaam := paste0("r",row, "c", col)]
DT[, `:=`(buurcel1 = paste0("r",row, "c", col-1),
          buurcel2 = paste0("r",row, "c", col+1),
          buurcel3 = paste0("r",row-1, "c", col),
          buurcel4 = paste0("r",row+1, "c", col))]
DT2 <- melt(DT, measure.vars = patterns("^buurcel[0-9]"), value.name = "buurnaam")
DT2 <- DT2[buurnaam %in% DT$celnaam, ]
DT2[DT, buurwaarde := i.celwaarde, on = .(buurnaam = celnaam)]
DT2[DT, buurid := i.celid, on = .(buurnaam = celnaam)]
DT2 <- DT2[(buurwaarde - celwaarde) <= 1, ]

verts <- DT[, .(celid, letter)]
nodes <- DT2[, .(from = celid, to = buurid)]

g <- graph_from_data_frame(nodes, directed = TRUE, vertices = verts)

# shortest_paths(g, from = V(g)[V(g)$letter == "S"], 
#                to = V(g)[V(g)$letter == "E"], 
#                weights = NULL, mode = "out")$vpath


lengths(shortest_paths(g, from = V(g)[V(g)$letter == "S"], 
               to = V(g)[V(g)$letter == "E"], 
               weights = NULL, mode = "out")$vpath) - 1

#########
# part 2
#########

solution <- sapply( as.numeric(V(g)[V(g)$letter == "a"]), function(x) {
  lengths(shortest_paths(g, from = V(g)[x], 
                         to = V(g)[V(g)$letter == "E"], 
                         weights = NULL, mode = "out")$vpath) - 1
})

min(solution[solution > 0])



