#Introduction to the files

* `CodeBook.md` - You are __here.__ This is an R Markdown Document which serves to explain what is the purpose of each file in the repo and how they work.
* `README` - The README file gives details about this Course Project
* `run_analysis.R` - This is an R Script which performs certain functions that are explanined below.
* `output_tidy_avg_data.txt` - This is the output of the final task in the `run_analysis.R` file. This is in the form of a tidy dataset.

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
* `averages_data` - Final output table containing a data set with the average of each variable for each *activity* and each *subject*.

#Activity Labels

* WALKING (value `1`): subject was walking during the test
* WALKING_UPSTAIRS (value `2`): subject was walking up a staircase during the test
* WALKING_DOWNSTAIRS (value `3`): subject was walking down a staircase during the test
* SITTING (value `4`): subject was sitting during the test
* STANDING (value `5`): subject was standing during the test
* LAYING (value `6`): subject was laying down during the test
