#R code
library(vegan)
filenames <- list.files(path='../data/',pattern='.*_Seq')
for (filename in filenames){
  tmpname <- paste('../data/',filename,sep='')
  tmp <- read.table(tmpname,header=T)
  outname <- paste('../',filename,'.div',sep='')
  sink(outname)
  mutp <- matrix(,nrow=4,ncol=1254)
  for (j in 1:4){
    for (i in 1:1254){
      mutp[j,i] <- 0
    }
  }
  mutc <- matrix(,nrow=4,ncol=1254)
  for (j in 1:4){
    for (i in 1:1254){
      mutc[j,i] <- 0
    }
  }
  for (seq in tmp[,1]){
    for (i in 1:1254){
      if (substr(seq,i,i)=='A') {
        mutp[1,i] <- mutp[1,i]+tmp[tmp[,1]==seq,2]
	mutc[1,i] <- mutc[1,i]+tmp[tmp[,1]==seq,3]
      }
      if (substr(seq,i,i)=='C') {
        mutp[2,i] <- mutp[2,i]+tmp[tmp[,1]==seq,2]
	mutc[2,i] <- mutc[2,i]+tmp[tmp[,1]==seq,3]
      }
      if (substr(seq,i,i)=='T') {
        mutp[3,i] <- mutp[3,i]+tmp[tmp[,1]==seq,2]
	mutc[3,i] <- mutc[3,i]+tmp[tmp[,1]==seq,3]
      }
      if (substr(seq,i,i)=='G') {
        mutp[4,i] <- mutp[4,i]+tmp[tmp[,1]==seq,2]
	mutc[4,i] <- mutc[4,i]+tmp[tmp[,1]==seq,3]
      }
    }
  }
  for (i in 1:1254){
    ddd <- diversity(mutp[,i])
    ddc <- diversity(mutc[,i])
    cat(i,ddd,ddc,'\n')
  }
}
