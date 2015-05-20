## See READM.md file for background info

## The script does the following:
## 1.Merges the training and the test sets to create one data set.
## 2.Extracts only the measurements on the mean and standard 
##   deviation for each measurement. 
## 3.Uses descriptive activity names to name the activities in 
##   the data set
## 4.Appropriately labels the data set with descriptive variable names. 
## 5.From the data set in step 4, creates a second, independent tidy 
##   data set with the average of each variable for each activity and each subject.

library(plyr)
library(dplyr)


## Read in the data sets from files
activity_labels = read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activity_id", "activity_name"))
measurement_labels = read.table("UCI HAR Dataset/features.txt")
train_activities = read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity_id")
test_activities = read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity_id")
train_subjects = read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
test_subjects = read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

## 4.Appropriately labels the data set with descriptive variable names.
train_measurements = read.table("UCI HAR Dataset/train/x_train.txt", col.names = measurement_labels[,2])
test_measurements = read.table("UCI HAR Dataset/test/x_test.txt", col.names = measurement_labels[,2])

## 1.Merges the training and the test sets to create one data set.
all_activities = rbind(train_activities, test_activities)
all_subjects = rbind(train_subjects, test_subjects)

## 2.Extracts only the measurements on the mean and standard deviation for each measurement.
col_filter = grep("((-mean)|(-std))[(]", measurement_labels[,2])
all_measurements_mean_std = rbind(train_measurements[,col_filter], test_measurements[,col_filter])

## Join the different data sets into one data set
data_set = cbind(all_subjects, all_activities, all_measurements_mean_std)

## 3.Uses descriptive activity names to name the activities in the data set
data_set_with_activity_labels = merge(activity_labels, data_set, by = "activity_id")
almost_cleaned_data_set = data_set_with_activity_labels[,-1]


## 4.Appropriately labels the data set with descriptive variable names.
cleaned_data_set = rename(almost_cleaned_data_set, activity = activity_name)


## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_data_set = ddply(cleaned_data_set, .(activity, subject), colwise(mean))
write.table(tidy_data_set, file = "means_by_activity_and_subject.txt", row.name = FALSE)
