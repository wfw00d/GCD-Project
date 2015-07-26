# GCD-Project
This is for the Coursera class project "Getting and Cleaning Data"
##Part 1
The run_Analysis function is expecting to run in the same folder as "UCI HAR Dataset." 
The function begins by reading the features text file and creating a list of the rows that contain "mean()" or "std()" in it.
From there the function takes in the X_train.txt and X_test.txt files, provides column names, and removes all unnecessary columns.
After that it then uses rbind to create one table.<br>
###Note:
The column labels are pulled from the features.txt file and will have more info provided by the codebook.  That is what 
I believe to be the purpose of the codebook as filling the function with manually inputted column names is incredibly unappealing.
##Part 2
The next steps involve taking in the list of subjects and actions, creating a character vector of the actions, and making
these two lists the first two columns of the data table in the function itself.<br>
##Part 3
The last step involves making the dataframe that will be returned.  It creates the first 2 column rows of person id and action
then it follows through with a nested for loop that calculuates the means

