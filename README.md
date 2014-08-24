#Cleaning of the Human Activity Recognition using Smartphones Data Set

The initial data set combines many measurements of data taken from participants carrying smartphones. Gyroscopic and accelerometer measurements were taken whilst 30 participants were performing various activities.

The run_analysis.R file has been used to clean the data, which is detailed below.


##There are 4 files to the analysis:
- UCI HAR Dataset - contains the initial accelerometer and gyroscopic data
- run_analysis.R - The R script used to clean the data
- codebook.pdf - A codebook which describes the variables in the output of run_analysis.R
- readme.md - This file which describes what everything does

## Run_analysis.R
###Cleaning
The script has done the following tasks to clean the data:
- Merged the test and training data sets.
- Removed unecessary characters from the feature names.
- Filtered out any features which are not the mean or standard deviation. (This has been done by wether the features name included std or mean in the title).
- Converted the activity feature numbers to categorical values (e.g 1 to Walking, 2 to Walking_Upstairs).

###Output
The *agg* data frame contains an aggregated output of the data. It shows the mean for each measurement against the different subjects and activities.