
# CODE BOOK
Code book that describes the variables, the data, and any transformations or work was performed to clean up the data called CodeBook.md

This data set is a tidy output from the raw Samsung Data Set that was recorded on experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years where each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

The raw data had been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  

The transformation from the raw data set to the tidy data set was done by merging the training and test data partions and grouping and averaging the readings for mean and standard deviation over each activity and subject.

## RAW DATA SET
 The 561-vector original fields in the raw data setare named as follows

1. The features selected for this database  come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-The time domain signals are prefixed 't' to denote time.
2. The acceleration signal is separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) 
3. The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ
4. The magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
5. Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)
6. These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
7. The set of variables that were estimated from these signals are: 

* mean(): Mean value
*std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.


## TIDY DATA SET
The new feilds in the tidy data set are average for a subset of the fields and are named avg_<original-field-name>. The subset deals with only the mean and standard deviations of the readings which are then grouped and averaged by subject and activity.
