# GCD-Project
This is for the Coursera class project "Getting and Cleaning Data"

The run_Analysis function is expecting to run in the same folder as "UCI HAR Dataset." 
The function begins by reading the features text file and creating a list of the rows that contain "mean()" or "std()" in it.
From there the function takes in the X_train.txt and X_test.txt files, provides column names, and removes all unnecessary columns.
After that it then uses rbind to create one table.

The next steps involve taking in the list of subjects and actions, creating a character vector of the actions, and making
these two lists the first two columns of the data table in the function itself.
<br>Note: It is assumed that the test subjects do not overlap with the train subjects, despite the numbering. Because of this
the numbering for the test subjects are 31-54.


