# HumanActivityRecognition
R scripts for cleaning the Human Activity Recognition Using Smartphones Data Set

## Obtaining the data

The data can be obtained from the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the data is available from the data's supplier:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Running the script and cleaning the data

To clean the data, place the script into the unzipped data directory and run it using R. For example,

$ R --vanilla < run_analysis.R

The script will perform the following tasks:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
