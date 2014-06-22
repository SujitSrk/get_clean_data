#Read me for run_analysis.R

This script operates on the raw Samsung Human Activity Recognition Using Smartphones Dataset and provides a subset of  data merged from various files in the dataset. This subset can then be used further downstream analysis.

The run_analsyis script merges and training and test data sets, extracts a subset of the data having only the mean and standard deviation fields, brings in the activity labels and subject fields which are in different files into the same dataset and outputs the resulting tidy data set.  

File Location: The test and training data sets should be located in ./test and ./train directories where . is the source directory. The features.txt file should be located in same directory as the source.


Steps are as follows

1. Reads the test and training data sets (x_test/x_train) from their source directories and merges them as one dataset, mergedSet by using rbind


2. Reads ”features.txt”  to get the column names of the 561-field vector and assigns the column names to the columns of the merged dataset in Step 1

3. Extracts only those columns that have “mean” or “std” in their column names i.e. fields which are either mean or standard deviations. This extracted data set is stored in another dataset, extractedSet. 


4. The Activities that are measured is stored in y_test/y_train files as numbers – one number for each reading.   The y_test and x_test is merged using rbind to get the complete set of readings - this merged dataset is called mergeActivity. We add the mergectivity set as a column in the extractedSet  created in Step 3. This column is renamed to "ActivityID" to be used later while getting activity names.

5. The subjects that are used in the test is stored in subject_test/subject_train files in the respective directories. Similar to the previous step where we merge the test and train activities and create an additional ActivityID column in the extractedSet, we merge the test and train subjects (using rbind) and then add them as a new column (Subject) to the extractedSet. Now the extractedSet has the mean/std fields along with the Acitivity ID and Subject 

6. The field names to be used in the calculation are stripped of braces () and minus – characters as they create errors in the average function (unless escaped )

7. The average of all mean and standard deviation fields for each Subject+Activity combination is taken by using ddply function that groups over Subject and Activity and applies the mean function the group. It also names the field as avg_<field name>

7.  We will now add  descriptive Activity name  instead of Activity ID. For this the file containig the descriptive Activity names "activity_labels"  is read into a data set called acitivityNames which contains the acitivity ID and name.

8. This activityNames is joined  (using R merge) with the extractedSet on activityID to get the Activity Names into the extractedSet

9. The columns in the extractedSet  are reordered to have subject and activity names as first two columns,  Activity ID is removed and the rest of columns are kept.

10. The final data set is written to a comma separated text file written with a write.table so that it can be read by read.table
