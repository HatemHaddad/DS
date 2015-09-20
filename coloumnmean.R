coloumnmean <- function(x) {
    
    nc <- ncol(x)
    means <- numeric(nc)
    for(i in 1:nc) {
        means[i] <- mean(x[,i])
    }
    means
}