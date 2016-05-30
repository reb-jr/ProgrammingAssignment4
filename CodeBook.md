#Code Book for "Getting and Cleaning Data" final project

All data in the data set is derived from the source data found in the "data/" directory.

The data is a combination of source data from the following files:

* data/test/subject_test.txt
* data/test/X_test.txt
* data/test/y_test.txt
* data/train/subject_train.txt
* data/train/X_train.txt
* data/train/y_train.txt

transformation steps:

1. row bind data/test/subject_test.txt and data/train/subject_train.txt into a subject data frame
2. row bind data/test/y_test.txt and data/train/y_train.txt into an activitiy data frame
3. row bind data/test/subject_test.txt and data/train/subject_train.txt <i>including only desired columns</i>
4. replace column names for each of the above data frames with meaningful/readable names
5. replace Activity IDs with descriptive names for the data frame produced by step 2
6. column bind the 3 data frames produced by steps 1, 2, and 3 to produce the intermediary data fram
7. group the result of previous step by SubjectId and Activity, then calculate the mean for all of the variables


##Variables in Data Set
+ SubjectId
+ Activity

The following contain the means of their corresponding source fields as described in "data/README.txt"

+ tBodyAcc_mean_X
+ tBodyAcc_mean_Y
+ tBodyAcc_mean_Z
+ tBodyAcc_std_X
+ tBodyAcc_std_Y
+ tBodyAcc_std_Z
+ tGravityAcc_mean_X
+ tGravityAcc_mean_Y
+ tGravityAcc_mean_Z
+ tGravityAcc_std_X
+ tGravityAcc_std_Y
+ tGravityAcc_std_Z
+ tBodyAccJerk_mean_X
+ tBodyAccJerk_mean_Y
+ tBodyAccJerk_mean_Z
+ tBodyAccJerk_std_X
+ tBodyAccJerk_std_Y
+ tBodyAccJerk_std_Z
+ tBodyGyro_mean_X
+ tBodyGyro_mean_Y
+ tBodyGyro_mean_Z
+ tBodyGyro_std_X
+ tBodyGyro_std_Y
+ tBodyGyro_std_Z
+ tBodyGyroJerk_mean_X
+ tBodyGyroJerk_mean_Y
+ tBodyGyroJerk_mean_Z
+ tBodyGyroJerk_std_X
+ tBodyGyroJerk_std_Y
+ tBodyGyroJerk_std_Z
+ tBodyAccMag_mean
+ tBodyAccMag_std
+ tGravityAccMag_mean
+ tGravityAccMag_std
+ tBodyAccJerkMag_mean
+ tBodyAccJerkMag_std
+ tBodyGyroMag_mean
+ tBodyGyroMag_std
+ tBodyGyroJerkMag_mean
+ tBodyGyroJerkMag_std
+ fBodyAcc_mean_X
+ fBodyAcc_mean_Y
+ fBodyAcc_mean_Z
+ fBodyAcc_std_X
+ fBodyAcc_std_Y
+ fBodyAcc_std_Z
+ fBodyAccJerk_mean_X
+ fBodyAccJerk_mean_Y
+ fBodyAccJerk_mean_Z
+ fBodyAccJerk_std_X
+ fBodyAccJerk_std_Y
+ fBodyAccJerk_std_Z
+ fBodyGyro_mean_X
+ fBodyGyro_mean_Y
+ fBodyGyro_mean_Z
+ fBodyGyro_std_X
+ fBodyGyro_std_Y
+ fBodyGyro_std_Z
+ fBodyAccMag_mean
+ fBodyAccMag_std
+ fBodyBodyAccJerkMag_mean
+ fBodyBodyAccJerkMag_std
+ fBodyBodyGyroMag_mean
+ fBodyBodyGyroMag_std
+ fBodyBodyGyroJerkMag_mean
+ fBodyBodyGyroJerkMag_std
