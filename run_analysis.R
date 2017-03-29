library(dplyr)

## Data reading ----
activities <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
features <- read.table("features.txt", stringsAsFactors = FALSE)

subject_test <- read.table(file.path("test", "subject_test.txt"), 
                           stringsAsFactors = FALSE)
X_test <- read.table(file.path("test", "X_test.txt"), 
                           stringsAsFactors = FALSE)
y_test <- read.table(file.path("test", "y_test.txt"), 
              stringsAsFactors = FALSE)
subject_train <- read.table(file.path("train", "subject_train.txt"), 
              stringsAsFactors = FALSE)
X_train <- read.table(file.path("train", "X_train.txt"), 
              stringsAsFactors = FALSE)
y_train <- read.table(file.path("train", "y_train.txt"), 
              stringsAsFactors = FALSE)

## Taking only mean and std ----

names <- features[[2]][grepl(pattern = "mean\\(\\)|std\\(\\)", 
                             x = features[[2]])]

x_test <- X_test[grepl(pattern = "mean\\(\\)|std\\(\\)", 
                       x = features[[2]])]

x_train <- X_train[grepl(pattern = "mean\\(\\)|std\\(\\)", 
                         x = features[[2]])]

## Setting variable names ----

names <- gsub(x = names, pattern = "[-\\(\\)\\,]", replacement = "")

names(x_test) <- names
names(x_train) <- names

names(subject_test) <- "subject"
names(subject_train) <- "subject"
names(y_test) <- "activityid"
names(y_train) <- "activityid"

## Data merging ----
## Merging by columns (a column indicating if data are from training or testing
## is also included)
type <- factor(rep("test", length(unlist(subject_test))), 
               levels = c("test", "train"))
test <- cbind(subject_test, x_test, y_test, type)
type <- factor(rep("train", length(unlist(subject_train))), 
               levels = c("test", "train"))
train <- cbind(subject_train, x_train, y_train, type)

## Merging by rows
data <- rbind(test, train)


## Setting descriptive activity names ----

names(activities) <- c("activityid","activity")

merge(data, activities)
data <- merge(data, activities) %>% select(-activityid)

## Creating final data set ----

data2 <- data %>% 
        select(-type) %>% 
        group_by(activity, subject) %>% 
        summarise_all(funs(mean))


write.table(data2, file = "HAR_averages.txt", row.names = FALSE)
