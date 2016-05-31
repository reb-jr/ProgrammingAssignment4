#
# You should create one R script called run_analysis.R that does the following.
#
#    1. Merges the training and the test sets to create one data set.
#    2. Extracts only the measurements on the mean and standard deviation for each measurement.
#    3. Uses descriptive activity names to name the activities in the data set
#    4. Appropriately labels the data set with descriptive variable names.
#    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#

run_analysis <- function(){
     load_tidy_data <- function(){
          # maps to values in activity column "y_*.txt"
          #        used to fulfill Requirement 3
          activity_labels <- read.table("data/activity_labels.txt")
          
          # maps to variable names of "X_*.txt"
          #        used to fulfull Requirement 4
          variable_labels <- read.table("data/features.txt", col.names = c("Index","Name"))
          
          # get the desired columns 
          #        (includes only the measurements in Requirement 2 - also used to fulfull Requirement 4)
          indices_of_desired_variables <- grep("*mean\\()*|*std\\()*",variable_labels$Name)
          desired_variables <- variable_labels[indices_of_desired_variables,]

          # Tidy the variable names by removing parentheses and replacing 
          # other non-alphanumeric characters with underscores "_"
          #        (Tidy variable names - used to fulfull Requirement 4)
          desired_variables$Name <- gsub("[^[:alnum:]]","_",
                                         gsub("\\(","",gsub(")","",desired_variables$Name))
                                    )

          # load the subject data 
          #        (merge of test and training - Requirement 1)
          subjects   <- rbind(read.table("data/test/subject_test.txt"),
                              read.table("data/train/subject_train.txt"))

          # load the activity data 
          #        (merge of test and training - Requirement 1)
          activities <- rbind(read.table("data/test/y_test.txt"),      
                              read.table("data/train/y_train.txt"))

          # load the measurements 
          #        (merge of test and training - Requirement 1)
          #        (and only the mean and std variables/columns - Requirement 2)
          measurements <- rbind(
               read.table("data/test/X_test.txt")[,desired_variables$Index],
               read.table("data/train/X_train.txt")[,desired_variables$Index]
          )
          
          # label the data set with descriptive variable names  
          #        (Requirement 4)
          names(subjects) <- c("SubjectId")
          names(activities) <- c("Activity")
          names(measurements) <- desired_variables$Name
          
          # convert the subject id into a factor
          subjects <- mutate(subjects, SubjectId=as.factor(SubjectId))
          
          # replace activity ids with descriptive names  
          #        (Requirement 3)
          activities <- mutate(activities, Activity=activity_labels[as.integer(Activity),2])
          
          # merge data together  
          #        (Requirement 1)
          cbind(cbind(subjects,activities),measurements)
     }
     
     print("loading data...")
     full_data <- load_tidy_data()

     write.table(full_data,"tidy_data.txt", row.names = FALSE)

     #Requirement 5
     averaged <- full_data %>% group_by(SubjectId,Activity) %>% summarise_each(funs(mean))
     write.table(averaged,"tidy_data_averaged.txt", row.names = FALSE)
     
     averaged
}
