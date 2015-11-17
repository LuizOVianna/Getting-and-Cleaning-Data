# -----------------------------------------------------------------------------
#
# You should create one R script called run_analysis.R that does the following. 
#
# -----------------------------------------------------------------------------

# Libraries needed
library("plyr")
library("magrittr")


# -----------------------------------------------------------------------------
#
# 1.Merges the training and the test sets to create one data set.
#
# -----------------------------------------------------------------------------

# Get Features
features<-read.table("features.txt",sep="",stringsAsFactors=F)

# Get Test data
subject_test<-read.table("test/subject_test.txt",sep="",stringsAsFactors=F, col.names= "ID")
y_test<-read.table("test/Y_test.txt",sep="",stringsAsFactors=F, col.names = "activity")
x_test<-read.table("test/X_test.txt",sep="",stringsAsFactors=F, col.names = features$V2)
all_test<-cbind(subject_test,y_test,x_test) 

# Get Train data
subject_train<-read.table("train/subject_train.txt",sep="",stringsAsFactors=F,  col.names= "ID")
y_train<-read.table("train/Y_train.txt",sep="",stringsAsFactors=F, col.names = "activity")
x_train<-read.table("train/X_train.txt",sep="",stringsAsFactors=F, col.names = features$V2)
all_train<-cbind(subject_train,y_train,x_train) 

fulldata <- all_test %>%
        rbind(all_train)  %>%
        arrange(ID)

# -----------------------------------------------------------------------------
#
# 2.Extracts only the measurements on the mean and standard 
#    deviation for each measurement. 
#
# -----------------------------------------------------------------------------

fulldata_selected <- fulldata[ , grepl( "ID|activity|mean|std", names( fulldata ) ) ]
# Included ID and activity because they will be used in the next questions


# -----------------------------------------------------------------------------
#
# 3.Uses descriptive activity names to name the activities in the data set
#
# -----------------------------------------------------------------------------

# Get Activity labels
activity_labels<-read.table("activity_labels.txt",sep="",stringsAsFactors=F)

# Rename columns to facilitate merging and naming
activity_labels<-rename(activity_labels, c("V1" = "activityID","V2" = "activity"))
fulldata_selected<-rename(fulldata_selected, c("activity" = "activityID"))
fulldata_selected<-rename(fulldata_selected, c("ID" = "subject"))
fulldata_selected<- merge(fulldata_selected,activity_labels, by ="activityID")

# -----------------------------------------------------------------------------
#
# 4.Appropriately labels the data set with descriptive variable names. 
#
# -----------------------------------------------------------------------------


names(fulldata_selected) <- sub("^t", "Time", names(fulldata_selected))
names(fulldata_selected) <- sub("^f", "Frequency", names(fulldata_selected))
names(fulldata_selected) <- sub("Acc", "Accelerometer", names(fulldata_selected))
names(fulldata_selected) <- sub("Gyro", "Gyroscope", names(fulldata_selected))
names(fulldata_selected) <- sub("BodyBody", "Body", names(fulldata_selected))
names(fulldata_selected) <- sub("Mag", "Magnitude", names(fulldata_selected))


# -----------------------------------------------------------------------------
#
# 5.From the data set in step 4, creates a second, independent tidy data
#   set with the average of each variable for each activity and each subject.
#
# -----------------------------------------------------------------------------

tdydata<-aggregate(. ~subject + activity, fulldata_selected, mean)
tdydata<-arrange(tdydata, activity, subject)

write.table(tdydata, file="tdy.txt", row.name=FALSE)
