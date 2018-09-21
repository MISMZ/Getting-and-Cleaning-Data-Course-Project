# Getting-and-Cleaning-Data-Course-Project
Getting and Cleaning Data Week 4 Course Project

# Objective

This repo was created as part of the course project for week 4 of Getting and Cleaning Data Coursera course.
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

# Steps

First, download and unzip the data file into your R working directory.
Data for the project is located at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Second, download the R source code into your R working directory.
Finally, execute R source code to generate tidy data file.

# Data description

The data was derived from an experiments which have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

Using its embedded accelerometer and gyroscope, the experiment captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

more details informtion on the data used can be obtained from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# R code description
## The code was written based on the instruction of this assignment
The R code does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## The script has 2 .csv and 1 .txt outputs:

tidy_data.csv: data set containing both train and test data which only includes mesurement on the mean and standard deviation with descriptive activity name and label with descriptive variable name. 

tidy_data2.csv & tidy_data2.txt: tidy data set calculate mean by each activity and each user for each variable.

# Packages used for the code
tidyverse
