setwd("~/DS Coursera/Getting and Cleaning Data/Week4 Course Project/UCI HAR Dataset/")
library(plyr)

## Load the datasets
train_x <- read.table("train/X_train.txt")
train_y <- read.table("train/y_train.txt")
train_sub <- read.table("train/subject_train.txt")
test_x <- read.table("test/X_test.txt")
test_y <- read.table("test/y_test.txt")
test_sub <- read.table("test/subject_test.txt")

## Load features and activity datasets
features <- read.table("features.txt", colClasses = c("character"))
activity_labels <- read.table("activity_labels.txt", col.names = c("ActivityId", "Activity"))

############ 1.Merge the training and the test sets to create one data set

train <- cbind(train_y, train_sub, train_x)
test <- cbind(test_y, test_sub, test_x)

## Final dataset
final_data <- rbind(train, test)

## Label the columns
final_labels <- rbind(rbind(features, c(562, "Subject")), c(563, "ActivityId"))[,2]
names(final_data) <- final_labels

############ 2.Extract only the measurements on the mean and standard deviation for each measurement

## grep to extract columns with mean and stddev
final_data_mean_std <- final_data[,grepl("mean|std|Subject|ActivityId", names(final_data))]

############ 3. Use descriptive activity names to name the activities in the data set

final_data_mean_std <- join(final_data_mean_std, activity_labels, by ='ActivityId', match = "first");
final_data_mean_std <- final_data_mean_std[, -1]

############ 4. Appropriately label the data set with descriptive variable names

names(final_data_mean_std) <- gsub('\\(|\\)',"", names(final_data_mean_std), perl = TRUE)

# Make syntactically valid names
names(final_data_mean_std) <- make.names(names(final_data_mean_std))

# Make clearer names
names(final_data_mean_std) <- gsub('Acc',"Acceleration", names(final_data_mean_std))
names(final_data_mean_std) <- gsub('GyroJerk',"Angular Acceleration", names(final_data_mean_std))
names(final_data_mean_std) <- gsub('Gyro',"Angular Speed", names(final_data_mean_std))
names(final_data_mean_std) <- gsub('Mag',"Magnitude", names(final_data_mean_std))
names(final_data_mean_std) <- gsub('^t',"Time Domain.", names(final_data_mean_std))
names(final_data_mean_std) <- gsub('^f',"Frequency Domain.", names(final_data_mean_std))
names(final_data_mean_std) <- gsub('\\.mean',".Mean", names(final_data_mean_std))
names(final_data_mean_std) <- gsub('\\.std',".Standard Deviation", names(final_data_mean_std))
names(final_data_mean_std) <- gsub('Freq\\.',"Frequency.", names(final_data_mean_std))
names(final_data_mean_std) <- gsub('Freq$',"Frequency", names(final_data_mean_std))

############ 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject

averages_data <- ddply(final_data_mean_std, c("Subject","Activity"), numcolwise(mean))
write.table(averages_data, file = "averages_data.txt", row.name=FALSE)