#Variables

---------------------------------------------------------------
1.Merges the training and the test sets to create one data set.
---------------------------------------------------------------

feature :  file "features.txt" 

subject_test : file "test/subject_test.txt" 

y_test:  file "test/Y_test.txt" 

x_test:  file "test/X_test.txt"

all_test : all test files together


subject_train :  file "train/subject_train.txt"

y_train: file "train/Y_train.txt" 

x_train: file "train/X_train.txt" 

all_train all train files togeher

fulldata: alltrain and alltest joined

---------------------------------------------------------------
 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
---------------------------------------------------------------

fulldata_selected: only fulldata columns with names with "ID" or "activity" or "mean" or "std" 

---------------------------------------------------------------
 3.Uses descriptive activity names to name the activities in the data set
---------------------------------------------------------------

activity_labels: file "activity_labels.txt" with names ajusted


---------------------------------------------------------------
 4.Appropriately labels the data set with descriptive variable names. 
---------------------------------------------------------------
uses fulldata_selected

---------------------------------------------------------------
 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
---------------------------------------------------------------

tdydata : the final data for the project 

