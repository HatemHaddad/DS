complete <- function(directory, id = 1:332) {
    files <- list.files(directory,full.name = TRUE)
    tmp <- vector(mode = "list", length = length(files))
    tmp2 <- vector(mode = "list", length = length(files))
    
    for(i in seq_along(files)) {
        tmp[[i]] <- table(complete.cases(read.csv(files[[i]])))
        tmp2[[i]] <- complete.cases(read.csv(files[[i]]))
    }
    output <- data.frame(do.call(rbind,tmp))
    x <- output[id,2]
    w <- data.frame(id = id, nobs = x)
    return(w)
}