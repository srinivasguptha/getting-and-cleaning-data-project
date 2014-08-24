getting-and-cleaning-data-project
=================================
The code is explained line wise
1	directtestdata<-read.table("UCI HAR Dataset/test/X_test.txt")

## reading the test data as it is with out any row any column names
2	directtraindata<-read.table("UCI HAR Dataset/train/X_train.txt")

##reading the train data as it is without any row or column names
3	feature<-read.table("UCI HAR Dataset/features.txt")

##reading the variables for the test and train data to use it as column names
4	feature<-feature[,2]

##filter out the variable names only as a vector to use it as column names
5	feature<-gsub("\\()","",feature)

##formatting the variable names by removing bracket from the names
6	feature<-gsub("\\-","",feature)

##formating the variable names by removing the "-" from the names
7	colnames(directtestdata)<-feature

##naming the columns for the test data read
8	colnames(directtraindata)<-feature

##naming the columns for the train data read
9	directtest_train<-rbind(directtestdata,directtraindata)

##merging the test and train data
10	y_test<-read.table("UCI HAR Dataset/test/y_test.txt")

##reading the activity id for the test data
11	y_train<-read.table("UCI HAR Dataset/train/y_train.txt")

##reading the activity id for the train data
12	subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")

##reading the subject id for the test data
13	subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")

##reading the subject id for train data
14	colnames(subject_test)<-"subject_id"

##naming the subject id column for test
15	colnames(subject_train)<-"subject_id"

##naming the subject id column for train
16	colnames(y_test)<-"activity_id"

##naming the activity id column for test
17	colnames(y_train)<-"activity_id"

##naming the activity id column for train
18	y<-rbind(y_test,y_train)

##merging the activity_id column of test and train
19	subject<-rbind(subject_test,subject_train)

##merging the subject_id column of test and train
20	x<-"mean()|std()"

##filtering the columns related to only mean and standard deviation for step 2 of project
21	filter<-grep(x,feature)

##filtering the columns related to only mean and standard deviation for step 2 of project
22	step2_directtest_train<-directtest_train[,c(filter[1:79])]

##filtering the columns related to only mean and standard deviation for step 2 of project
23	step2_test_train<-cbind(subject,y,step2_directtest_train)

##merging the subject_id,activity_id and data of both test and train
24	step5 <-aggregate(step2_test_train, by=list(step2_test_train	$activity_id,step2_test_train$subject_id),FUN=mean)

##aggregation required in step 5 with respect to subject_id and activity_id
25	step5$activity_id[step5$activity_id == "1"]<-"WALKING"

##Using descriptive activity names to name the activities in the data set
26	step5$activity_id[step5$activity_id == "2"]<-"WALKING_UPSTAIRS"

##Using descriptive activity names to name the activities in the data set
27	step5$activity_id[step5$activity_id == "3"]<-"WALKING_DOWNSTAIRS"

##Using descriptive activity names to name the activities in the data set
28	step5$activity_id[step5$activity_id == "4"]<-"SITTING"

##Using descriptive activity names to name the activities in the data set
29	step5$activity_id[step5$activity_id == "5"]<-"STANDING"

##Using descriptive activity names to name the activities in the data set
30	step5$activity_id[step5$activity_id == "6"]<-"LAYING" 

##Using descriptive activity names to name the activities in the data set
31	step5

##output is only the step5 dataset
