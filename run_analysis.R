# This function runs analysis on the raw samsung data and produdes a tidy output based 
# This program reads the raw Samsung Data and creates a tidy data set
# having the average of mean and standard deviation fields for each subject nad activity
# The details of transformation are in the README file

run_analysis <- function () {
  
  # Load plyr library for using ddply in the last step
  library(plyr)
  
  
  
  # ASSIGNMENT STEP 1: Merges the training and the test sets to create one data set.
  
  # Read Test Set 
  testSet <- read.table("./test/X_test.txt")
  
  # Read Train Set
  trainSet <- read.table("./train/X_train.txt")
  
  # Merge Test and Train set using rbind
  mergedSet <- rbind(testSet, trainSet)
  
  
  
  # Read Features.txt to get Column names to parse mean/std names and then assign column names to mergedSet
  cnames <- read.table("./features.txt")
  
  # Transpose Column names  to rows to assign to merged datasets' column names 
  # Note - Column name is second column in the read.table of features.txt as first column is the row index 1:561 
  cnamesVector <- t(cnames[2])
  
  # Assign features.txt field names to column names in merged data set
  colnames(mergedSet) <- cnamesVector
  
  
  # ASSIGNMENT STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
  # Get columns with  "std" (standard deviation) or "mean"  in the column names 
  # This grep Note-ignores angle (,Means) automatically as M is capital - angle(, Means) are not included in average
  extractColumns <- grep ("std|mean", colnames(mergedSet))
  extractedSet <- mergedSet [extractColumns]
  

  # Add the Activity and Subject  to the extracedSet by getting data from the test&train Activity and Subect Data sets
 
  
  # Add Actiity Columns (IDs not Names - names are added in the last step ) 
  # Read Test Activity table Data set
  testActivity <- read.table("./test/y_test.txt")
  # Read Train Activity table Data set
  trainActivity <- read.table("./train/y_train.txt")
  
  # Merge Test and Train Activity sets
  mergeActivity <- rbind (testActivity, trainActivity)
  
  # Assign column name activityID to join (merge) later on 
  colnames(mergeActivity) <- c("ActivityID")
  
  #  Now add this activityID  set as a newcolumn to the main merged Dataset with the mean/std x values extracted 
 
  extractedSet["ActivityID"] <- mergeActivity
  
  # Do similar merge/join/add column for subjects as it was done for Activity above
  # This is required to find the average of Subject-Acitivity for mean/std fields
 
  # Read Test Subject table  
  testSubject <- read.table("./test/subject_test.txt")
  
  # Read Train Subject table  
  trainSubject <- read.table("./train/subject_train.txt")
  
  # Merge Test and Train Subject tables
  mergeSubject <- rbind (testSubject, trainSubject)
  
  # Now add the Subject as a newcolumn to the main merged Dataset with the mean/std x values extracted
  # It already has  ActivityID from previus step
  extractedSet["Subject"] <- mergeSubject
  
  
  
  # ASSIGNMENT STEP 4: Appropriately labels the data set with descriptive variable names
  # Here we are cleaning up labels from of braces () and replacing minus - with underscore _ as otherwise it will give error in ddply
  
  #  Clean 1: Remove () from column names as it will cause error in ddply
  colnames(extractedSet) <- gsub("\\(\\)","",colnames(extractedSet))
  #  Clean 2: Remove - from column names as it will cause error in ddply
  colnames(extractedSet) <- gsub("\\-","_",colnames(extractedSet))
  
  # ASSIGNMENT STEP 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
  # Plyr function ddply is used to get the average of Subject and Activity
  # Note - The extractedSet has AcitivtyID, Subject and all fields in original data set that has 
  # either mean or std  in its name
 
   
  cdata <- ddply(extractedSet, c("ActivityID", "Subject"), summarise, 
                 avg_tbodyAcc_mean_x = mean(tBodyAcc_mean_X), 
                 avg_tBodyAcc_mean_Y = mean(tBodyAcc_mean_Y),
                 avg_tBodyAcc_mean_Z = mean(tBodyAcc_mean_Z),
                 avg_tBodyAcc_std_X = mean(tBodyAcc_std_X),
                 avg_tBodyAcc_std_Y = mean(tBodyAcc_std_Y),
                 avg_tBodyAcc_std_Z = mean(tBodyAcc_std_Z) ,
                 avg_tGravityAcc_mean_X = mean(tGravityAcc_mean_X),
                 avg_tGravityAcc_mean_Y = mean(tGravityAcc_mean_Y),
                 avg_tGravityAcc_mean_Z = mean(tGravityAcc_mean_Z),
                 avg_tGravityAcc_std_X = mean (tGravityAcc_std_X),
                 avg_tGravityAcc_std_Y = mean (tGravityAcc_std_Y),
                 avg_tGravityAcc_std_Z = mean (tGravityAcc_std_Z),
                 avg_tBodyAccJerk_mean_X = mean (tBodyAccJerk_mean_X),
                 avg_tBodyAccJerk_mean_Y = mean(tBodyAccJerk_mean_Y),
                 avg_tBodyAccJerk_mean_Z = mean(tBodyAccJerk_mean_Z),
                 avg_tBodyAccJerk_std_X = mean(tBodyAccJerk_std_X),
                 avg_tBodyAccJerk_std_Y = mean(tBodyAccJerk_std_Y),
                 avg_tBodyAccJerk_std_Z = mean (tBodyAccJerk_std_Z),
                 avg_tBodyGyro_mean_X = mean (tBodyGyro_mean_X),
                 avg_tBodyGyro_mean_Y = mean(tBodyGyro_mean_Y),
                 avg_tBodyGyro_mean_Z = mean(tBodyGyro_mean_Z),
                 avg_tBodyGyro_std_X = mean (tBodyGyro_std_X),
                 avg_tBodyGyro_std_Y = mean(tBodyGyro_std_Y),
                 avg_tBodyGyro_std_Z = mean(tBodyGyro_std_Z),
                 avg_tBodyGyroJerk_mean_X = mean(tBodyGyroJerk_mean_X),
                 avg_tBodyGyroJerk_mean_Y = mean(tBodyGyroJerk_mean_Y),
                 avg_tBodyGyroJerk_mean_Z = mean(tBodyGyroJerk_mean_Z),
                 avg_tBodyGyroJerk_std_X = mean(tBodyGyroJerk_std_X),
                 avg_tBodyGyroJerk_std_Y = mean(tBodyGyroJerk_std_Y),
                 avg_tBodyGyroJerk_std_Z = mean(tBodyGyroJerk_std_Z),
                 avg_tBodyAccMag_mean = mean(tBodyAccMag_mean),
                 avg_tBodyAccMag_std = mean(tBodyAccMag_std),
                 avg_tGravityAccMag_mean= mean(tGravityAccMag_mean),
                 avg_tGravityAccMag_std = mean(tGravityAccMag_std),
                 avg_tBodyAccJerkMag_mean = mean(tBodyAccJerkMag_mean),
                 avg_tBodyAccJerkMag_std = mean(tBodyAccJerkMag_std),
                 avg_tBodyGyroMag_mean = mean(tBodyGyroMag_mean),
                 avg_tBodyGyroMag_std = mean(tBodyGyroMag_std),
                 avg_tBodyGyroJerkMag_mean = mean(tBodyGyroJerkMag_mean),
                 avg_tBodyGyroJerkMag_std = mean(tBodyGyroJerkMag_std),
                 avg_fBodyAcc_mean_X = mean(fBodyAcc_mean_X),
                 avg_fBodyAcc_mean_Y = mean(fBodyAcc_mean_Y),
                 avg_fBodyAcc_mean_Z = mean(fBodyAcc_mean_Z),
                 avg_fBodyAcc_std_X = mean (fBodyAcc_std_X),
                 avg_fBodyAcc_std_Y = mean(fBodyAcc_std_Y),
                 avg_fBodyAcc_std_Z = mean(fBodyAcc_std_Z),
                 avg_fBodyAcc_meanFreq_X = mean(fBodyAcc_meanFreq_X),
                 avg_fBodyAcc_meanFreq_Y = mean(fBodyAcc_meanFreq_Y),
                 avg_fBodyAcc_meanFreq_Z = mean(fBodyAcc_meanFreq_Z),
                 avg_fBodyAccJerk_mean_X = mean(fBodyAccJerk_mean_X),
                 avg_fBodyAccJerk_mean_Y = mean(fBodyAccJerk_mean_Y),
                 avg_fBodyAccJerk_mean_Z = mean(fBodyAccJerk_mean_Z),
                 avg_fBodyAccJerk_std_X = mean(fBodyAccJerk_std_X),
                 avg_fBodyAccJerk_std_Y = mean(fBodyAccJerk_std_Y),
                 avg_fBodyAccJerk_std_Z = mean(fBodyAccJerk_std_Z),
                 avg_fBodyAccJerk_meanFreq_X = mean(fBodyAccJerk_meanFreq_X),
                 avg_fBodyAccJerk_meanFreq_Y = mean(fBodyAccJerk_meanFreq_Y),
                 avg_fBodyAccJerk_meanFreq_Z = mean(fBodyAccJerk_meanFreq_Z),
                 avg_fBodyGyro_mean_X = mean(fBodyGyro_mean_X),
                 avg_fBodyGyro_mean_Y = mean(fBodyGyro_mean_Y),
                 avg_fBodyGyro_mean_Z = mean(fBodyGyro_mean_Z),
                 avg_fBodyGyro_std_X = mean(fBodyGyro_std_X),
                 avg_fBodyGyro_std_Y = mean(fBodyGyro_std_Y),
                 avg_fBodyGyro_std_Z = mean(fBodyGyro_std_Z),
                 avg_fBodyGyro_meanFreq_X = mean (fBodyGyro_meanFreq_X),
                 avg_fBodyGyro_meanFreq_Y = mean (fBodyGyro_meanFreq_Y),
                 avg_fBodyGyro_meanFreq_Z = mean (fBodyGyro_meanFreq_Z),
                 avg_fBodyAccMag_mean = mean (fBodyAccMag_mean),
                 avg_fBodyAccMag_std = mean (fBodyAccMag_std),
                 avg_fBodyAccMag_meanFreq = mean (fBodyAccMag_meanFreq),
                 avg_fBodyBodyAccJerkMag_mean = mean(fBodyBodyAccJerkMag_mean),
                 avg_fBodyBodyAccJerkMag_std = mean (fBodyBodyAccJerkMag_std),
                 avg_fBodyBodyAccJerkMag_meanFreq = mean (fBodyBodyAccJerkMag_meanFreq),
                 avg_fBodyBodyGyroMag_mean = mean(fBodyBodyGyroMag_mean),
                 avg_fBodyBodyGyroMag_std = mean (fBodyBodyGyroMag_std),
                 avg_fBodyBodyGyroMag_meanFreq = mean(fBodyBodyGyroMag_meanFreq),
                 avg_fBodyBodyGyroJerkMag_mean = mean (fBodyBodyGyroJerkMag_mean),
                 avg_fBodyBodyGyroJerkMag_std = mean (fBodyBodyGyroJerkMag_std),
                 avg_fBodyBodyGyroJerkMag_meanFreq = mean (fBodyBodyGyroJerkMag_meanFreq)
              
                 )
  
  #ASSIGNMENT STEP 3: Get descriptive names for the activity.
  # This is done here as the previous join was giving some problems!
  
  # Get Activity labels from activity_labels.txt file
  activityNames <- read.table("./activity_labels.txt")
  
  # Assign column names as ActivityID and activityName to merge on activityID later
  colnames(activityNames) <- c("ActivityID", "ActivityName")
  
  ## Now change activityID to activity name
  cdata2 <- merge (cdata, activityNames, by="ActivityID", sort=FALSE)
  
  ## Rearrange columns to have Subject and ACtivityName as first two columns and then the mean/std columns
  # and remove ActivityID to create the final clean set
  
  cdata3 <- cdata2 [c(2,82,3:81)]
  
  # Write the tidy data set  to a text file which is uploaded as part of project 
  
  write.table(cdata3, file="cdata3.txt", sep=",", col.names=colnames(cdata3))
  
}