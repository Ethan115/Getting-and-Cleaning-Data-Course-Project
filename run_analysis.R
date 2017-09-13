# This R script reads and merges train and test data sets and includes activity 
# and subject id information. It also selects only the mean and standard deviation 
# of each measurement. 
# It relabels the column names and activity factors to make them descriptive.
# Finally it outputs a second and independent data set with the average of each
# variable for each activity and each subject.

## Make sure the data folder "UCI HAR Dataset" is in the working directory with
## this R script.
setwd("UCI HAR Dataset")

## Read features.txt for later features selection and column names.
features <- read.table("features.txt")
select <- grepl("[-](mean|std)[()]", features$V2)

## Read the test data, select the features and combine with activity and subject id.
test <- read.table("test/X_test.txt", col.names = features[ ,2])
test <- test[ , select]
activity_test <- read.table("test/y_test.txt", col.names = "activity")
subject_test <- read.table("test/subject_test.txt", col.names = "subject.id")
test <- cbind(test, activity_test, subject_test)

## Read the train data, select the features and combine with activity and subject id.
train <- read.table("train/X_train.txt", col.names = features[ ,2])
train <- train[ , select]
activity_train <- read.table("train/y_train.txt", col.names = "activity")
subject_train <- read.table("train/subject_train.txt", col.names = "subject.id")
train <- cbind(train, activity_train, subject_train)

## Merge train and test data sets
complete <- merge (train, test, all = TRUE)

## Change the activity labels to be descriptive
activity_labels <- read.table("activity_labels.txt")
for (i in 1:6){
        complete$activity <- gsub(as.character(i), activity_labels[[i, 2]], 
                                  complete$activity)
}

## Melt and Cast the data
library(reshape2)
complete.melt <- melt(complete, id = c("activity","subject.id"), 
                      measure.vars = names(complete)[1:(ncol(complete)-3)])
complete.cast <- dcast(complete.melt, activity + subject.id ~ variable, mean)

## Output the data set "complete.cast" and write into text file "merged_data.txt"
print(complete.cast)
setwd("..")
write.table(complete.cast, "merged_data.txt", row.names = FALSE)
