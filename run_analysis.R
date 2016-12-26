#-----------------
Introduction
#-----------------
# This script is required to do the following (text is extracted from Assignment description)

# - Use descriptive activity names to name the activities in the data set
# - Appropriately label the data set with descriptive variable names
#   See Section 1 below (also parts of Section 3)

# - Merge the training and the test sets to create one data set
#   See Section 2 below

# - Extract only the measurements on the mean and standard deviation for each measurement
#   See Section 3 below


# - From the data set in step 4, create a second, independent tidy data set with the 
# - average of each variable for each activity and each subject.
#   See Section 4

#-------------
# Main Script
#-------------
#The link to the file is supplied in the assignment. If the directory "./data"
#does not exist it is created and the data is downloaded from the URL into the file Dataset.zip

#-----------------------
# Download and unzip data
#-----------------------
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")


# Unzip the files into the directory "./data" located or created above in the working directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")

#-----------------------------
# Create Data Frames in memory
#------------------------------
# Create a data frame with the list of 561 features (or metrics) by reading from the file  "features.txt" in directory "./data/UCI HAR Dataset"
features <- read.table('./data/UCI HAR Dataset/features.txt')

# Create a data frame with the list of 6 activities by reading from the file  "activity_labels.txt" in directory "./data/UCI HAR Dataset"
activity_labels <- read.table('./data/UCI HAR Dataset/activity_labels.txt')


# Create three data frames for the testing files located in directory "./data/UCI HAR Dataset/test"
#   X_test.txt (2947 observations of 561 variables)
#   y_test.txt (2947 observations of 1 variable)
#   subject_test.txt  (2947 observations of 1 variable)

x_test <- read.table('./data/UCI HAR Dataset/test/X_test.txt')
y_test <- read.table('./data/UCI HAR Dataset/test/y_test.txt')
subject_test <- read.table('./data/UCI HAR Dataset/test/subject_test.txt')

# Create three data frames for the training files located in directory "./data/UCI HAR Dataset/train"
#   X_train.txt (7352 observations of 561 variables)
#   y_train.txt (7352 observations of 1 variable)
#   subject_train.txt  (7352 observations of 1 variable)

x_train <- read.table('./data/UCI HAR Dataset/train/X_train.txt')
y_train <- read.table('./data/UCI HAR Dataset/train/y_train.txt')
subject_train <- read.table('./data/UCI HAR Dataset/train/subject_train.txt')

#------------------------
# Section 1
#------------------------
# Goals of this section are
#   Use descriptive activity names to name the activities in the data set
#   Appropriately label the data set with descriptive variable names

# The data fram activity_labels contains the an identifier and a descriptor of the activities used in the physical tests. 
# The header labels used are "activity_id" and  "activity_type" respectiively
names(activity_labels) <- c("activity_id", "activity_type")

# "activity _id" is used for the header label
names (y_train) <- c("activity_id")
names (y_test)  <- c("activity_id")
names (subject_test)  <- c("subject_id")
names (subject_train)  <- c("subject_id")

# The feature names can be applied to the train and test data before or after merging. 
# In this case we will add the feature names (561 names. The second column of the features data "features$V2" is the feature name). 
# This is done before any merging of x_train, y_train and subject_train data.
names (x_train) <- features$V2
names (x_test)  <- features$V2

#---------------
# Section 2
#---------------
# Goal of this section is
#   Merge the training and the test sets to create one data set

# Merge the columns of the x_train, y_train and subject_train data. Each data set has 7352 observations or rows.
# Order is subject, activity, feature for ease of reading
merge_train <- cbind(subject_train, y_train, x_train)

# Merge the columns of the x_test Merge the columns of the x_test, y_test and subject_test data. Each data set has 2947 observations or rows.
# Order is subject, activity, feature for ease of reading
merge_test <- cbind(subject_test, y_test, x_test)

# merge data into one data set
merge_test_and_train <- rbind(merge_test, merge_train)

#---------------
# Section 3
#---------------
# Goal of this section is
#   Extract only the measurements on the mean and standard deviation for each measurement
# 
# First get all the column names and then select the subset that contain mean() or std()
column_names <- colnames(merge_test_and_train)

# Now the subset of columns with "mean()" or "std()" only,  in the feature name are filtered. 
# columns with e.g meanFreq() are not included based on a review of the ./data/UTC HAR Dataset/features_info.txt file
# meanFreq valuues are not a mean or std relevant feature at this time- 
# grepl return the results in a logical vector. This vector of TRUE or FALSE values is then used 
# to build the subset data set of measurements containing std or mean in the feature name
# Columns "activity_id" and "subject_id" are considered together with columns with std or mean 
# in the name using the OR function

columns_with_mean_or_std <- (
            grepl("activity_id", column_names) |
            grepl("subject_id", column_names) |
            grepl("mean\\(\\)", column_names) |
            grepl("std\\(\\)", column_names)
            )
# the logical vector returned by grepl is used to select the valid columns from the merger test and train data

data_mean_std <- merge_test_and_train[, columns_with_mean_or_std == TRUE]

# (For information, 68 columns are selected including activity_id and subject_id)

# Now the activity_id values need to be linked with the descriptors in the 
# ./data/UCI HAR Dataset/activity_labels.txt file
# An additional column is added to the data linking activity_id to activity_type i.e a value to a descriptor 
# e.g activity_id = 1 is activity_type = walking

data_mean_std_activity_descriptors <- merge (data_mean_std, activity_labels, by = "activity_id", all.x=TRUE)

# Looking at the ./data/UCI HAR Dataset/features_info-txt file, names use t prefix for time and f for freq
# The full word can be added to the feature names for ease of reading using the gsub command to replace the existing letters

# replace feature names beginning with "t" to "time"
names (data_mean_std_activity_descriptors) <- gsub ("^t", "time", names(data_mean_std_activity_descriptors))

# replace feature names beginning with "f" to "frequency"
names (data_mean_std_activity_descriptors) <- gsub ("^f", "frequency", names(data_mean_std_activity_descriptors))

# replace feature names containing "Gyro" with "Gyroscope"
names (data_mean_std_activity_descriptors) <- gsub ("Gyro", "Gyroscope", names(data_mean_std_activity_descriptors))

# replace feature names containing "Mag" with "Magnitude"
names (data_mean_std_activity_descriptors) <- gsub ("Mag", "Magnitude", names(data_mean_std_activity_descriptors))

# replace feature names containing "Acc" with "Acceleration"
names (data_mean_std_activity_descriptors) <- gsub ("Acc", "Acceleration", names(data_mean_std_activity_descriptors))

# In this way the feature labels can be modified for ease of understanding

#------------------------
# Section 4
#------------------------
# Goal of this section is
# From the data set above, data_mean_std_activity_descriptors, , create a second, independent tidy data set with the 
# average of each variable for each activity and each subject

# Here we use ddply to apply a function, here it is the mean function, to grouped data i.e
# group by subject_id and group by activity_type from data_mean_std_activity_descriptors.
# The results are recombined into a data frame tidy_data_set
# numcolwise(mean) is used to operate only on numeric values and apply the mean function, column wise on 
# the data subsets 

tidy_data_set = ddply(data_mean_std_activity_descriptors, c("subject_id", "activity_type"), numcolwise(mean))

# write the data fram contents to a file, "independent_tidy_data_set.txt", in the working directory
write.table (tidy_data_set, file="independent_tidy_data_set.txt", row.name=FALSE)

