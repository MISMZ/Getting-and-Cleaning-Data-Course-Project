## load packages
library("tidyverse")

## create column names from features.txt
feature_name <- read_table2("UCI HAR Dataset/features.txt", col_names = FALSE)
feature_name <- pull(feature_name, X2)

col_names <- c("Subject","Activity")
col_names <- append(col_names, feature_name)
col_names <- make.names(col_names, unique = TRUE)

## Import test data
test_data <- read_table("UCI HAR Dataset/test/X_test.txt", col_names = FALSE)
test_subject <- read_table("UCI HAR Dataset/test/subject_test.txt", col_names = FALSE)
test_activity <- read_table("UCI HAR Dataset/test/y_test.txt", col_names = FALSE)

## Import train data
train_data <- read_table("UCI HAR Dataset/train/X_train.txt", col_names = FALSE)
train_subject <- read_table("UCI HAR Dataset/train/subject_train.txt", col_names = FALSE)
train_activity <- read_table("UCI HAR Dataset/train/y_train.txt", col_names = FALSE)

## Set column names for data 
testdf <- bind_cols(test_subject, test_activity, test_data)
colnames(testdf) <- col_names
traindf <- bind_cols(train_subject, train_activity, train_data)
colnames(traindf) <- col_names

## select column with names containing mean and std
testdf <- testdf %>%  select(Subject, Activity, contains('mean'),contains('std')) %>% mutate(Dataset = "test")
traindf <- traindf %>% select(Subject, Activity, contains('mean'),contains('std')) %>% mutate(Dataset = "train")

## Combine both data
tidy_data <- bind_rows(testdf, traindf)

## Uses descriptive activity names to name the activities in the data set
tidy_data <- tidy_data %>% mutate(
    Activity = case_when(
    Activity == 1 ~ "Walking",
    Activity == 2 ~ "Walking_Upstairs",
    Activity == 3 ~ "Walking_Downstairs",
    Activity == 4 ~ "Sitting",
    Activity == 5 ~ "Standing",
    Activity == 6 ~ "Laying"
  )
) 

## Write .csv output
tidy_data %>% write.csv(., file = "tidy_data.csv")

## Calculate mean and sd by activity and write .csv output
mean_by_activity <- tidy_data %>% group_by(Activity) %>% summarise_at(vars(-Subject,-Activity,-Dataset),mean) %>% write.csv(., file = "tidy_data_by_activity.csv")
## sd_by_activity <- tidy_data %>% group_by(Activity) %>% summarise_at(vars(-Subject,-Activity,-Dataset),sd)

## Calculate mean and sd by subject and write .csv output
mean_by_subject <- tidy_data %>% group_by(Subject) %>% summarise_at(vars(-Subject,-Activity,-Dataset),mean) %>% write.csv(., file = "tidy_data_by_subject.csv")
## sd_by_subject <- tidy_data %>% group_by(Subject) %>% summarise_at(vars(-Subject,-Activity,-Dataset),sd)
