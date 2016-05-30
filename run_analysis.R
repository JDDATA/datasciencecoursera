## Script merging data from a number of .txt files and produces a tidy data set which may be used for further analysis.
##check for required packages

if (!("reshape2" %in% rownames(installed.packages())) ) {
  print("Please install required package \"reshape2\" before proceeding")
} else {
  ## Open required libraries
  library(reshape2)
  
## First, read all required .txt files and label the datasets, read all activities and their names and label the aproppriate columns 
  activity_labels <- read.table("UCI_Data/activity_labels.txt",col.names=c("activity_id","activity_name"))
  
## Read dataframe column names
  features <- read.table("UCI_Data/features.txt")
  feature_names <-  features[,2]
  
## Read test data and label dataframe columns
  testdata <- read.table("UCI_Data/test/X_test.txt")
  colnames(testdata) <- feature_names
  
## Read training data and label dataframe columns
  traindata <- read.table("UCI_Data/train/X_train.txt")
  colnames(traindata) <- feature_names
  
## Read ids of test subjects and label dataframe columns
  test_subject_id <- read.table("UCI_Data/test/subject_test.txt")
  colnames(test_subject_id) <- "subject_id"
  
## Read activity id of test data and label dataframe columns
  test_activity_id <- read.table("UCI_Data/test/y_test.txt")
  colnames(test_activity_id) <- "activity_id"
  
## Read ids of test subjects and label dataframe columns
  train_subject_id <- read.table("UCI_Data/train/subject_train.txt")
  colnames(train_subject_id) <- "subject_id"

## Read activity id of training data and label dataframe columns
  train_activity_id <- read.table("UCI_data/train/y_train.txt")
  colnames(train_activity_id) <- "activity_id"
  
##Combine test subject id, the test activity id and the test data into one dataframe
  test_data <- cbind(test_subject_id , test_activity_id , testdata)
  
##Combine test subject id, the test activity id and the test data into one dataframe
  train_data <- cbind(train_subject_id , train_activity_id , traindata)
  
##Combine test data and train data into one dataframe
  all_data <- rbind(train_data,test_data)
  
##Keep only columns refering to mean() or std() values
  mean_col_idx <- grep("mean",names(all_data),ignore.case=TRUE)
  mean_col_names <- names(all_data)[mean_col_idx]
  std_col_idx <- grep("std",names(all_data),ignore.case=TRUE)
  std_col_names <- names(all_data)[std_col_idx]
  meanstddata <-all_data[,c("subject_id","activity_id",mean_col_names,std_col_names)]
  
##Merge activity dataset with mean/std values dataset to get one dataset with descriptive activity names
  descrnames <- merge(activity_labels,meanstddata,by.x="activity_id",by.y="activity_id",all=TRUE)
  
##Melt dataset with descriptive activity names for better handling
  data_melt <- melt(descrnames,id=c("activity_id","activity_name","subject_id"))
  
##Cast melted dataset according to the average of each variable for each activity and each subjec
  mean_data <- dcast(data_melt,activity_id + activity_name + subject_id ~ variable,mean)
  
## File created with new tidy dataset
  write.table(mean_data,"UCI_Data/tidy_movement_data.txt", row.name=FALSE)
  
}

