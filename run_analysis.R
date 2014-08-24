###Produce combined data set.

#load Data
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")

#add the labels (y_test) to the x_test data 
x_test[, "Activity"] <- y_test
x_train[,"Activity"] <- y_train

#add subject data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test[, "Subject"] <- subject_test
x_train[,"Subject"] <- subject_train

#combine test and training data sets
data <- rbind(x_test, x_train)

###Extract mean and std dev variables.
features <- read.table("UCI HAR Dataset/features.txt")

#subset features which only contain mean or std in the name.
features <- subset(features, grepl("mean|std", features$V2))

#create an index of the columns to keep, including the activity column index and the
#extracted mean and std features.
index <- features[,1]
activity_index <- which( colnames(data)=="Activity")
subject_index <- which( colnames(data)=="Subject")
index <- c(index, activity_index, subject_index)

#extract the variables which contain the previously extracted features of mean or std.
data2 <- data[,index]

data2$Activity[data2$Activity == 1] <- "WALKING"
data2$Activity[data2$Activity == 2] <- "WALKING_UPSTAIRS"
data2$Activity[data2$Activity == 3] <- "WALKING_DOWNSTAIRS"
data2$Activity[data2$Activity == 4] <- "SITTING"
data2$Activity[data2$Activity == 5] <- "STANDING"
data2$Activity[data2$Activity == 6] <- "LAYING"

#add column names
data3 <- data2
colnames(data3) <- features$V2
names(data3)[80] <- "Activity"
names(data3)[81] <- "Subject"

#cleaning column names
colnames(data3) <- gsub("\\()","",colnames(data3))
colnames(data3) <- gsub("\\-","",colnames(data3))
colnames(data3) <- gsub("mean","Mean",colnames(data3))
colnames(data3) <- gsub("std","Std",colnames(data3))
colnames(data3) <- gsub("BodyBody","Body",colnames(data3))

###Create averages by subject and activity
agg <- aggregate(data3[,1:79], by=list(data3$Subject,data3$Activity), FUN=mean)
names(agg)[1] <- "Subject"
names(agg)[2] <- "Activity"

