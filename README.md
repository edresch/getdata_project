ReadMe - Coursera Getting and Cleaning Data
=====================================================

This ReadMe aims to give a concise description of the data and also describes how the run_analysis script works and which starting conditions are necessary for the execution of the script.

This script is part of the final project from the Coursera course "Getting and Cleaning Data" from the Johns Hopkins University. It is used on the raw data set provided and after merging different data sets, cleaning the variable names and also summarising the data, the script saves a tidy data set to your working directory.

### The data set

This data set was created by the DITEN - Università degli Studi di Genova and describes experiments which have been carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, a 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

#### The original dataset includes the following files:

- 'README.txt' - Description of the data set
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features (variables)
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels (activities).
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels (activities).
- 'train/subject_train.txt': The row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

The data set contains furthermore the raw signals for the creation of the training and test sets. These signals are not used for the creation of the tidy data set.

### Starting conditions and results of the script execution

1. Download the data set from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> and unzip the contents to a new folder.
2. Be sure to set your R working directory to the new folder containing the data.
3. Place the run_analysis.R script in the same folder with the rest of the data (where the files README.txt, features.txt and so on are located).
4. For the execution of this script, the package "dplyr" is necessary. If you don't have this package installed, please it install before running the script with the following command:
```{r}
install.packages("dplyr")
```
5. Now you can source the script in RStudio using the following command in your console:
```{r}
source("run_analysis.R")
```
6. The script will then be executed. The data analysis might take some time depending on your computer.
7. A file called "merged_data.txt" will be saved to your working directory. PLEASE NOTE that this is not the file with the summarised data. It only serves to show how the merged data looks like before the final analysis.
8. You can load this data to your workspace or assign it to a new variable with the following command:
```{r}
read.table("merged_data.txt", header = TRUE)
```
9. After the analysis is finished, a file called "tidy_data.txt" will be saved to your working directory. This file contains an independent tidy data set with the average of each variable for each activity and each subject.
10. All variables used in the analysis will then be removed from the global environment.
11. You can load the tidy data set to your workspace or assign it to a new variable with the following command:
```{r}
read.table("tidy_data.txt", header = TRUE)
```
13. This data set has the average of each variable for each activity and each subject. 

### How does this script work?

The script uses simple R functions to execute the necessary analysis. As stated above, only the dplyr package is needed for the final grouping and summarisation of results. The following step-by-step guide concisely describes how the script analyses the data. Similar descriptions can be found in the comments included within the script:

1. The dplyr package is loaded to the workspace.
2. All data files necessary for the analysis are loaded using read.tables() and assigned to different variables.
3. The test and training data sets, subject and label sets are merged using a simple rbind command. These are then assigned to new variables.
4. Using the function grep to find pattern matches, the script selects the indexes of only those variables with the mean and standard deviation ('mean() and std()').
5. The raw data is then subsetted according to the indexes of step 4 and only those columns including relevant data are kept in the workspace.
6. The variable names are formatted. Parentheses are removed, minus signs become underlines and repeated names are removed. For this I used the gsub command, which finds a pattern and replaces it with another character string.
7. The activity numbers are then replaced with descriptive names, using a simple variable assignment.
8. Now that we have all the columns named, and both data sets merged, the script then joins all columns using cbind. This is then the merged tidy data set.
9. Although not necessary for the assessment of this project, the data set is saved to your working directory as "merged_data.txt"
10. In the final step of the analysis, two groups from the previous data set (subject and activity) using dplyr's group_by. This grouped data is then sorted according to the subject ID (so that we start with subject 1) using the arrange function and then finally applyes the mean function to all non-grouping variables (all 66 features) so that the average of each feature (variable) for each subject and each activity can be calculated. This is done by using dplyr's "summarise_each" function. This data set is then assigned to the variable tidyData2. This is then saved to the working directory as "tidy_data.txt" and can be loaded back to the workspace with the read.table() function.

Written by: E. A. Dresch