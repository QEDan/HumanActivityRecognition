CodeBook for Tidy Human Activity Recognition Data
=================================================

Data
----
The original dataset is the "Human Activity Recognition Using Smartphones Data Set" (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The data has been cleaned as described below.

Feature Selection 
-----------------
The features in this data are time-series signals from the accelerometers and gyroscopes of personal mobile devices. Variables with names prefixed by 't' indicate a time-domain signal and variables with names prefixed with an 'f' indicate Fast Fourier Transform (FFT) specra. The accelerometer data has been separated into body and gravity components. All variables are decomposed into Cartisian components and a postfix 'X', 'Y', or 'Z' is added to the variable name to indicate the directional components. 

Only components that indicate a mean or standard deviation have been retained from the original data set.

The variables described in the data set are the following, where {XYZ} indicates that there are three variables, one for each Cartesian component, and {mean|std} indicates that there are two variables, one describing the mean value and the other describing the standard deviation. For example, the Body acceleration variable breaks into the following 6 entries: tBodyAccmeanX, tBodyAccmeanY, tBodyAccmeanZ, tBodyAccstdX, tBodyAccstdY, tBOdyAccstdZ. The full list of variables is as follows:

* tBodyAcc{mean|std}{XYZ}
* tGravityAcc{mean|std}{XYZ}
* tBodyAccJerk{mean|std}{XYZ}
* tBodyGyro{mean|std}{XYZ}
* tBodyGyroJerk{mean|std}{XYZ}
* tBodyAccMag{mean|std}
* tGravityAccMag{mean|std}
* tBodyAccJerkMag{mean|std}
* tBodyGyroMag{mean|std}
* tBodyGyroJerkMag{mean|std}
* fBodyAcc{mean|std}{XYZ}
* fBodyAccJerk{mean|std}{XYZ}
* fBodyGyro{mean|std}{XYZ}
* fBodyAccMag{mean|std}
* fBodyAccJerkMag{mean|std}
* fBodyGyroMag{mean|std}
* fBodyGyroJerkMag{mean|std}

All features are normalized and bounded within [-1,1].

Tidy Data Set
-------------

The final data set is a table of comma-separated values describing 30 subjects and 6 activities. There are 180 rows and 68 columns.

