# CodeBook for the Dataset

This is a code book that describes the variables, the data, and any transformations that were performed to clean up the data.

## The Original Data Source:

Original Data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Description for the Dataset:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Dataset Info:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Files in the Dataset:
The dataset includes the following files:
* README.txt
* features_info.txt: Shows information about the variables used on the feature vector.
* features.txt: List of all features.
* activity_labels.txt: Links the class labels with their activity name.
* train/X_train.txt: Training set.
* train/y_train.txt: Training labels.
* test/X_test.txt: Test set.
* test/y_test.txt: Test labels.

### The following files are available for the train and test data. Their descriptions are given alongside.

* train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

* train/Inertial Signals/total_acc_x_train.txt: The acceleration signal from the smartphones accelerometer X axis in standard gravity units `g`. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

* train/Inertial Signals/body_acc_x_train.txt: The body acceleration signal obtained by subtracting the gravity from the total acceleration.

* train/Inertial Signals/body_gyro_x_train.txt: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## Project Objectives:

In all there are 5 part to the project. These are:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How the `run_analysis.R` file implements the above mentioned steps:

* It makes use of `reshape2` and `data.table` libraries.
* Loads both test and train data
* Loads the features and activity labels.
* Extracts the mean and standard deviation column names and data.
* Processes the data. There are two parts processing test and train data respectively.
* Merges the data set into a tidy data format and writes it to a text file `tidy2.txt`

## Transformation details:
All the values are means, aggregated over 30 subjects and 6 activities, hence the resulting dataset is 180 rows by 68 columns.

## Variable list and descriptions
-------------------------------

### Variable name    | Description
```
* subject          | ID the subject who performed the activity for each window sample.   Its range is from 1 to 30.
* activity         | Activity name
* featDomain       | Feature: Time domain signal or frequency domain signal (Time or Freq)
* featInstrument   | Feature: Measuring instrument (Accelerometer or Gyroscope)
* featAcceleration | Feature: Acceleration signal (Body or Gravity)
* featVariable     | Feature: Variable (Mean or SD)
* featJerk         | Feature: Jerk signal
* featMagnitude    | Feature: Magnitude of the signals calculated using the Euclidean norm
* featAxis         | Feature: 3-axial signals in the X, Y and Z directions (X, Y, or Z)
* featCount        | Feature: Count of data points used to compute `average`
* featAverage      | Feature: Average of each variable for each activity and each  subject.
````
## Variables
````
subject                    1..2
Subject number             1..30 .Unique identifier assigned to each subject
label                      6..18
activity label             "WALKING"
			               "WALKING_UPSTAIRS"
                           "WALKING_DOWNSTAIRS"
                           "SITTING"
                           "STANDING"
                           "LAYING" 