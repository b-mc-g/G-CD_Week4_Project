# G-CD_Week4_Project
# Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. 

    You will be required to submit: 
    1) a tidy data set as described below, 
    2) a link to a Github repository with your script for performing the analysis, and 
    3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
    4)You should also include a README.md in the repo with your scripts. This file explains how all of the scripts work and how they are connected.

 One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

    Here are the data for the project:

    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

    You should create one R script called run_analysis.R that does the following.

        1) Merges the training and the test sets to create one data set.
        2) Extracts only the measurements on the mean and standard deviation for each measurement.
        3) Uses descriptive activity names to name the activities in the data set
        4) Appropriately labels the data set with descriptive variable names.
        5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
# Files in this Repo
    
    Codebook.md - information about the data and variables
    run_analysis.R - the R script to load, transform and write the tidy data
    README.md - General description of the project, its data, objectives and outputs
    
    
# Steps to create the tidy data file
    
    
    Choose a working directory and download the run_analysis.R file from Github.
    
    Run the R file using e.g in R Studio.
    
    The raw data is downloaded and unzipped by the R script
    
    The script also writes the tidy data file to the working directory
    
    The file written is called 
    
            independent_tidy_data_set.txt
            
# How the script works

The detailled working of the script is described using comments in the R script itself. The main areas of the script are divided into data downloading and unzipping and Sections ( 1 to 4) that correspondapproximately with the tasks defined in the assignment definition. 

Section 1 - Goals of this section are
    Use descriptive activity names to name the activities in the data set
    Appropriately label the data set with descriptive variable names
Section 2 - Goal of this section is
    Merge the training and the test sets to create one data set
Section 3 - Goal of this section is
    Extract only the measurements on the mean and standard deviation for each measurement
Section 4 - Goal of this section is
    From the data set above, data_mean_std_activity_descriptors, , create a second, independent tidy data set with the 
    average of each variable for each activity and each subject

Section 2 and 3 overlap in that they both deal with changing labels into more readable forms for different data frames. 



    
    
    
