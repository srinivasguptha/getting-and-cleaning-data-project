directtestdata<-read.table("UCI HAR Dataset/test/X_test.txt")
directtraindata<-read.table("UCI HAR Dataset/train/X_train.txt")
feature<-read.table("UCI HAR Dataset/features.txt")
feature<-feature[,2]
feature<-gsub("\\()","",feature)
feature<-gsub("\\-","",feature)
colnames(directtestdata)<-feature
colnames(directtraindata)<-feature
directtest_train<-rbind(directtestdata,directtraindata)
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(subject_test)<-"subject_id"
colnames(subject_train)<-"subject_id"
colnames(y_test)<-"activity_id"
colnames(y_train)<-"activity_id"
y<-rbind(y_test,y_train)
subject<-rbind(subject_test,subject_train)
x<-"mean()|std()"
filter<-grep(x,feature)
step2_directtest_train<-directtest_train[,c(filter[1:79])]
step2_test_train<-cbind(subject,y,step2_directtest_train)
step5 <-aggregate(step2_test_train, by=list(step2_test_train$activity_id,step2_test_train$subject_id),FUN=mean)
step5$activity_id[step5$activity_id == "1"]<-"WALKING"
step5$activity_id[step5$activity_id == "2"]<-"WALKING_UPSTAIRS"
step5$activity_id[step5$activity_id == "3"]<-"WALKING_DOWNSTAIRS"
step5$activity_id[step5$activity_id == "4"]<-"SITTING"
step5$activity_id[step5$activity_id == "5"]<-"STANDING"
step5$activity_id[step5$activity_id == "6"]<-"LAYING" 
step5
