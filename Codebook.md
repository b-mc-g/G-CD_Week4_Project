# Data Source and background

Please read the file supplied with the downloaded data set in 
   ./UCI HAR Dataset/README.txt 
for a description of the experiment process, data collected and licensing obligations.

The information is repeated below for convenience. Please proceed to section "Data Analysis and transformation" for more specific information to this assignment solution

--------------------
Readme.txt repeated
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

# In addition the features measured are also described in features_info.txt. 

This is also repeated below for convenience

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

# Data Analysis and transformation

Please refer also to the comments in the R script file that describe also details of the data transformation steps.

In general R script proceeds as follows

    - data is downloaded
    - data is unzipped and stored in working directory
    - train, test, activity, subject and feature label data are read into data frames
    - selected labels are converted to more descriptive labels
      - activity ID to activity Name e.g 1 to Walking
      - feature column number to Feature Name COl(1) to tBodyAcc-meaN()-X
    - merger training and test data sets to create one data set
    - extract only those feature colums related to mean() or std() - standard deviation
    - group this data by subject and by activity
    - calculate the mean for a suject/activity pair or grouping
    - write the results into the file "independent_tidy_data_set.txt in the working directory
    
# Changing labels and Merging Data

Feature labels changes were made in data frames extracted from X_train.txt and X_text.txt using the feature label date avaibable in 
      
      features.txt
   
Readable Headers are added to following txt file based data frames

      activity_labels
      y_train
      y_test
      subject_test
      subject_train
      
The following .txt file based data frames were merged
   
      X_train, y_train and subject_train
      X_test, y_test and subject_test
      
using column binding.

The results of those merges was then merged using row binding to create the single data set.

feature columns with nean() or std() in the labels are filtered.
Activity id data is augmented by adding a column with a descriptor for each activity id e.g WALKING was added to correspond to activity id 1.

The descriptors are available in 

      activity_labels.txt
      
# Creating tidy data file

Selected feature labels are changed to make them more readable based on descriptions in the README and features .txt files supplied with the data set. For example t is changed to time, f to frequency, Acc to Accelerator etc. The details are commented in the R script file and mapping back to the original labels is possible which are partly described in the original feature.txt file repeated above for convenience.

The tidy data file produced is found in the working durectory where the R script was run

The data structure consists of 180 observations of 69 variablesis as follows

      subject_id
      activity_type
      activity_id
      timeBodyAcceleration-mean()-X	
      timeBodyAcceleration-mean()-Y	
      timeBodyAcceleration-mean()-Z	
      timeBodyAcceleration-std()-X	
      timeBodyAcceleration-std()-Y	
      timeBodyAcceleration-std()-Z	
      timeGravityAcceleration-mean()-X	
      timeGravityAcceleration-mean()-Y	
      timeGravityAcceleration-mean()-Z	
      timeGravityAcceleration-std()-X	
      timeGravityAcceleration-std()-Y	
      timeGravityAcceleration-std()-Z	
      timeBodyAccelerationJerk-mean()-X	
      timeBodyAccelerationJerk-mean()-Y	
      timeBodyAccelerationJerk-mean()-Z	
      timeBodyAccelerationJerk-std()-X	
      timeBodyAccelerationJerk-std()-Y	
      timeBodyAccelerationJerk-std()-Z	
      timeBodyGyroscope-mean()-X	
      timeBodyGyroscope-mean()-Y	
      timeBodyGyroscope-mean()-Z	
      timeBodyGyroscope-std()-X	
      timeBodyGyroscope-std()-Y	
      timeBodyGyroscope-std()-Z	
      timeBodyGyroscopeJerk-mean()-X	
      timeBodyGyroscopeJerk-mean()-Y	
      timeBodyGyroscopeJerk-mean()-Z	
      timeBodyGyroscopeJerk-std()-X	
      timeBodyGyroscopeJerk-std()-Y	
      timeBodyGyroscopeJerk-std()-Z	
      timeBodyAccelerationMagnitude-mean()	
      timeBodyAccelerationMagnitude-std()	
      timeGravityAccelerationMagnitude-mean()	
      timeGravityAccelerationMagnitude-std()	
      timeBodyAccelerationJerkMagnitude-mean()	
      timeBodyAccelerationJerkMagnitude-std()	
      timeBodyGyroscopeMagnitude-mean()	
      timeBodyGyroscopeMagnitude-std()	
      timeBodyGyroscopeJerkMagnitude-mean()	
      timeBodyGyroscopeJerkMagnitude-std()	
      frequencyBodyAcceleration-mean()-X	
      frequencyBodyAcceleration-mean()-Y	
      frequencyBodyAcceleration-mean()-Z	
      frequencyBodyAcceleration-std()-X	
      frequencyBodyAcceleration-std()-Y	
      frequencyBodyAcceleration-std()-Z	
      frequencyBodyAccelerationJerk-mean()-X	
      frequencyBodyAccelerationJerk-mean()-Y	
      frequencyBodyAccelerationJerk-mean()-Z	
      frequencyBodyAccelerationJerk-std()-X	
      frequencyBodyAccelerationJerk-std()-Y	
      frequencyBodyAccelerationJerk-std()-Z	
      frequencyBodyGyroscope-mean()-X	
      frequencyBodyGyroscope-mean()-Y	
      frequencyBodyGyroscope-mean()-Z	
      frequencyBodyGyroscope-std()-X	
      frequencyBodyGyroscope-std()-Y	
      frequencyBodyGyroscope-std()-Z	
      frequencyBodyAccelerationMagnitude-mean()	
      frequencyBodyAccelerationMagnitude-std()	
      frequencyBodyBodyAccelerationJerkMagnitude-mean()	
      frequencyBodyBodyAccelerationJerkMagnitude-std()	
      frequencyBodyBodyGyroscopeMagnitude-mean()	
      frequencyBodyBodyGyroscopeMagnitude-std()	
      frequencyBodyBodyGyroscopeJerkMagnitude-mean()	
      frequencyBodyBodyGyroscopeJerkMagnitude-std()
      
180 observations are the result of the mean calculation on the column wise grouping of data for subject and activity ids.

# Tidy Data Criteria
The tidy data set produced confirms partly to the tidy data criteria repeated below

      1. Each variable forms a column.
      2. Each observation forms a row.
      3. Each type of observational unit forms a table.

The activity_id and activity_type columns both refer to the same variable one numeric and one descriptive. They are interchangable and one could be deleted to make the data more tidy however it was decided to keep the id data in the table to avoid any subsequent transformation from descriptor to id should it be required.


# References
1. http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
2. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012, http://www.icephd.org/sites/default/files/IWAAL2012.pdf
3. Tidy Data, Hadley Wickam, http://vita.had.co.nz/papers/tidy-data.pdf
4. Getting and Cleaning the Assignment, David Hood, https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/





    
    




