run_Analysis<-function() {
  
  features<-read.csv("features.txt",header=FALSE,sep=" ")
  meanStdList<-append(grep("mean()",features[,2]),grep("std()",features[,2]))
  test<-read.table("./test/X_test.txt",header=FALSE,col.names=features[,2])
  test<-test[,meanStdList]
  train<-read.table("train/X_train.txt",header=FALSE,col.names=features[,2])
  train<-train[,meanStdList]
  toReturn<-rbind(train,test)
  
  Subjects<-append(as.vector(read.table("train/subject_train.txt",header=FALSE)[,1]),30 + as.vector(read.table("test/subject_test.txt",header=FALSE)[,1]))
  Conditions<-append(as.vector(read.table("train/y_train.txt",header=FALSE)[,1]),as.vector(read.table("test/y_test.txt",header=FALSE)[,1]))
  Verb<-as.vector(read.table("activity_labels.txt",header=FALSE)[,2])
  People<-c("Person A","Person B","Person C","Person D","Person E","Person F","Person G","Person H","Person I","Person J","Person K","Person L","Person M","Person N","Person O","Person P","Person Q","Person R","Person S","Person T","Person U","Person V","Person W","Person X","Person Y","Person Z","Person AA","Person BB","Person CC","Person DD","Person EE","Person FF","Person GG","Person HH","Person II","Person JJ","Person KK","Person LL","Person MM","Person NN","Person OO","Person PP","Person QQ","Person RR","Person SS","Person TT","Person UU","Person VV","Person WW","Person XX","Person YY","Person ZZ","Person AAA","Person BBB")
  colnames(toReturn)
}