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
  action<-vector()
  for (i in Conditions) {
    action<-append(action,Verb[i])
  }
  print(length(action))
  print(length(Subjects))
  print(nrow(toReturn))
  toReturn<-cbind(action,toReturn)
  toReturn<-cbind(Subjects,toReturn)
  colnames(toReturn)
}