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
     download_the_data <- function(){
          #default to using the original source data directory name
          data_source_dir <- "UCI HAR Dataset";
          
          if (file.exists("data"))  #the data was loaded from the repo
               data_source_dir <- "data"
          else if (!file.exists(data_source_dir)) { #data has not been loaded, ever
               print("downloading source data...")
               download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","source_data.zip")
               
               print("extracting source data...")
               unzip("source_data.zip")
          }
          data_source_dir
     }
     
     load_tidy_data <- function(data_source_dir){
          print(paste0("data will be loaded from '",getwd(),"/",data_source_dir,"/' ..."))
          
          # maps to values in activity column "y_*.txt" (used to fulfill Requirement 3)
          activity_labels <- read.table(paste0(data_source_dir,"/activity_labels.txt"))
          
          # maps to variable names of "X_*.txt" (used to fulfull Requirement 4)
          variable_labels <- read.table(paste0(data_source_dir,"/features.txt"), col.names = c("Index","Name"))
          
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

          # load the subject data (merge of test and training - Requirement 1)
          subjects   <- rbind(read.table(paste0(data_source_dir,"/test/subject_test.txt")),
                              read.table(paste0(data_source_dir,"/train/subject_train.txt")))

          # load the activity data  (merge of test and training - Requirement 1)
          activities <- rbind(read.table(paste0(data_source_dir,"/test/y_test.txt")),      
                              read.table(paste0(data_source_dir,"/train/y_train.txt")))

          # load the measurements  (merge of the mean and std variables/columns from test and training - Requirements 1 & 2)
          measurements <- rbind(
               read.table(paste0(data_source_dir,"/test/X_test.txt"))[,desired_variables$Index],
               read.table(paste0(data_source_dir,"/train/X_train.txt"))[,desired_variables$Index]
          )
          
          # label the data set with descriptive variable names (Requirement 4)
          names(subjects) <- c("SubjectId")
          names(activities) <- c("Activity")
          names(measurements) <- desired_variables$Name
          
          # convert the subject id into a factor (not a requirement, but it does express more accurately the semantics of the data)
          subjects <- mutate(subjects, SubjectId=as.factor(SubjectId))
          
          # replace activity ids with descriptive names  (Requirement 3)
          activities <- mutate(activities, Activity=activity_labels[as.integer(Activity),2])
          
          # merge data together  (Requirement 1)
          cbind(cbind(subjects,activities),measurements)
     }
     print("checking for data...")
     data_source_dir <- download_the_data()
     
     print("loading data...")
     full_data <- load_tidy_data(data_source_dir)

     write.table(full_data,"tidy_data.txt", row.names = FALSE)

     # summarize data (Requirement 5)
     print("summarizing data...")
     averaged <- full_data %>% group_by(SubjectId,Activity) %>% summarise_each(funs(mean))
     write.table(averaged,"tidy_data_averaged.txt", row.names = FALSE)
     
     print("done")
     averaged
}
