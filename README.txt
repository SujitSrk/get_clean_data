Read me for run_analysis.txt

This script operates on the raw Samsung Human Activity Recognition Using Smartphones Dataset and provides a subset of  data merged from various files in the dataset. This subset can then be used further downstream analysis.

The run_analsyis script merges and training and test data sets, extracts a subset of the data having only the mean and standard deviation fields, brings in the activity labels and subject fields which are in different files into the same dataset and outputs the resulting tidy data set

Steps are as follows
1. Reads the test and training data sets (x_test/x_train) from their source directories and merges them as one dataset, mergedSet by using rbind
2. Reads ”features.txt”  to get the column names of the 561-field vector and assigns the column names to the columns of the merged dataset in Step 1
3. Extracts only those columns that have “mean” or “std” in their column names i.e. fields which are either mean or standard deviations. This extracted data set is stored in another dataset, extractedSet. We will now add Subject and descriptive Activity name as additional columns in this dataset to be used for averaging fields over Subject and descriptive Activity  in the last step.
4. The Activities that are measured is stored in y_test/y_train files as numbers – one number for each reading.  The Activity_labels file contains the descriptive Activity names corresponding to the activity numbers.   The y_test and x_test is merged using rbind to get the complete set of readings - this merged dataset is called mergeActivity. Now the Activity numbers in this merged set is replaced by descriptive names by joining with Activity_labels (using R merge) on activity number (activityID). The resulting table contains both  Activity number and descriptive name. We add the Activity name as a column in the extractedSet  created in Step 3.
5. The subjects that are used in the test is stored in subject_test/subject_train files in the respective directories. Similar to the previous step where we merge the test and train activities and create an additional Activity column in the extractedSet, we merge the test and train subjects (using rbind) and then add them as a new column (Subject) to the extractedSet. Now the extractedSet has the mean/std fields along with the Acitivity names and Subject
6. The field names to be used in the calculation are stripped of braces () and minus – characters as they create errors in the average function (unless escaped )
7. The average of all mean and standard deviation fields for each Subject+Activity combination is taken by using ddply function that groups over Subject and Activity and applies the mean function the group. It also names the field as avg_<field name>
