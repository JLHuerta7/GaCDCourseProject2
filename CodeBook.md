# CodeBook

The script takes wearable computing data from de UCI Human Activity Recognition Dataset, taken from Samsung Galaxy S 
accelerometers. The data can be accesed from the 
[UCI Machine Learning repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The full data set is contained in a directory named "UCI HAR Dataset".

The first dataframe includes as its variables:

- **Subject**: an integer code that identifies the subject of study 
- **Features**: numeric signals, briefly described in "features_info.txt" document in the repository, the listed features are these:

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

*t* are direct signals, *f* denotes a Fast Fourier Transform over the mentioned variables. Only the mean and the standard 
deviation (std) of the signals were taken

- **Type**: a factor indicating if values were used for training (train) or testing (test) ML algorithms
- **Activity**: a string indicating the activity performed by the subject when the data was taken. There are six possible cases: 
walking, walking upstairs, walking downstairs, sitting, standing or laying
