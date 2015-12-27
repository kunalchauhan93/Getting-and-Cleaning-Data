# Getting and Cleaning Data
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis

## Files in this Repositiory

* `README.md` - Contains info on files and objectives.
* `CodeBook.md` - Contains variable descriptions, the data and transformations.
* `run_analysis.R` - R code for performing the required steps.

## Objectives 

You should create one R script called run_analysis.R that does the following. 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

It should run in a folder of the Samsung data (the zip had this folder: UCI HAR Dataset)
The script assumes it has in it's working directory the following files and folders:
* activity_labels.txt
* features.txt
* test/
* train/

## Steps to work on this Course Project

1. Download the data source and put into a folder on your local drive. You'll have a `UCI HAR Dataset` folder.
2. Put `run_analysis.R` in the parent folder of UCI HAR Dataset, then set it as your working directory using `setwd()` function in R.
3. Run `source("run_analysis.R")`, then it will generate a new file `tiny2.txt` in your working directory.

## Code Walkthrough

* Step 1:

  * Read all the test and training files: y_test.txt, subject_test.txt and X_test.txt.
  * Combine the files to a data frame in the form of subjects, labels, the rest of the data.

* Step 2:

  * Read the features from features.txt and filter it to only leave features that are either means ("mean()") or standard deviations ("std()"). The reason for leaving out meanFreq() is that the goal for this step is to only include means and standard deviations of measurements, of which meanFreq() is neither.
  * A new data frame is then created that includes subjects, labels and the described features.

* Step 3:

  * Read the activity labels from activity_labels.txt and replace the numbers with the text.

* Step 4:

  * Make a column list (including "subjects" and "label" at the start)
  * Tidy-fy the list by removing all non-alphanumeric characters and converting the result to lowercase
  * Apply the now-good-columnnames to the data frame

* Step 5:

  * Create a new data frame by finding the mean for each combination of subject and label. It's done by aggregate() function

* Final step:

  * Write the new tidy set into a text file called tidy2.txt, formatted similarly to the original files.