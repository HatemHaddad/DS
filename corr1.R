corr <- function(directory,threshold = 0) {
    files <- list.files(directory,full.name = TRUE)
    tmp <- vector(mode = "list", length = length(files))
    
    for(i in seq_along(files)) {
        tmp[[i]] <- table(complete.cases(read.csv(files[[i]])))
    }
    output <- data.frame(do.call(rbind,tmp))
    x <- output[,2]
    w <- data.frame(id = 1:332, nobs = x)
    ww <- w[w$nobs > threshold , ]
    cases <- ww$id
    
    # Paert 1
    l <- length(cases)
    va <- vector(mode = "integer", length = l)
    
    for(i in seq_along(cases)) {
        
        v <- read.csv(files[cases[i]]) 
        ccc <- complete.cases(v)
        xx <- v[ccc==TRUE, 2:3]
        a[i] <- as.vector(cor(xx))[2]
        
    }
    

}
