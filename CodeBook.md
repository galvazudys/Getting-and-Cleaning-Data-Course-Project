# Code book

## Data downloaded url: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## packages used for assignment:

- packages::plyr


## Main variables in data set

- subject
- activity

## all measurments in data sets:

- tBodyAccMeanX
- tBodyAccMeanY
- tBodyAccMeanZ
- tBodyAccStdX
- tBodyAccStdY
- tBodyAccStdZ
- tGravityAccMeanX
- tGravityAccMeanY
- tGravityAccMeanZ
- tGravityAccStdX
- tGravityAccStdY
- tGravityAccStdZ
- tBodyAccJerkMeanX
- tBodyAccJerkMeanY
- tBodyAccJerkMeanZ
- tBodyAccJerkStdX
- tBodyAccJerkStdY
- tBodyAccJerkStdZ
- tBodyGyroMeanX
- tBodyGyroMeanY
- tBodyGyroMeanZ
- tBodyGyroStdX
- tBodyGyroStdY
- tBodyGyroStdZ
- tBodyGyroJerkMeanX
- tBodyGyroJerkMeanY
- tBodyGyroJerkMeanZ
- tBodyGyroJerkStdX
- tBodyGyroJerkStdY
- tBodyGyroJerkStdZ
- tBodyAccMagMean
- tBodyAccMagStd
- tGravityAccMagMean
- tGravityAccMagStd
- tBodyAccJerkMagMean
- tBodyAccJerkMagStd
- tBodyGyroMagMean
- tBodyGyroMagStd
- tBodyGyroJerkMagMean
- tBodyGyroJerkMagStd
- fBodyAccMeanX
- fBodyAccMeanY
- fBodyAccMeanZ
- fBodyAccStdX
- fBodyAccStdY
- fBodyAccStdZ
- fBodyAccMeanFreqX
- fBodyAccMeanFreqY
- fBodyAccMeanFreqZ
- fBodyAccJerkMeanX
- fBodyAccJerkMeanY
- fBodyAccJerkMeanZ
- fBodyAccJerkStdX
- fBodyAccJerkStdY
- fBodyAccJerkStdZ
- fBodyAccJerkMeanFreqX
- fBodyAccJerkMeanFreqY
- fBodyAccJerkMeanFreqZ
- fBodyGyroMeanX
- fBodyGyroMeanY
- fBodyGyroMeanZ
- fBodyGyroStdX
- fBodyGyroStdY
- fBodyGyroStdZ
- fBodyGyroMeanFreqX
- fBodyGyroMeanFreqY
- fBodyGyroMeanFreqZ
- fBodyAccMagMean
- fBodyAccMagStd
- fBodyAccMagMeanFreq
- fBodyBodyAccJerkMagMean
- fBodyBodyAccJerkMagStd
- fBodyBodyAccJerkMagMeanFreq
- fBodyBodyGyroMagMean
- fBodyBodyGyroMagStd
- fBodyBodyGyroMagMeanFreq
- fBodyBodyGyroJerkMagMean
- fBodyBodyGyroJerkMagStd
- fBodyBodyGyroJerkMagMeanFreq

## Activity Labels

- WALKING (value 1): subject was walking during the test
- WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test
- WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test
- SITTING (value 4): subject was sitting during the test
- STANDING (value 5): subject was standing during the test
- LAYING (value 6): subject was laying down during the test

## Values of my workspace in R matching files from Original:

- trainX--x_train.txt
- trainY--y_train.txt
- testX--x_test.txt
- testY--y_test.txt
- subject_test--subject_test.txt
- subject_train--subject_train.txt
- features--features.txt
- acttiv_labels--activity_labels.txt

## Actions Performed Get To Clean Data:

Startting from loading all .txt files from downloaded and unziped folder,we use function read.table() and pass argument
file.choose().we load from folder using same function: x_train.txt,y_train.txt,x_test.txt,y_test.txt,subject_test.txt,
subject_train.txt,features.txt,activity_labels.txt.

As we gone see when we laod x_train and x_test files they have same variable and observation amount,so we can use rbind() 
function to combine all togher,same for y_train : y_test. we perform same action for subject_test and subject_train using
rbind() function.

Next step search for any features that have mean and std with function grep(".*mean.*|.*std.*", features[,2]) .After we gone assing 
names to that value we extracted.

combain activities labels and train and test labels variable in column.In that new value we got we gone assign names "activity"
and "subject" using names() function.

For last step we gone combine all new values we made and extracted from dataset by using cbind() function binding by columns.
we load plyr package and use ddply() function with corecct arguments.this function gone apply specific function we putted as argument
function(x) colMean(x[,1:79]) and subset specific columns,all columns a part from subject and activity.we can check all names in data set by passing names()
function to see what columns we have.so we gone apply function and get averages( mean function reprersents that).

we just write independent data table containing our extracted averages(mean) and safe to averages.txt.




