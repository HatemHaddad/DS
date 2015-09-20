pollutantmean <- function(directory,pollutant, id = 1:332) {
    files <- list.files(directory,full.name = TRUE)
    dat <- data.frame()
    x <- length(files)
    for(i in 1:x){
     dat <- rbind(dat, read.csv(files[i]))   
    }
    dat_subset <- dat[which(dat[,"ID"] %in% id),]
    mean(dat_subset[,pollutant],na.rm = TRUE)
}