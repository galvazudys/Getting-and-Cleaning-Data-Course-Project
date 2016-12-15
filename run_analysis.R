# Step 1
#We start from loading training and test data in to R

trainX<-read.table(file.choose())# we load X_train.txt file from directory its located 
######################################################################################
trainY<-read.table(file.choose())#we load Y_train.txt file from directory its located
######################################################################################
testX<-read.table(file.choose())# we load same way data for test files, choosing files named X_test.txt in directory
####################################################################################################################
testY<-read.table(file.choose())#we load Y test data  from Y_test.txt,choosing files from directory

#Step 2
#We bind tables we create in Step 1

X_train_test<-rbind(trainX,testX)# We can easy bind trainX and testX tables,they have same obs. and same amount of columns(variables)
####################################################################################################################################
Y_train_test<-rbind(trainY,testY)#same as above we did with X we able to do with trainY and testY.
##################################################################################################

#Step 3
#we gone load subject data using read.table command

subject_test<-read.table(file.choose())# we load subject_test from subject_test.txt from directory
##################################################################################################
subject_train<-read.table(file.choose())# we load subject_train.txt.
###################################################################
subject_train_test<-rbind(subject_train,subject_test)# we bind subject_train and subject_test  togher, using rbind() function.
#############################################################################################################################

#Step4
#we gone load features and extracxt features that have mean and std in names.

features<-read.table(file.choose())#first we load file from features.txt 
########################################################################
mean_Std_features<-grep(".*mean.*|.*std.*", features[,2])#now we gone search for any features that have mean and std in name and assign.
#######################################################################################################################################
X_train_test<-X_train_test[,mean_Std_features]# with next 2 fuctions we gone add names to X_train_test data we made.
names(X_train_test)<-features[mean_Std_features,2]#-----------"----------
######################################################################
#Step 5
#we load activity labels data and assign names.

acttiv_labels<-read.table(file.choose())#we load data from activity_labels.txt file
###################################################################################
Y_train_test[,1]<-acttiv_labels[Y_train_test[,1],2]#we combain activities labels and train and test labels variable in column.
#############################################################################################################################
names(Y_train_test)<-"activity" # we assign names to columns
############################################################
names(subject_train_test)<-"subject"# same here assign names to column.

#Step 6
#we gone join all files we created in column bind (cbind()) function.

final_dataset<-cbind(X_train_test,Y_train_test,subject_train_test)# we bind all 3 datasets in one using cbind() function.

#step 7
#we gone create tidy data set with the average of each variable for each activity and each subject.we gone exclude last two columns from data set,
#because they have subject and activity.we gone need plyr package here.

library(plyr)# load a package in to R.
#####################################
averages_subject_activity<-ddply(final_dataset, .(subject,activity), function(x) colMeans(x[,1:79]))# we gone use ddply() function that apply function for each subset,
#of data set and returns combine data frame.we gone subset only 79 colums from data sets,because last 2 are subject and activity.

# Step 8
# we gone write new independant file for Averages we got in last function, and safe in new file called Averages.txt
write.table(averages_subject_activity,"Averages.txt", row.names = F)
