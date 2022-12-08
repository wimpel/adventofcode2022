library(data.table)
# read and parse data
temp <- fread("./input/day08.txt", header = FALSE, sep = "")
DT <- setDT(lapply(tstrsplit(temp$V1, ""), as.numeric))

# part 1
# from top
top <- DT[, lapply(.SD, function(x) !duplicated(cummax(x)))]
# from bottom
bottom <- DT[nrow(DT):1, lapply(.SD, function(x) !duplicated(cummax(x)))][nrow(DT): 1, ]
# from left
left <- transpose(transpose(DT)[, lapply(.SD, function(x) !duplicated(cummax(x)))])
# from right
right <- transpose(transpose(DT)[nrow(DT):1, lapply(.SD, function(x) !duplicated(cummax(x)))][nrow(DT): 1, ])
# calculate final answer
sum((top + bottom + left + right) > 0)

# part 2
# custom function
calculated <- function(x) {
  sapply(seq.int(length(x)), function(i) {
    val <- x[i]
    check.v <- x[(i+1):nrow(DT)]
    ans <- suppressWarnings(min(which(check.v >= val, arr.ind = TRUE)))
    if(is.infinite(ans)) length(check.v) else ans
  })
}
# looking down
down <- DT[, lapply(.SD, calculated)]
down[nrow(down), ] <- 0
# looking up
up <- DT[nrow(DT):1, lapply(.SD, calculated)]
up[nrow(up), ] <- 0
up <- up[nrow(DT):1, ]
# looking left >> right
left <- transpose(DT)[, lapply(.SD, calculated)]
left[nrow(left), ] <- 0
left <- transpose(left)
# looking right >> left
right <- transpose(DT)[nrow(DT):1, lapply(.SD, calculated)]
right[nrow(right), ] <- 0
right <- transpose(right[nrow(DT):1,])
# calculate final answer
max(down * up * left * right)


