# Package dependencies
if (!require("data.table")) {install.packages("data.table") 
    require("data.table")}
if (!require("reshape2")) {install.packages("reshape2")
    require("reshape2")}

# Download the train and test datasets
dataFile <- "DataSet.zip"
dataDir  <- "UCI HAR Dataset"
if (!file.exists(dataFile)){  
  fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, dataFile)
  
# Read all required .txt files and label the datasets
  if (!file.exists(dataDir)){ unzip(dataFile)}
  }


# Load datasets
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testX <- read.table("./UCI HAR Dataset/test/X_test.txt")
testY <- read.table("./UCI HAR Dataset/test/Y_test.txt")

trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainY <- read.table("./UCI HAR Dataset/train/Y_train.txt")

features <- read.table("./UCI HAR Dataset/features.txt")
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Merge the test and train subject datasets
subject <- rbind(testSubject, trainSubject)
colnames(subject) <- "subject"

# Merge the test and train labels with textual labels
label <- rbind(testY, trainY)
label <- merge(label, activityLabels, by=1)[,2]

# Merge the test and train main dataset with textual headings
data <- rbind(testX, trainX)
colnames(data) <- features[, 2]

# Merge all previous datasets
data <- cbind(subject, label, data)

write.table(data, file="data_set.txt")

# Create a smaller dataset containing only the mean and std variables
search <- grep("-mean|-std", colnames(data))
dataMeanStd <- data[,c(1,2,search)]

# Compute the means, grouped by subject and label
melted = melt(dataMeanStd, id.var = c("subject", "label"))
means = dcast(melted , subject + label ~ variable, mean)

# Save the resulting dataset
write.table(means, file="tidy_data.txt")

# Output the final dataset
means