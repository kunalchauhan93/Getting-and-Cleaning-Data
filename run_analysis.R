## Step 1
# For Reading all the available data

test.labels <- read.table("test/y_test.txt", col.names="label")
test.subjects <- read.table("test/subject_test.txt", col.names="subject")
test.data <- read.table("test/X_test.txt")
train.labels <- read.table("train/y_train.txt", col.names="label")
train.subjects <- read.table("train/subject_train.txt", col.names="subject")
train.data <- read.table("train/X_train.txt")

# Binding the data together in the format of test and train subjects, labels and other data

data <- rbind(cbind(test.subjects, test.labels, test.data),
              cbind(train.subjects, train.labels, train.data))

## Step 2
# Reading the features from the text file provided in the Dataset

features <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE)

# Retaining the features of Mean and Standard Deviation

features.mean.std <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]

# Now we select only the Means and Standard Deviations from the available data
# As the data has subjects and labels in the beginning we increment it by 2

data.mean.std <- data[, c(1, 2, features.mean.std$V1+2)]

## Step 3
# Reading the activity labels from the text file provided in the Dataset

labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)

# Replacing all the labels in the data with the label names

data.mean.std$label <- labels[data.mean.std$label, 2]

## Step 4
# First step here would be to make a list of current column names and feature names

good.colnames <- c("subject", "label", features.mean.std$V2)

# Then, in the next step we tidy the list by removing every non-alphabetic character and converting to lowercase

good.colnames <- tolower(gsub("[^[:alpha:]]", "", good.colnames))

# The tidy list obtained from the above step can be used for column naming of the data

colnames(data.mean.std) <- good.colnames

## Step 5
# Finding the mean for each combination of subject and label

aggr.data <- aggregate(data.mean.std[, 3:ncol(data.mean.std)],
                       by=list(subject = data.mean.std$subject, 
                               label = data.mean.std$label),
                       mean)

# Writing the data
write.table(format(aggr.data, scientific=T), "tidy2.txt",
            row.names=F, col.names=F, quote=2)