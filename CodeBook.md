---
title: "CodeBook"
author: "jdostal1"
date: "Tuesday, February 17, 2015"
output: html_document
---
##This is the CodeBook for the course project for the Coursera course "Getting and Cleaning Data"
###Variables
The original data set (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ) is described at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones as follows:

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Attribute Information:

For each record in the dataset it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment. 

###The Data
The data used by the R function run_analysis.R consists of:

- activity_labels.txt - a text file associating descriptive activity names to name the activities in the data set
- features.txt - a text file that provides descriptive variable names for each of the variables in a measurement
- training and test data - within the data set there are two folders; each contain:
    * subject_test.txt - a text file containing the subjects performing the activity during each measurement
    * X_test.txt - a text file containing the measurements of each variable
    * y_test.txt - a text file containing the activity being performed during each measurement

###Transformations and work
When executed in the same directory as the UCI HAR Dataset (available at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) the run_analysis.R function will:

  - Merge the training and the test sets to create one data set.
  - Extract only the measurements on the mean and standard deviation for each measurement. 
  - Use descriptive activity names to name the activities in the data set
  - Appropriately label the data set with descriptive variable names. 
  - From the data set, creates a second, independent tidy data set with the average of each variable for each activity and each subject as an output file titled "course_project_output.txt" in the working directory.
  - Return the tidy data set as a data frame.