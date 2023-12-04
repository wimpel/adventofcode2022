# Monkey 0:
#   Starting items: 79, 98
# Operation: new = old * 19
# Test: divisible by 23
# If true: throw to monkey 2
# If false: throw to monkey 3
# 
# Monkey 1:
#   Starting items: 54, 65, 75, 74
# Operation: new = old + 6
# Test: divisible by 19
# If true: throw to monkey 2
# If false: throw to monkey 0
# 
# Monkey 2:
#   Starting items: 79, 60, 97
# Operation: new = old * old
# Test: divisible by 13
# If true: throw to monkey 1
# If false: throw to monkey 3
# 
# Monkey 3:
#   Starting items: 74
# Operation: new = old + 3
# Test: divisible by 17
# If true: throw to monkey 0
# If false: throw to monkey 1


########################################
# Monkey 0:
#   Starting items: 63, 84, 80, 83, 84, 53, 88, 72
# Operation: new = old * 11
# Test: divisible by 13
# If true: throw to monkey 4
# If false: throw to monkey 7
m0 <- c(63, 84, 80, 83, 84, 53, 88, 72)
f0 <- function(x) {
  m0l <<- m0l + length(m0)
  newval <- floor((x * 11) / 3)
  newlog <- newval %% 13 == 0
  m4 <<- c(m4, newval[newlog == TRUE])
  m7 <<- c(m7, newval[newlog == FALSE])
}
# Monkey 1:
#   Starting items: 67, 56, 92, 88, 84
# Operation: new = old + 4
# Test: divisible by 11
# If true: throw to monkey 5
# If false: throw to monkey 3
# 
m1 <- c(67, 56, 92, 88, 84)
f1 <- function(x) {
  m1l <<- m1l + length(m1)
  newval <- floor((x  + 4) / 3)
  newlog <- newval %% 11 == 0
  m5 <<- c(m5, newval[newlog == TRUE])
  m3 <<- c(m3, newval[newlog == FALSE])
}
# Monkey 2:
#   Starting items: 52
# Operation: new = old * old
# Test: divisible by 2
# If true: throw to monkey 3
# If false: throw to monkey 1
#
m2 <- c(52)
f2 <- function(x) {
  m2l <<- m2l + length(m2)
  newval <- floor((x * x) / 3)
  newlog <- newval %% 2 == 0
  m3 <<- c(m3, newval[newlog == TRUE])
  m1 <<- c(m1, newval[newlog == FALSE])
}
# Monkey 3:
#   Starting items: 59, 53, 60, 92, 69, 72
# Operation: new = old + 2
# Test: divisible by 5
# If true: throw to monkey 5
# If false: throw to monkey 6
# 
m3 <- c(59, 53, 60, 92, 69, 72)
f3 <- function(x) {
  m3l <<- m3l + length(m3)
  newval <- floor((x  + 2) / 3)
  newlog <- newval %% 5 == 0
  m5 <<- c(m5, newval[newlog == TRUE])
  m6 <<- c(m6, newval[newlog == FALSE])
}
# Monkey 4:
#   Starting items: 61, 52, 55, 61
# Operation: new = old + 3
# Test: divisible by 7
# If true: throw to monkey 7
# If false: throw to monkey 2
# 
m4 <- c(61, 52, 55, 61)
f4 <- function(x) {
  m4l <<- m4l + length(m4)
  newval <- floor((x  + 3) / 3)
  newlog <- newval %% 7 == 0
  m7 <<- c(m7, newval[newlog == TRUE])
  m2 <<- c(m2, newval[newlog == FALSE])
}
# Monkey 5:
#   Starting items: 79, 53
# Operation: new = old + 1
# Test: divisible by 3
# If true: throw to monkey 0
# If false: throw to monkey 6
# 
m5 <- c(79, 53)
f5 <- function(x) {
  m5l <<- m5l + length(m5)
  newval <- floor((x  + 1) / 3)
  newlog <- newval %% 3 == 0
  m0 <<- c(m0, newval[newlog == TRUE])
  m6 <<- c(m6, newval[newlog == FALSE])
}
# Monkey 6:
#   Starting items: 59, 86, 67, 95, 92, 77, 91
# Operation: new = old + 5
# Test: divisible by 19
# If true: throw to monkey 4
# If false: throw to monkey 0
m6 <- c(59, 86, 67, 95, 92, 77, 91)
f6 <- function(x) {
  m6l <<- m6l + length(m6)
  newval <- floor((x  + 5) / 3)
  newlog <- newval %% 19 == 0
  m4 <<- c(m4, newval[newlog == TRUE])
  m0 <<- c(m0, newval[newlog == FALSE])
}
# Monkey 7:
#   Starting items: 58, 83, 89
# Operation: new = old * 19
# Test: divisible by 17
# If true: throw to monkey 2
# If false: throw to monkey 1
m7 <- c(58, 83, 89)
f7 <- function(x) {
  m7l <<- m7l + length(m7)
  newval <- floor((x * 19) / 3)
  newlog <- newval %% 17 == 0
  m2 <<- c(m2, newval[newlog == TRUE])
  m1 <<- c(m1, newval[newlog == FALSE])
}

m0l <- 0
m1l <- 0
m2l <- 0
m3l <- 0
m4l <- 0
m5l <- 0
m6l <- 0
m7l <- 0

for (i in 1:20) {
f0(m0)
m0 <- NULL
f1(m1)
m1 <- NULL
f2(m2)
m2 <- NULL
f3(m3)
m3 <- NULL
f4(m4)
m4 <- NULL
f5(m5)
m5 <- NULL
f6(m6)
m6 <- NULL
f7(m7)
m7 <- NULL
}

m0l; m1l; m2l; m3l;m4l; m4l; m6l; m7l

346*340

#####################
# PART 2
#####################
# Monkey 0:
#   Starting items: 79, 98
# Operation: new = old * 19
# Test: divisible by 23
# If true: throw to monkey 2
# If false: throw to monkey 3
# 
# Monkey 1:
#   Starting items: 54, 65, 75, 74
# Operation: new = old + 6
# Test: divisible by 19
# If true: throw to monkey 2
# If false: throw to monkey 0
# 
# Monkey 2:
#   Starting items: 79, 60, 97
# Operation: new = old * old
# Test: divisible by 13
# If true: throw to monkey 1
# If false: throw to monkey 3
# 
# Monkey 3:
#   Starting items: 74
# Operation: new = old + 3
# Test: divisible by 17
# If true: throw to monkey 0
# If false: throw to monkey 1


########################################
# Monkey 0:
#   Starting items: 63, 84, 80, 83, 84, 53, 88, 72
# Operation: new = old * 11
# Test: divisible by 13
# If true: throw to monkey 4
# If false: throw to monkey 7
m0 <- c(63, 84, 80, 83, 84, 53, 88, 72)
f0 <- function(x) {
  m0l <<- m0l + length(m0)
  newval <- floor((x * 11) )
  newlog <- newval %% 13 == 0
  m4 <<- c(m4, newval[newlog == TRUE])
  m7 <<- c(m7, newval[newlog == FALSE])
}
# Monkey 1:
#   Starting items: 67, 56, 92, 88, 84
# Operation: new = old + 4
# Test: divisible by 11
# If true: throw to monkey 5
# If false: throw to monkey 3
# 
m1 <- c(67, 56, 92, 88, 84)
f1 <- function(x) {
  m1l <<- m1l + length(m1)
  newval <- floor((x  + 4) )
  newlog <- newval %% 11 == 0
  m5 <<- c(m5, newval[newlog == TRUE])
  m3 <<- c(m3, newval[newlog == FALSE])
}
# Monkey 2:
#   Starting items: 52
# Operation: new = old * old
# Test: divisible by 2
# If true: throw to monkey 3
# If false: throw to monkey 1
#
m2 <- c(52)
f2 <- function(x) {
  m2l <<- m2l + length(m2)
  newval <- floor((x * x) )
  newlog <- newval %% 2 == 0
  m3 <<- c(m3, newval[newlog == TRUE])
  m1 <<- c(m1, newval[newlog == FALSE])
}
# Monkey 3:
#   Starting items: 59, 53, 60, 92, 69, 72
# Operation: new = old + 2
# Test: divisible by 5
# If true: throw to monkey 5
# If false: throw to monkey 6
# 
m3 <- c(59, 53, 60, 92, 69, 72)
f3 <- function(x) {
  m3l <<- m3l + length(m3)
  newval <- floor((x  + 2) )
  newlog <- newval %% 5 == 0
  m5 <<- c(m5, newval[newlog == TRUE])
  m6 <<- c(m6, newval[newlog == FALSE])
}
# Monkey 4:
#   Starting items: 61, 52, 55, 61
# Operation: new = old + 3
# Test: divisible by 7
# If true: throw to monkey 7
# If false: throw to monkey 2
# 
m4 <- c(61, 52, 55, 61)
f4 <- function(x) {
  m4l <<- m4l + length(m4)
  newval <- floor((x  + 3) )
  newlog <- newval %% 7 == 0
  m7 <<- c(m7, newval[newlog == TRUE])
  m2 <<- c(m2, newval[newlog == FALSE])
}
# Monkey 5:
#   Starting items: 79, 53
# Operation: new = old + 1
# Test: divisible by 3
# If true: throw to monkey 0
# If false: throw to monkey 6
# 
m5 <- c(79, 53)
f5 <- function(x) {
  m5l <<- m5l + length(m5)
  newval <- floor((x  + 1) )
  newlog <- newval %% 3 == 0
  m0 <<- c(m0, newval[newlog == TRUE])
  m6 <<- c(m6, newval[newlog == FALSE])
}
# Monkey 6:
#   Starting items: 59, 86, 67, 95, 92, 77, 91
# Operation: new = old + 5
# Test: divisible by 19
# If true: throw to monkey 4
# If false: throw to monkey 0
m6 <- c(59, 86, 67, 95, 92, 77, 91)
f6 <- function(x) {
  m6l <<- m6l + length(m6)
  newval <- floor((x  + 5) )
  newlog <- newval %% 19 == 0
  m4 <<- c(m4, newval[newlog == TRUE])
  m0 <<- c(m0, newval[newlog == FALSE])
}
# Monkey 7:
#   Starting items: 58, 83, 89
# Operation: new = old * 19
# Test: divisible by 17
# If true: throw to monkey 2
# If false: throw to monkey 1
m7 <- c(58, 83, 89)
f7 <- function(x) {
  m7l <<- m7l + length(m7)
  newval <- floor((x * 19) )
  newlog <- newval %% 17 == 0
  m2 <<- c(m2, newval[newlog == TRUE])
  m1 <<- c(m1, newval[newlog == FALSE])
}

m0l <- 0
m1l <- 0
m2l <- 0
m3l <- 0
m4l <- 0
m5l <- 0
m6l <- 0
m7l <- 0

pb = txtProgressBar(min = 0, max = 10000, initial = 0) 

for (i in 1:10000) {
  f0(m0)
  m0 <- NULL
  f1(m1)
  m1 <- NULL
  f2(m2)
  m2 <- NULL
  f3(m3)
  m3 <- NULL
  f4(m4)
  m4 <- NULL
  f5(m5)
  m5 <- NULL
  f6(m6)
  m6 <- NULL
  f7(m7)
  m7 <- NULL
  print(i)
}

m0l; m1l; m2l; m3l;m4l; m4l; m6l; m7l




