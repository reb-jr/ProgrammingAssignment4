# ProgrammingAssignment4
Final Assignment for "Getting and Cleaning Data"

##Steps for running the analysis
1. open R
2. ensure that the dplyr library is loaded
3. load "run_analysis.R" to create the run_analysis() function
4. execute run_analysis() function

     a. it will return the averaged data to your R session, and
     b. write that data frame to a file named "tidy_data_averaged.txt" in your current working directory



##Repo contents
This repo contains the source data, the R script for producing a tidy data set, two tidy data sets and a Code Book describing the tidy data per the instructions in the final assignment for the "Getting and Cleaning Data" course

<i style="color:red">Note: 

I found the instructions somewhat ambiguous regarding the tidy data set or sets to be produced: the statement "5. From the data set in step 4, creates a second, independent tidy data set" seems to imply that the expectation is that there are two data sets that are to be produced/submitted. But that seems to conflict with other instructions that imply that only one data set is to be submitted.  The tidy_data_averaged.txt file contains the result of Step 5. and is probably the one on which the grading is based (I have included "tidy_data.txt" - the intermediate data set - for the sake of thoroughness.)</i>

###data/
directory containing data from the original source data (found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The only modifications to the data in the repo are

1. change the name of the base data directory from "UCI HAR Dataset/" to the more friendly "data/"
2. remove the two unused directories:
     a. test/Inertial Signals/
     b. train/Inertial Signals/

Description of the originial data can be found in "data/README.txt"

###run_analysis.R
1. loads and tidys data from the source files in the "data/" directory or the "UCI HAR Dataset/" (if neither exists, it will automatically download the file from the above URL)
2. generates two files:
     a. tidy_data.txt 
     b. tidy_data_averaged.txt


transformation steps performed by run_analysis.R:

1. row bind test/subject_test.txt and train/subject_train.txt into a subject data frame
2. row bind test/y_test.txt and train/y_train.txt into an activity data frame
3. row bind test/X_test.txt and train/X_train.txt into a measurements data frame <i>including only desired columns</i>
4. replace column names for each of the above data frames with meaningful/readable names
5. modify Subject IDs as factor values
6. replace Activity IDs with descriptive names for the data frame produced by step 2
7. column bind the 3 data frames produced by steps 1, 2, and 3 to produce the intermediary data fram
8. group the result of previous step by SubjectId and Activity, then calculate the mean for all of the variables

###tidy_data.txt
The data collected from the source data and combined into a single data set. This data set:

1. combines the test and train sets from the original data, and
2. it contains only the mean() and std() measurements from the source data, and 
3. descriptive names for the activities

###tidy_data_averaged.txt <i>(this is the data set submitted for the project)</i>
The data set is processed as specified in the assignment instructions: using the data set in "tidy_data.txt", it averages each of the std() and mean() measurements after grouping by Subject and Activity 


###CodeBook.md
The code book describing the data set in the tidy_data_averaged.txt file

