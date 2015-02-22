## This is the R script which prepares the tidy data set.
# To save the space on GitHub, the original files are not included here,
# though the commands for reading the files are provided. The files can be downloaded and unzipped from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

unzip("getdata-projectfiles-UCI HAR Dataset.zip")
library(data.table)
library(reshape2)
# Join all data together in a simple function
joinXY <- function(type) {
    xfile <- paste("UCI HAR Dataset/", type, "/X_", type, ".txt", sep="")
    yfile <- paste("UCI HAR Dataset/", type, "/Y_", type, ".txt", sep="")
    subj_file <- paste("UCI HAR Dataset/", type, "/subject_", type, ".txt", sep="")
    # Read the data
    x <- read.table(xfile)
    y <- read.table(yfile)
    subject <- read.table(subj_file)
    # run a semi-join
    x <- cbind(subject, y, x)
    x
}
# Task 1: Merge the training and the test sets to create one data set.
    test <- joinXY("test")
    train <- joinXY("train")
    TT <- rbind(train, test)
# Add the column names to the data, then extract only the mean and standard deviation columns
# (by using grep with a reg.expression "mean( OR std(" translated to Perl style)
# Task 2: Extract only the measurements on the mean and standard deviation for each measurement. 
# Task 4: Appropriately label the data set with descriptive variable names.
    features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = F, header=F)
    colnames(TT) <- c("Subject", "Activity", features[,"V2"])
    mean_std <- features[grep("mean\\(|std\\(", features$V2, perl=TRUE), 2]
    mean_std <- append(c("Subject", "Activity"), mean_std)
    TT <- TT[, mean_std]
# Task 3: Use descriptive activity names to name the activities in the data set
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
TT[, "Activity"] <- activity_labels[TT[,"Activity"], "V2"]
# Task 5: From the data set in previous steps, create a second, independent tidy data set with 
# the average of each variable for each activity and each subject.
tidy_data <- aggregate(subset(TT, select=-c(Subject,Activity)), by = list(Subject=TT$Subject, Activity=TT$Activity),FUN=mean)
tidy_data <- melt(tidy_data, id=c("Subject", "Activity"), measure.vars=colnames(tidy_data)[-c(1,2)])
colnames(tidy_data) <- c("Subject","Activity","Variable","Average")

# Export the tidy data set
write.table(tidy_data, file="data_cleaned.txt", row.name=FALSE)
