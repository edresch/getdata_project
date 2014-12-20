# Welcome to run_analysis.R. THis script does the following: 

######################## IMPORTANT #################################
# The script should be executed from the data folder "UCI HAR Dataset"
# (where features.txt, activity_labels.txt and so on are located)
# This should also be your current working directory
####################################################################

# Loading
writeLines("Loading the dplyr package, which is necessary for the execution of this script.\n")
library(dplyr)

# 1: Merging of the training and the test sets and creation of one new data set.
# The script will load all files to the environment, may take a while

# features and acitivity labels
writeLines("Processing script and cleaning the data. Please wait...")
features <- read.table("features.txt")
activityLabel <- read.table("activity_labels.txt")
# Test set
testSubject <- read.table("./test/subject_test.txt")
testData <- read.table("./test/X_test.txt")
testLabel <- read.table("./test/y_test.txt")
# Train set
trainSubject <- read.table("./train/subject_train.txt")
trainData <- read.table("./train/X_train.txt")
trainLabel <- read.table("./train/y_train.txt")
# Merge the Test and Train sets and subjects
rawData <- rbind(testData, trainData)
rawSubject <- rbind(testSubject, trainSubject)
# Name the Subject column
names(rawSubject) <- "Subject_ID"
rawLabels <- rbind(testLabel, trainLabel)
# Removes now unnecessary variables
rm(testData, trainData, testSubject, trainSubject, testLabel, trainLabel)

# 2: Extraction of measurements on the mean and std for each measurement.
# Values we want (\\ for the parentheses)
toExtract <- c("mean\\(\\)", "std\\(\\)")
# Get the indexes we want by checking which variable names have mean() or std()
extractIndex <- grep(paste(toExtract,collapse="|"), features[, 2])
# Gets the indices we want from the raw data and names the raw data
# using the index for the wanted features
rawData <- rawData[, extractIndex]
names(rawData) <- features[extractIndex, 2]
# Formats the variable names for the columns t for Time, f for Freq
# removes the parentheses, minus sign becomes underline, BodyBody becomes Body
names(rawData) <- gsub("mean", "Mean", names(rawData))
names(rawData) <- gsub("std", "Std", names(rawData))
names(rawData) <- gsub("BodyBody", "Body", names(rawData))
names(rawData) <- gsub("-", "_", names(rawData))
names(rawData) <- gsub("tB", "TimeB", names(rawData))
names(rawData) <- gsub("fB", "FreqB", names(rawData))
names(rawData) <- gsub("tG", "TimeG", names(rawData))
names(rawData) <- gsub("fG", "FreqG", names(rawData))
names(rawData) <- gsub("\\(\\)", "", names(rawData))
# Removal of unnecessary variables
rm(features, extractIndex, toExtract)

# 3 Naming the rawLabels with the activity names
activityLabel[, 2] <- c("Walking", "Walking up", "Walking down", "Sitting", "Standing", "Laying")
# Substitution of numbers for the descriptive activity labels
for (i in 1:6) {
        rawLabels$V1[rawLabels$V1 == i] <- activityLabel$V2[i]
}
# Naming of the activity column
names(rawLabels) <- "Activity"

# 4 Appropriately labeling of the data set with descriptive variable names.
# (This step was already done within step 2)
# Joining of all the columns
tidyData <- cbind(rawSubject, rawLabels, rawData)
# Removal of unnecessary data
rm(rawSubject, rawLabels, rawData, activityLabel, i)
write.table(tidyData, file = "merged_data.txt", row.names=FALSE)
writeLines('The text file with the merged data set has been saved as tidy_data.txt.')
writeLines('Use read.table(\"merged_data.txt\", header = TRUE) to read the result to the R environment.\n')

# 5 From the data set in step 4, creation of a second, independent tidy data 
# set with the average of each variable for each activity and each subject.

# The following chained function does the following: 
# 1. Creates 2 groups from tidyData (subject and activity) 
# 2. Orders the data according to the subject ID
# 3. Applies the function mean to all non-grouping variables (all except for
# subject ID and activity) 4. Assign the result to tidyData2
tidyData2 <- summarise_each(
             arrange(
             group_by(tidyData, Subject_ID, Activity),
             Subject_ID
             ),
             funs(mean)
             )
# Writes the result to the .txt file
write.table(tidyData2, file = "tidy_data.txt", row.names=FALSE)
writeLines('The text file with the independent data set has been saved as tidy_data.txt.')
writeLines('Use read.table(\"tidy_data.txt\", header = TRUE) to read the result to the R environment.')
# Removes the unnecessary variables
rm(tidyData, tidyData2)