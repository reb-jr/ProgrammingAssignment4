# ProgrammingAssignment4
Final Assignment for "Getting and Cleaning Data"
This repo contains the source data, the R script for producing a tidy data set, two tidy data sets and a Code Book describing the tidy data per the instructions in the final assignment for the "Getting and Cleaning Data" course

<i style="color:red">Note: 

I found the instructions somewhat ambiguous regarding the tidy data set or sets to be produced: the statement "5. From the data set in step 4, creates a second, independent tidy data set" seems to imply that the expectation is that there are two data sets that are to be produced/submitted. But that seems to conflict with other instructions that imply that only one data set is to be submitted.  The tidy_data_averaged.csv file contains the result of Step 5. and is probably the one on which the grading is based (I have included "tidy_data.csv" - the intermediate data set - for the sake of thoroughness.)</i>

###data/
directory containing data from the original source data (found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The only modifications to the data are

1. change the name of the base data directory from "UCI HAR Dataset/" to the more friendly "data/"
2. remove the two unused directories:
     a. test/Inertial Signals/
     b. train/Inertial Signals/

Description of the originial data can be found in "data/README.txt"

###run_analysis.R
1. loads and tidys data from the source files in the "data" directory
2. generates two files:
     a. tidy_data.csv 
     b. tidy_data_averaged.csv

###tidy_data.csv
The data collected from the source data and combined into a single data set. This data set:

1. combines the test and train sets from the original data, and
2. it contains only the mean() and std() measurements from the source data, and 
3. descriptive names for the activities

###tidy_data_averaged.csv
The data set is processed as specified in the assignment instructions: using the data set in "tidy_data.csv", it averages each of the std() and mean() measurements after grouping by Subject and Activity 


###CodeBook.md
The code book describing the data set in the tidy_data_averaged.csv file


