# README file for the Coursera "Getting and Cleaning Data" course project

## Introduction
This README file describes the structure of the folder (and/or the GitHub repository) created for the Coursera "Getting and Cleaning Data" course project.

## Folder structure
* **README.md**: this file
* **CodeBook.md**: describes the data, the variables, and the transformations performed on the raw data.
* **run_analysis.R**: R script that unpacks the .zip file with the raw data, and transforms it into a smaller tidy data set.
* **data_cleaned.txt**: resulting tidy data set.

## Scripts
There is only one R script that performs all the data cleansing and data transformation steps: "run_analysis.R".

The script can be run without any prior knowledge and without any parameters. The only requirement is to download the [zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) with the raw data, and place it into the current directory where you are going to execute the script.

The script will automatically generate the file "data_cleaned.txt" containing tidy data.

## Output
The output file is available in the current directory under the filename "data_cleaned.txt"
