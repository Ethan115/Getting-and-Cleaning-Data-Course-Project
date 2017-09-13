# Getting-and-Cleaning-Data-Course-Project
This repo includes the following files:

run_analysis.R
code_book.md
README.md

## run_anlysis.R
This R script reads and merges train and test data sets and includes activity and subject id information. It also selects only the mean and standard deviation of each measurement. It relabels the column names and activity factors to make them descriptive. Finally it outputs a second and independent data set with the average of each variable for each activity and each subject.

In detail, it achieves the output data set with the following steps:
1) Read features.txt for later features selection and column names.
2) Read the test data, select the features and combine with activity and subject id.
3) Read the train data, select the features and combine with activity and subject id.
4) Merge train and test data sets.
5) Change the activity labels to be descriptive.
6) Melt and Cast the data.
7) Output the data set "complete.cast" and write into text file "merged_data.txt”.

## code_book.md
This file describes each variables in the data set.

## README.md
This current markdown file explains files in the repo.
