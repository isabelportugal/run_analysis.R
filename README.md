
# Assessment 1 - `run_analyis.R` function

This repo contains the analysis code in R which can be run on the Samsung datasets to create the tidy dataset as per peer assignment requirements for "Getting and Cleaning Data Project" by by Jeff Leek, Roger D. Peng, Brian Caffo, PhD

## The R script `run_analysis.R` will:

1. Download and process the required data.
2. Label the columns of data sets accordingly.
3. Combine train and test datasets into one complete data set.
4. Create a second, independent tidy data set with average of each variable for each activity and each subject.
5. Write the `tidy_data.txt` to a space separated text file.


This script will create two new tidy data sets:

`data_set.txt` : combines training and test data sets (together with subject and activity data).

`tidy_data.txt`: shows a table with the means, grouped by subject and label.


### Source

Information about used data in: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Used data set: [zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


### NOTE: the R script created will download the data set and the required packages from its source. 



