---
title: "readme"

---

#readme for run_analysis.R
This readme is for the run_analysis.R code.

The code is for the code that was created for the Getting and Cleaning Data Project.

##How to run the code
Execute the code within a new folder.

Code will auto download the data and create the appropiate steps as per the project

##What the script does:
1. Downloads the data
2. Unzips the files
3. Merges the training and test datasets
4. Sets the activity labels and column names
5. Takes only the mean and standard deviation variables
6. Aggregates the data basedd on Subject and Activity together with an average of all varibles
7. Writes out the data to a tab delimited file called tidy_data.txt

##Notes
New files will be created namely:
* tidy_data.txt - the tidy data that was required as an output of the file
* UCI HAR Dataset folder - folder of the unzipped files that are used fo rthis project