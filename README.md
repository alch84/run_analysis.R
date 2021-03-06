# Course Assignment: Getting and Cleaning Data
This Readme document describes how the code in the repository works.  This code was written as the solution for the course assignment of Module 3: Getting and Cleaning Data of the Data Science specialization course.

The raw data consists of 563 variables in total (including subject ID and activity), and are split into training dataset (70%) and test data (30%). The tidy data required would involve combining these datasets together into a single dataset, ensuring headings are described in appropriate level of detail, and only includes the mean of each field, summarised for each of the 30 subjects and 6 activity types.   

The code (named run_analysis.R) is in the form of a single R script that is to be run in full.

The code's objective is to take the raw data provided in the working directory, and generate a tidy dataset as required by the assignment.  As long as the Samsung data folder (named "UCI HAR dataset") exists in the working directory, the code when run performs the following actions:

1. Combines the training and test data into a single dataset
2. Extracts the fields that relate to the mean and standard deviation measures only
3. Renames the headings to allow for detailed descriptions
4. Replaces the activity identifiers with a description of the activity.
5. Calculates the average of each field, by each of the 30 subjects, and each of the 6 activities.
6. Writes the table into a text file.

The output will be a text file containing the tidy dataset, saved in the working directory.
