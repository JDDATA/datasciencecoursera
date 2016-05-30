
## Getting and Cleaning Data - Wk4 Assignment, Readme file

The run_analysis.R script performs the following steps to clean the data:

1. It first reads all required .txt files (including "features.txt", "x_test.txt", "x_train.txt", "subject_test.txt", "subject_train.txt", "y_train.txt", ), label the datasets, read all activities and names, then label the appropriate columns. 

2. Thereafter, the script would combine the test subject ids, the test activity ids, and the test data into one datafrme for both the test and the train data and then combine the test data and the train data into one datafram retaining only columns referring to mean() or std() values. 

3. Subsequently, it will merge activity dataset with mean/std values dataset to become one dataset with descriptive activity names. 

4. In the very end of the script, it will create a new tidy dataset. 
