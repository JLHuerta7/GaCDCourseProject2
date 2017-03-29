# CodeBook

The script takes wearable computing data from de UCI Human Activity Recognition Dataset, taken from Samsung Galaxy S 
accelerometers. The data can be accesed from the 
[UCI Machine Learning repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The full data set is contained in a directory named "UCI HAR Dataset". Subjects, measured features and activities (described below) are stored in different files. Data is also split into training and testing datasets. The script "run_analysis.R" merges all of this data in one big data frame, substitutes activity codes by its names, creates a new variable indicating if the record comes from the training or the testing dataset, and provides descriptive names to all the variables involved.

Afterwards, it creates a second dataframe that stores the averages of all the features (taken as the arithmetic mean, as not indicated otherwise in the project requirements) grouped by subject and activity. Lastly, it stores this dataframe in the text file "HAR_averages.txt", uploaded to the repository

## Dataframes description
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
- **Activity**: a string indicating the activity performed by the subject when the data was taken. There are six possible cases: walking, walking upstairs, walking downstairs, sitting, standing or laying  


The second dataframe contains:

- **Activity**: as described for dataframe 1
- **Subject**: as described for dataframe 1
- **Features averages**: as described above, averages were taken as the arithmetic mean. A different approach with the standard deviations could have been to calculate the full variance of the dataset, but this was not interpreted as required
