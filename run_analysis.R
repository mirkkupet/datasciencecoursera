# Load training and test data into data frames

xtrain <- data.frame(read.table("UCI_HAR_Dataset/train/X_train.txt"))
activity <- data.frame(read.table("UCI_HAR_Dataset/train/y_train.txt"))
subjecttrain <- data.frame(read.table("UCI_HAR_Dataset/train/subject_train.txt"))
colnames(subjecttrain) <- c("subjectid")
colnames(activity) <- c("id")
ylabels <- data.frame(read.table("UCI_HAR_Dataset/activity_labels.txt"))
colnames(ylabels) <- c("id", "activity")
activity <- merge(activity,ylabels,by="id" ,all = TRUE)
activity <- tolower(activity$activity)
features <- data.frame(read.table("UCI_HAR_Dataset/features.txt"))
names(features) <- c("id", "feature")
names(xtrain) <- tolower(gsub("[-(),]", "", features$feature))
dftrain <- cbind(subjecttrain, activity, xtrain)

xtest <- data.frame(read.table("UCI_HAR_Dataset/test/X_test.txt"))
activity <- data.frame(read.table("UCI_HAR_Dataset/test/y_test.txt"))
subjecttest <- data.frame(read.table("UCI_HAR_Dataset/test/subject_test.txt"))
colnames(subjecttest) <- c("subjectid")
colnames(activity) <- c("id")
activity <- merge(activity,ylabels,by="id" ,all = TRUE)
activity <- tolower(activity$activity)
names(xtest) <- tolower(gsub("[-(),]", "", features$feature))
dftest <- cbind(subjecttest, activity, xtest)

# Merge training and testing data
train <- data.frame(rep("train", nrow(dftrain)))
names(train) <- "datasource"
test <- data.frame(rep("test", nrow(dftest)))
names(test) <- "datasource"
dftrain <- cbind(dftrain, train)
dftest <- cbind(dftest, test)
df <- rbind(dftest, dftrain)

# Extract only the mean and standard deviation for each measurement
df <- df[, grepl("subjectid|activity|datasource|mean|std", names(df))]

# Calculate averages for each subject and each activity and write in a file
library(dplyr)
df <- group_by(df, subjectid, activity)
data <- data.frame(unique(df[,1:2])) 
for (name in names(df[,3:(length(names(df))-1)])){
    summ <- data.frame(summarize_(df, average = paste0("mean(", name, ", na.rm = TRUE)")))
    names(summ) <- c("subjectid", "activity", paste("avg", name, sep="_"))
    data <- merge(data, summ, by.y = c("subjectid", "activity"))
    }
data <- arrange(data, subjectid, activity)
write.table(data, "UCI_HAR_Averages.txt", row.name=FALSE)
