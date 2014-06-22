
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
The new feilds in the tidy data set a 79-vector subset of the 561-vector raw data fields. The tify subset deals with only the mean and standard deviation fields of the original raw data set which are then grouped and averaged by subject and activity. The fields in the tidy data set are obtained by prefixing avg_  to the corresponding raw field name e.g avg_tbodyAcc_mean_x is average of tbodyAcc_mean_x for that subject and activity (braces and minus signs are removed from the original field name to avoid parsing errors)
The fields in the tidy data set are as follows. The tidy data frame is written using write.table() so it can be read back by read.table()

* Subject                           
* Activity                          
* avg_tbodyAcc_mean_x              
* avg_tBodyAcc_mean_Y               
* avg_tBodyAcc_mean_Z               
* avg_tBodyAcc_std_X               
* avg_tBodyAcc_std_Y                
* avg_tBodyAcc_std_Z                
* avg_tGravityAcc_mean_X           
* avg_tGravityAcc_mean_Y            
* avg_tGravityAcc_mean_Z            
* avg_tGravityAcc_std_X            
* avg_tGravityAcc_std_Y             
* avg_tGravityAcc_std_Z             
* avg_tBodyAccJerk_mean_X          
* avg_tBodyAccJerk_mean_Y           
* avg_tBodyAccJerk_mean_Z           
* avg_tBodyAccJerk_std_X           
* avg_tBodyAccJerk_std_Y            
* avg_tBodyAccJerk_std_Z            
* avg_tBodyGyro_mean_X             
* avg_tBodyGyro_mean_Y             
* avg_tBodyGyro_mean_Z              
* avg_tBodyGyro_std_X              
* avg_tBodyGyro_std_Y               
* avg_tBodyGyro_std_Z               
* avg_tBodyGyroJerk_mean_X         
* avg_tBodyGyroJerk_mean_Y          
* avg_tBodyGyroJerk_mean_Z          
* avg_tBodyGyroJerk_std_X          
* avg_tBodyGyroJerk_std_Y           
* avg_tBodyGyroJerk_std_Z           
* avg_tBodyAccMag_mean             
* avg_tBodyAccMag_std               
* avg_tGravityAccMag_mean           
* avg_tGravityAccMag_std           
* avg_tBodyAccJerkMag_mean          
* avg_tBodyAccJerkMag_std           
* avg_tBodyGyroMag_mean            
* avg_tBodyGyroMag_std              
* avg_tBodyGyroJerkMag_mean         
* avg_tBodyGyroJerkMag_std         
* avg_fBodyAcc_mean_X               
* avg_fBodyAcc_mean_Y               
* avg_fBodyAcc_mean_Z              
* avg_fBodyAcc_std_X                
* avg_fBodyAcc_std_Y                
* avg_fBodyAcc_std_Z               
* avg_fBodyAcc_meanFreq_X           
* avg_fBodyAcc_meanFreq_Y           
* avg_fBodyAcc_meanFreq_Z          
* avg_fBodyAccJerk_mean_X           
* avg_fBodyAccJerk_mean_Y           
* avg_fBodyAccJerk_mean_Z          
* avg_fBodyAccJerk_std_X            
* avg_fBodyAccJerk_std_Y            
* avg_fBodyAccJerk_std_Z           
* avg_fBodyAccJerk_meanFreq_X       
* avg_fBodyAccJerk_meanFreq_Y       
* avg_fBodyAccJerk_meanFreq_Z      
* avg_fBodyGyro_mean_X              
* avg_fBodyGyro_mean_Y              
* avg_fBodyGyro_mean_Z             
* avg_fBodyGyro_std_X               
* avg_fBodyGyro_std_Y               
* avg_fBodyGyro_std_Z              
* avg_fBodyGyro_meanFreq_X          
* avg_fBodyGyro_meanFreq_Y          
* avg_fBodyGyro_meanFreq_Z         
* avg_fBodyAccMag_mean              
* avg_fBodyAccMag_std               
* avg_fBodyAccMag_meanFreq         
* avg_fBodyBodyAccJerkMag_mean      
* avg_fBodyBodyAccJerkMag_std       
* avg_fBodyBodyAccJerkMag_meanFreq 
* avg_fBodyBodyGyroMag_mean         
* avg_fBodyBodyGyroMag_std          
* avg_fBodyBodyGyroMag_meanFreq    
* avg_fBodyBodyGyroJerkMag_mean     
* avg_fBodyBodyGyroJerkMag_std      
* avg_fBodyBodyGyroJerkMag_meanFreq