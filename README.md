

#Libraries needed

	plyr 
	magrittr 

#Steps to process the data for each question#


**1.Merges the training and the test sets to create one data set.**

1. Load file "features.txt" into table feature

For test files:

2. Load file "test/subject_test.txt" into table subject_test

3. Load file "test/Y_test.txt" into table y_test ajusting column names to "activity"

4. Load file "test/X_test.txt" into table x_test ajusting column names to column V2 in features table

5. Bind all 3 test files into all_test table

For train files:

6. Load file "train/subject_train.txt" into table subject_train

7. Load file "train/Y_train.txt" into table y_train ajusting column names to "activity"

8. Load file "train/X_train.txt" into table x_train ajusting column names to column V2 in features table

9. Bind all 3 train files into all_train table

10. Put all together using bind and ordering by ID into table fulldata


#2.Extracts only the measurements on the mean and standard deviation for each measurement. 

1. select fulldata columns with names with "ID" or "activity" or "mean" or "std" and insert into table fulldata_selected


#3.Uses descriptive activity names to name the activities in the data set

1. Load file "activity_labels.txt" into table activity_labels

2. rename activity_labels columns "V1" to "activityID" and "V2" to "activity"

3. rename fulldata_selected columns "activity" to "activityID" and "ID" to "subject"

4. merge data from fulldata_selected and activity_labels by column activityID


#4.Appropriately labels the data set with descriptive variable names. 

1. Rename columns with contracted names as: t to Time, f to Frequency, Acc to accelerometer, Gyro to gyroscope, bodybody to body, mag to magnitude


#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

1. get the step for result and calculate the mean for each column and subject

2. write the data to a file "tdy.txt" (with no column names)
