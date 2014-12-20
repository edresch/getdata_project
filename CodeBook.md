Human Activity Recognition Using Smartphones Data Set
=====================================================

### Description of raw data

This data set is built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waistmounted smartphone with embedded inertial sensors. A total of 10299 instances (rows) were recorded from 6 different activities, those being WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. The data was recorded with a smartphone (Samsung Galaxy S II) which was worn on the waist by the subjects. Using its embedded accelerometer and gyroscope, a 3-axial linear acceleration. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) were preprocessed
by applying noise filters and then sampled in fixedwidth sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth lowpass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector
of features was obtained by calculating variables from the time and frequency domain.

561 features were included in the raw data. Furthermore, each data set (training and test) contained following files: 

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561 feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment.

### Description of the analysis

The analysis carried out by the script run_analysis.R is part from the Getting and Cleaning Data course project from Coursera. Following modifications are carried out on the raw data by this script:

1. The training and the test sets are merged to create one data set.
2. Only the measurements on the mean and standard deviation for each measurement are extracted. 
3. Descriptive activity names are used to name the activities in the data set
4. The data set is named appropriately with descriptive variable names. 
5. From the data set in step 4, a second is created. This independent tidy data set contains the average of each variable for each activity and each subject.

### Codebook

The tidy data set has 180 observations (variables) of 68 variables (columns). As stated above, the raw data set has 10299 observations of 561 features. 

These 561 features are reduced to the 66 relevant features. These are the relevant features that contain the mean() and standard deviation (std()) of the signals. Features containing additional vectors such as gravityMean were not included since they are not derived directly from the original data. The mean and std of following features are included in the tidy data set:

* TimeBodyAcc-XYZ
* TimeGravityAcc-XYZ
* TimeBodyAccJerk-XYZ
* TimeBodyGyro-XYZ
* TimeBodyGyroJerk-XYZ
* TimeBodyAccMag
* TimeGravityAccMag
* TimeBodyAccJerkMag
* TimeBodyGyroMag
* TimeBodyGyroJerkMag
* FreqBodyAcc-XYZ
* FreqBodyAccJerk-XYZ
* FreqBodyGyro-XYZ
* FreqBodyAccMag
* FreqBodyAccJerkMag
* FreqBodyGyroMag
* FreqBodyGyroJerkMag

This is the description of the features as seen in the file "features.txt":

*The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.*

*Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).*

*Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).*

*These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.*

The 10299 observations are grouped together by the subject number and activity performed and the 66 features for each of the groups is then averaged (6 activities * 30 subjects = 180 observations).

The other two variables (columns) are the Subject_ID (unique) (1-30) and the activities, which were transformed into a factor (Laying, Sitting, Standing, Walking, Walking down, Walking up). These two variables were used for the grouping in order to calculate the mean of all other 66 variables for each subject and for each activity.

### Format

The tidy data set is a data frame with 180 cases (rows) and 68 variables (columns) named:

Subject_ID, Activity, TimeBodyAcc_Mean_X, TimeBodyAcc_Mean_Y, TimeBodyAcc_Mean_Z, TimeBodyAcc_Std_X, TimeBodyAcc_Std_Y, TimeBodyAcc_Std_Z, TimeGravityAcc_Mean_X, TimeGravityAcc_Mean_Y, TimeGravityAcc_Mean_Z, TimeGravityAcc_Std_X, TimeGravityAcc_Std_Y, TimeGravityAcc_Std_Z, TimeBodyAccJerk_Mean_X, TimeBodyAccJerk_Mean_Y, TimeBodyAccJerk_Mean_Z, TimeBodyAccJerk_Std_X, TimeBodyAccJerk_Std_Y, TimeBodyAccJerk_Std_Z, TimeBodyGyro_Mean_X, TimeBodyGyro_Mean_Y, TimeBodyGyro_Mean_Z, TimeBodyGyro_Std_X, TimeBodyGyro_Std_Y, TimeBodyGyro_Std_Z, TimeBodyGyroJerk_Mean_X, TimeBodyGyroJerk_Mean_Y, TimeBodyGyroJerk_Mean_Z, TimeBodyGyroJerk_Std_X, TimeBodyGyroJerk_Std_Y, TimeBodyGyroJerk_Std_Z, TimeBodyAccMag_Mean, TimeBodyAccMag_Std, TimeGravityAccMag_Mean, TimeGravityAccMag_Std, TimeBodyAccJerkMag_Mean, TimeBodyAccJerkMag_Std, TimeBodyGyroMag_Mean, TimeBodyGyroMag_Std, TimeBodyGyroJerkMag_Mean, TimeBodyGyroJerkMag_Std, FreqBodyAcc_Mean_X, FreqBodyAcc_Mean_Y, FreqBodyAcc_Mean_Z, FreqBodyAcc_Std_X, FreqBodyAcc_Std_Y, FreqBodyAcc_Std_Z, FreqBodyAccJerk_Mean_X, FreqBodyAccJerk_Mean_Y, FreqBodyAccJerk_Mean_Z, FreqBodyAccJerk_Std_X, FreqBodyAccJerk_Std_Y, FreqBodyAccJerk_Std_Z, FreqBodyGyro_Mean_X, FreqBodyGyro_Mean_Y, FreqBodyGyro_Mean_Z, FreqBodyGyro_Std_X, FreqBodyGyro_Std_Y, FreqBodyGyro_Std_Z, FreqBodyAccMag_Mean, FreqBodyAccMag_Std, FreqBodyAccJerkMag_Mean, FreqBodyAccJerkMag_Std, FreqBodyGyroMag_Mean, FreqBodyGyroMag_Std, FreqBodyGyroJerkMag_Mean and FreqBodyGyroJerkMag_Std.

### Source

Jorge L. ReyesOrtiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab Non Linear Complex Systems Laboratory
DITEN Università degli Studi di Genova, Genoa I16145, Italy.
activityrecognition '@' smartlab.ws
www.smartlab.ws

### References

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. ReyesOrtiz. Human Activity Recognition on Smartphones using a Multiclass HardwareFriendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). VitoriaGasteiz, Spain. Dec 2012

##### Written by: E. A. Dresch