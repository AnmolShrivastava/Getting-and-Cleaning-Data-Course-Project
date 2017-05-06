# Getting-and-Cleaning-Data-Course-Project
Course Project
The R code does the following :
1)Loads the activity_labels, features and x_test data set from the working directory and changes column names of x_test to those given in features. 
2)Loads subject_test and y_test and binds these to x_test.
3)Similar operation is performed for training set x_train.
4)Merges the test and train data set to form all_data.
5)Subsets the all_data data set to keep only those columns which have measurements of std deviation and mean.
6)Melts the data and transforms it to tidy data set.

