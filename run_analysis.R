run_analysis <- function() {
  ## 1. Merge the training and the test sets to creat one data set
  ##  - read in the data from the training set
  training_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
  training_activity <- read.table("UCI HAR Dataset/train/y_train.txt")
  training_data <- read.table("UCI HAR Dataset/train/X_train.txt")
  
  ##  - match the subject and activity code to each measurement using cbind()
  training_set <- cbind(training_subject, training_activity, training_data)
  
  ##  - read in the data from the test set
  test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
  test_activity <- read.table("UCI HAR Dataset/test/y_test.txt")
  test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
  
  ##  - match the subject and activity code to each measurement using cbind()
  test_set <- cbind(test_subject, test_activity, test_data)
  
  ##  - merge the training and the test sets to create one data set using rbind()
  merged_set <- rbind(training_set, test_set)
  
  
  ## 2. Extract only the measurements on the mean and standard deviation for each measurement
  ##  - read in the labels for the features
  features <- read.table("UCI HAR Dataset/features.txt")
  
  ##  - rename columns using colnames and "features.txt" info 
  ##    (4. Appropriately label the data set with descriptive names)
  colnames(merged_set) <- c("Subject", "Activity", as.vector(features$V2))
  
  ##  - keep only the columns that contain either "mean()" or "std()"
  ##    -- by creating a vector with all column names with "mean()" and all column names with "std()"
  saved_cols <- c(grep("mean()", colnames(merged_set), value =T), grep("std()", colnames(merged_set), value =T))
  ##    -- and 'slicing' them out of the merged data set
  kept_merged_set <- merged_set[c("Subject", "Activity", saved_cols)]
  
  
  ## 3. Use descriptive activity names to name the activities in the data set
  ##  - read in the labels for the activity labels
  activity <- read.table("UCI HAR Dataset/activity_labels.txt")
    
  ##  - replace activity codes with activity names
  for (j in 1:length(activity[,1])){
    kept_merged_set$Activity[kept_merged_set$Activity==activity[j,1]] <- as.character(activity[j,2])
  }
  
  ## 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
  ##  - identify the unique subjects within the merged data set
  subjects <- sort(unique(kept_merged_set$Subject))
  ##  - make a data frame to hold the tidy data
  tidy_data <- data.frame(matrix(ncol=c(length(kept_merged_set[1,])), nrow=c(length(subjects)*length(activity[1,]))))
  ## label the columns
  colnames(tidy_data) <- colnames(kept_merged_set)
  
  ##  - for each of the subjects (in ascending order), for each activity, calculate the average of each variable 
  for (j in 1:length(subjects)){
    for (k in 1:length(activity[,1])){
      subject_subset <- kept_merged_set[c(kept_merged_set$Subject==subjects[j]),]
      subject_activity_average <- colMeans(subject_subset[c(kept_merged_set$Activity==activity[k,2]),3:length(kept_merged_set[1,])],na.rm=TRUE)
      row_index <- ((j-1)*(length(activity[,1])))+k
      tidy_data[row_index,] <- c(subjects[j], as.character(activity[k,2]), subject_activity_average)
    }
  }
  
  ##  - write the tidy data set to a file
  write.table(tidy_data, file = "course_project_output.txt", row.names = FALSE)
  tidy_data
}