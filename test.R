corr <- function(directory, threshold = 0) {
    # list all files in a directory.
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

l <- length(cases)
va <- vector(mode = "integer", length = l)

files <- list.files("specdata", full.names = TRUE)
for(i in seq_along(cases)) {
    
v <- read.csv(files[cases[i]]) 
ccc <- complete.cases(v)
xx <- v[ccc==TRUE, 2:3]
va[i] <- as.vector(cor(xx))[3]
}
va <- va[!is.na(va)]
}
