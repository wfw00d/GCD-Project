run_Analysis<-function() {
  #these first couple of lines read the initial data tables,
  #name the columns, and cut out the unwanted terciary information
  features<-read.csv("UCI HAR Dataset/features.txt",header=FALSE,sep=" ",stringsAsFactors = FALSE)
  meanStdList<-append(grep("mean()",features[,2],fixed=TRUE),grep("std()",features[,2],fixed=TRUE))
  test<-read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE,col.names=features[,2])
  test<-test[,meanStdList]
  train<-read.table("UCI HAR Dataset/train/X_train.txt",header=FALSE,col.names=features[,2])
  train<-train[,meanStdList]
  toReturn<-rbind(train,test)
  measurements<-colnames(toReturn)
  
  #the next couple lines take in the information about the subject and action
  Subject<-append(as.vector(read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE)[,1]),as.vector(read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE)[,1]))
  Conditions<-append(as.vector(read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE)[,1]),as.vector(read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE)[,1]))
  Verb<-as.vector(read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE)[,2])
  #a vector is created with the actions printed out rather than numbered so the data table can be more easily read
  Action<-vector()
  for (i in Conditions) {
    Action<-append(Action,Verb[i])
  }
  
  #the Subject and Action columns are added
  toReturn<-cbind(Action,toReturn)
  toReturn<-cbind(Subject,toReturn)
  
  #the final data frame is created the tedious way of nested for loops, first to create a data frame of the correct number
  #of rows with the observation column
  toReturn2<-c()
  for (i in 1:30) {
    for (j in Verb) {
      toReturn2<-append(toReturn2,i)
    } 
  } 
  toReturn2<-data.frame(Observation=toReturn2)
  #and action column
  for (i in 0:179) {
    toReturn2[i+1,2]<-Verb[(i %% 6) +1]
  
    #now the next set of nested for loops iterates through the original data frame and calculates the mean values

  }
  for (i in 1:180) {
    if (!(i%%6==0)){
      for (j in 3:(ncol(toReturn))) {
        toReturn2[i,j]<-mean(toReturn[as.character(toReturn$Action)==Verb[i%%6] & toReturn$Subject==(((i-1)%/%6)+1),j])
      } 
    } else {
      for (j in 3:(ncol(toReturn))) {
        toReturn2[i,j]<-mean(toReturn[as.character(toReturn$Action)==Verb[6] & toReturn$Subject==(((i-1)%/%6)+1),j])
        
      }
    }
  }
  colnames(toReturn2)<-append(c("Subject","Action"),measurements)
  toReturn2
}
