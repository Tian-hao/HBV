#R code
library(vegan)
filenames <- list.files(path='../data/',pattern='.*_Seq')
sink('../diversity.txt')
for (filename in filenames){
  tmpname <- paste('../data/',filename,sep='')
  tmp <- read.table(tmpname,header=T)
  ddd <- diversity(tmp[,2])
  cat(filename,'\t',ddd,'\n',sep='')
}    
for (filename in filenames){
  tmpname <- paste('../data/',filename,sep='')
  tmp <- read.table(tmpname,header=T)
  ddd <- diversity(tmp[,3])
  cat(filename,'\t',ddd,'\n',sep='')
}
