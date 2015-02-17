---
title: "README"
author: "jdostal1"
date: "Tuesday, February 17, 2015"
output: html_document
---

###This is the course project for the Coursera course "Getting and Cleaning Data"

###The contents of this repository include:
* The R function "run_analysis.R"

When executed in the same directory as the UCI HAR Dataset (available at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) this function will:

  - Merge the training and the test sets to create one data set.
  - Extract only the measurements on the mean and standard deviation for each measurement. 
  - Use descriptive activity names to name the activities in the data set
  - Appropriately label the data set with descriptive variable names. 
  - From the data set, creates a second, independent tidy data set with the average of each variable for each activity and each subject as an output file titled "course_project_output.txt" in the working directory.
  - Returns the tidy data set as a data frame.

* A markdown file ("CodeBook.md") describing the variables, the data, and the work the script performs to clean up the data



