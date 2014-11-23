#Downlaod the dataset and rename to SamsungDataset
downloadData<-function(){
  url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url, "SamsungDataset.zip", method="curl")
  unzip("SamsungDataset.zip")
}

#combine all test files into one massive dataframe
#First get the test data
test_x<-read.table("UCI HAR Dataset/test/X_test.txt")
test_y<-read.table("UCI HAR Dataset/test/Y_test.txt")
subjec_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
flabels<-read.table("UCI HAR Dataset/features.txt")
flabels<-flabels[,2]

#set the activity and subject colnames
colnames(test_x)<-flabels
df<-cbind(test_y, test_x)
colnames(df)[1]<-"Activity"
df<-cbind(subjec_test, df)
colnames(df)[1]<-"Subject"

#Second get training data and activity labesl
train_x<-read.table("UCI HAR Dataset/train/X_train.txt")
train_y<-read.table("UCI HAR Dataset/train/Y_train.txt")
subjec_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")

#set the activity and subject colnames
colnames(train_x)<-flabels
df2<-cbind(train_y, train_x)
colnames(df2)[1]<-"Activity"
df2<-cbind(subjec_train, df2)
colnames(df2)[1]<-"Subject"

#bind the two data frames for merged data
df<-rbind(df,df2)

#subset only the Means and SDs
df<-df[grepl("Activity|Subject|mean\\(\\)|std\\(\\)",colnames(df))]

#Set the Activity Labels
df$Activity<-activity_labels[df$Activity,2]

#Aggregate the dataset by Subject and Activity and using averages of each varible
df<-aggregate(df, by=list(df$Subject, df$Activity), FUN=mean)
df$Subject<-df$Group.1
df$Activity<-df$Group.2
df$Group.1<-NULL
df$Group.2<-NULL

#write out the data 
write.table(df, "tidy_dataset.txt", sep="\t", row.names = FALSE)

