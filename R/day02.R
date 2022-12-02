library(data.table)
DT <- fread("./input/day02.txt", header = FALSE, col.names = c("p1", "p2"))

# part 1
# create lookup table
lookup <- data.table(code1 = c("A", "B", "C"),
                     code2 = c("X", "Y", "Z"),
                     name = c("rock", "paper", "scissors"),
                     value = 1:3)
# join values
DT[lookup, p1.name := i.name, on = .(p1 = code1)]
DT[lookup, p2.name := i.name, on = .(p2 = code2)]
DT[lookup, p2.val := i.value, on = .(p2 = code2)]
# calculate game score
#  tie
DT[p1.name == p2.name, game.val := 3]
#  loose
DT[(p1.name == "rock" & p2.name == "scissors") | 
     (p1.name == "paper" & p2.name == "rock") | 
     (p1.name == "scissors" & p2.name == "paper"), 
   game.val := 0]
#  win
DT[(p1.name == "rock" & p2.name == "paper") | 
     (p1.name == "paper" & p2.name == "scissors") | 
     (p1.name == "scissors" & p2.name == "rock"), 
   game.val := 6]
# calculate total score
sum(DT$p2.val + DT$game.val)
# [1] 13809

# part 2
# new lookup table
lookup2 <- data.table(code2 = c("X", "Y", "Z"),
                      outcome = c("lose", "draw", "win"),
                      value = c(0, 3, 6))
# read data again
DT <- fread("./input/day02.txt", header = FALSE, col.names = c("p1", "p2"))
# join in values
DT[lookup2, game.val := i.value, on = .(p2 = code2)]
# what did player 1 play?
DT[lookup, p1.name := i.name, on = .(p1 = code1)][]
# what did I play based on the outcome?
#  draw
DT[game.val == 3, p2.name := p1.name]
#  lose
DT[game.val == 0 & p1.name == "rock", p2.name := "scissors"]
DT[game.val == 0 & p1.name == "paper", p2.name := "rock"]
DT[game.val == 0 & p1.name == "scissors", p2.name := "paper"]
#  win
DT[game.val == 6 & p1.name == "rock", p2.name := "paper"]
DT[game.val == 6 & p1.name == "paper", p2.name := "scissors"]
DT[game.val == 6 & p1.name == "scissors", p2.name := "rock"]
# get value from p2.name
DT[lookup, p2.val := i.value, on = .(p2.name = name)][]
# calculate total score
sum(DT$p2.val + DT$game.val)
# 12316