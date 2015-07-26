#Read Training Data into R
Subject_Train<-read.table("UCI HAR Dataset/train/subject_train.txt")
X_Train<-read.table("UCI HAR Dataset/train/X_train.txt")
Y_Train<-read.table("UCI HAR Dataset/train/Y_train.txt")

#Read Test Data into R
Subject_Test<-read.table("UCI HAR Dataset/test/subject_test.txt")
X_Test<-read.table("UCI HAR Dataset/test/X_test.txt")
Y_Test<-read.table("UCI HAR Dataset/test/Y_test.txt")

#Read Features into R, change data headings to correct names
Features<-read.table("UCI HAR Dataset/features.txt")
names(X_Train)<-Features$V2
names(X_Test)<-Features$V2
names(Y_Train)<-"Activity"
names(Y_Test)<-"Activity"
names(Subject_Train)<-"Subject"
names(Subject_Test)<-"Subject"

#Combine all training and test data into single dataset
Train_Data<-cbind(Subject_Train,Y_Train,X_Train)
Test_Data<-cbind(Subject_Test,Y_Test,X_Test)
All_Data<-rbind(Train_Data,Test_Data)

#Extract only fields with mean and standard deviation
Req_Fields<-grep("mean\\(\\)|std\\(\\)",Features$V2)
All_Data2<-All_Data[,c(1,2,Req_Fields+2)]

#Rename all headings to detailed heading descriptions
names(All_Data2)<-gsub("^t","Time ",names(All_Data2))
names(All_Data2)<-gsub("^f","Frequency ",names(All_Data2))
names(All_Data2)<-gsub("Acc","Accelerometer ",names(All_Data2))
names(All_Data2)<-gsub("Gyro","Gyroscope ",names(All_Data2))
names(All_Data2)<-gsub("BodyBody","Body",names(All_Data2))
names(All_Data2)<-gsub("Body","Body ",names(All_Data2))
names(All_Data2)<-gsub("Gravity","Gravity ",names(All_Data2))
names(All_Data2)<-gsub("Mag","Magnitude ",names(All_Data2))
names(All_Data2)<-gsub("Jerk","Jerk ",names(All_Data2))
names(All_Data2)<-gsub("-mean()","Mean ",names(All_Data2))
names(All_Data2)<-gsub("-std()","Standard Deviation ",names(All_Data2))

#Read Activity labels and convert numerical labels into activities
Activity_Labels<-read.table("UCI HAR Dataset/activity_labels.txt")
All_Data2$Activity<-as.character(All_Data2$Activity)
All_Data2$Activity[All_Data2$Activity==1]<-as.character(Activity_Labels[1,2])
All_Data2$Activity[All_Data2$Activity==2]<-as.character(Activity_Labels[2,2])
All_Data2$Activity[All_Data2$Activity==3]<-as.character(Activity_Labels[3,2])
All_Data2$Activity[All_Data2$Activity==4]<-as.character(Activity_Labels[4,2])
All_Data2$Activity[All_Data2$Activity==5]<-as.character(Activity_Labels[5,2])
All_Data2$Activity[All_Data2$Activity==6]<-as.character(Activity_Labels[6,2])

#Create tidy dataset
All_Data3<-aggregate(.~Subject+Activity,All_Data2,mean)

#Write dataset into Text file
write.table(All_Data3,file="TidyData.txt",row.names=FALSE)
