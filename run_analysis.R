activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

x_test <- read.table("X_test.txt",header = F)
colnames(x_test) <- as.character(features[,2]) #Part(4)
y_test <- read.table("y_test.txt",header = F,sep = "\t")

subject_test <- read.table("subject_test.txt",header = F)
x_test <- cbind(x_test,subject_test,y_test)

colnames(x_test)
x_train <- read.table("X_train.txt",header = F)
colnames(x_train) <- as.character(features[,2])  #Part(4)
y_train <- read.table("y_train.txt",header = F,sep = "\t")

subject_train <- read.table("subject_train.txt",header = F)
x_train <- cbind(x_train,subject_train,y_train)

#merge the data sets(Part 1)
all_data <- rbind(x_test,x_train)
colnames(all_data)[562] <- "subject"
colnames(all_data)[563] <- "activity_labels"
#Part(3) adds the activity labels
all_data <- merge(all_data,activity_labels,by.x = "activity_labels",by.y = "V1")
colnames(all_data)[564] <- "activity"

#Part(2) selects only those columns which have mean and std measurements
cols_mean_std <- grepl(".*mean.*|.*std.*",colnames(all_data))
all_data_mean_std <- all_data[,cols_mean_std]
new_data <- all_data_mean_std

new_data$activity <- all_data$activity
new_data$subject <- all_data$subject

#Part(5)
library(dplyr)
library(reshape2)

tidy_data <- melt(new_data,id.vars = c("subject","activity"))

tidy_data <- tidy_data %>% group_by(subject,activity,variable) %>% summarise(mean = mean(value))

write.table(tidy_data,"tidy.txt",row.names = F)
