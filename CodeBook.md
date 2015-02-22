# Code book for the Coursera "Getting and Cleaning Data" course project

## Introduction
This code book describes the data, the variables, and the transformations performed on the raw data.

## Data description
The raw data was obtained from the following URL: [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz was captured. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Both "test" and "train" data sets contain a total of 561 variables, describing the data recorded from the 3D accelerometers (plus two variables for human subject and activity type).
The numerical variables are grouped depending on the calculation type - e.g. mean/sd/min/max/skewness/kurtosis et cetera.

Further information for the data set is available under the following link: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Transformations
Following transformations were performed on the raw data:

1. The measurement data ("X_" files) was merged with the labels data ("y_" files).
2. The test and train data sets were merged into a single data set.
3. Meaningful column names for each variable type were added.
4. Meaningful activity names (activities 1 through 6) were added.
5. Only variables of the type "mean" or "sd" were retained in the data set (66 variables total).
6. Overall mean values (per Subject and Activity type) were calculated for all variables.
7. The data set was transformed to the narrow format: variable names are stored as the third column, besides the Subject and Activity type.

## Variables
The resulting variables are:

* **Subject**: the masked ID of the human volunteer (30 persons total, numbered 1 through 30).
* **Activity**: activity type, with 6 possible values: [WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING].
* **Variable**: the name of the numerical variable, measured with the 3D accelerometer.
* **Average**: the overall average value for the numerical variable (per Subject and Activity Type).

## Output
The output file is available in the current directory under the filename "data_cleaned.txt"
