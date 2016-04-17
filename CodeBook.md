#CodeBook
This CodeBook explains the working of the R Script, `run_analysis.R` in detail-
The R script, `run_analysis.R`, does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Identifiers

* **subject** - The ID of the test subject
* **activity** - The type of activity performed when the corresponding measurements were taken

#Variables uses in *run_analysis.R*
* `train_x`, `train_y` and `train_sub` - Tables containing downloaded train data.
* `test_x`, `test_y` and `test_sub` - Tables containing downloaded test data.
* `features` and `activity_labels` - Tables containing downloaded *features* and *activity* labels data.
* `train` and `test` - Combined Tables for all train and test data respectively.
* `final_data` - Final combined table of train and test tables.
* `final_labels` - Character vector containing corrected labels for `features` table.
* `final_data_mean_std` - Modified final table to extract the *mean* and *std dev* columns.
* `averages_data` - Output table containing data set with the average of each variable for each *activity* and each *subject*.

#Activity Labels

* WALKING (value `1`): subject was walking during the test
* WALKING_UPSTAIRS (value `2`): subject was walking up a staircase during the test
* WALKING_DOWNSTAIRS (value `3`): subject was walking down a staircase during the test
* SITTING (value `4`): subject was sitting during the test
* STANDING (value `5`): subject was standing during the test
* LAYING (value `6`): subject was laying down during the test
