#The following script performs the following tasks on the
#Human Activity Recognition Using Smartphones Data Set:

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


library(reshape2)

# Load the activity and features labels
activityLabels <- read.csv("./activity_labels.txt",
                           sep=" ",
                           col.names=c("id","activityLabel"))
features <- read.csv("./features.txt",
                     sep=" ",
                     col.names=c("id","featureLabel"))

# Load the test data set
subjectTest <- read.table("./test/subject_test.txt",
                          col.names="subjectid")
xTest <- read.table("./test/X_test.txt")
# Remove symbols from labels
colnames(xTest) <- gsub("[\\,\\(\\)\\.\\-]","",features[,"featureLabel"])
yTest <- read.table("./test/y_test.txt",
                    col.names="activityid")
test <- cbind("test",subjectTest,yTest,xTest)
colnames(test)[1] <- "Test/Train"


# Load the training data set
subjectTrain <- read.table("./train/subject_train.txt",
                           col.names="subjectid")
xTrain <- read.table("./train/X_train.txt")
# Remove symbols from labels
colnames(xTrain) <- gsub("[\\,\\(\\)\\.\\-]","",features[,"featureLabel"])
yTrain <- read.table("./train/y_train.txt",
                     col.names="activityid")
train <- cbind("train",subjectTrain,yTrain,xTrain)
colnames(train)[1] <- "Test/Train"

# 1. Merges the training and the test sets to create one data set.
tidy <- rbind(test,train)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
tidy <- tidy[,c(1:3,grep("mean.*\\(\\)",features[,"featureLabel"],ignore.case=TRUE)+3,
                          grep("std\\(\\)",features[,"featureLabel"],ignore.case=TRUE)+3)]



# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
tidy <- merge(tidy, activityLabels, by.x="activityid", by.y="id", all.x=TRUE)


tidy <- melt(tidy, id.vars=c("subjectid", "activityLabel"))
tidy[,4] <- as.numeric(tidy[,4])
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy <- dcast(tidy, subjectid + activityLabel ~ variable, fun.aggregate=mean)
#tidy <- cbind(tidy[,-(3:4)])

# Export file
write.table(tidy,"./tidyData.csv", row.name=FALSE, sep=",")
