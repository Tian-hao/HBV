#R code
library(vegan)
filenames <- list.files(path='../data/',pattern='.*_Seq')
for (filename in filenames){
  tmpname <- paste('../data/',filename,sep='')
  tmp <- read.table(tmpname,header=T)
  outname <- paste('../',filename,'.div',sep='')
  sink(outname)
  mut <- matrix(,nrow=4,ncol=1254)
  for (j in 1:4){
    for (i in 1:1254){
      mut[j,i] <- 0
    }
  }
  for (seq in tmp[,1]){
    for (i in 1:1254){
      if (substr(seq,i,i)=='A') mut[1,i] <- mut[1,i]+1
      if (substr(seq,i,i)=='C') mut[2,i] <- mut[2,i]+1
      if (substr(seq,i,i)=='T') mut[3,i] <- mut[3,i]+1
      if (substr(seq,i,i)=='G') mut[4,i] <- mut[4,i]+1
    }
  }
  for (i in 1:1254){
    ddd <- diversity(mut[,i])
    cat(i,ddd,'\n')
  }
}
