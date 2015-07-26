#Course Assignment: Getting and Cleaning Data

##About the Code Book

This Codebook describes the variables of the raw data used, and also all the transformations and work performed to convert this raw data into the tidy dataset, which is the output required by the course assignment. 

##Raw data

Full details of the variables of the raw data are set out in the features.txt file. 

The variables consist of signals that are used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

1. tBodyAcc-XYZ
2. tGravityAcc-XYZ
3. tBodyAccJerk-XYZ
4. tBodyGyro-XYZ
5. tBodyGyroJerk-XYZ
6. tBodyAccMag
7. tGravityAccMag
8. tBodyAccJerkMag
9. tBodyGyroMag
10. tBodyGyroJerkMag
11. fBodyAcc-XYZ
12. fBodyAccJerk-XYZ
13. fBodyGyro-XYZ
14. fBodyAccMag
15. fBodyAccJerkMag
16. fBodyGyroMag
17. fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

1. mean(): Mean value
2. std(): Standard deviation
3. mad(): Median absolute deviation 
4. max(): Largest value in array
5. min(): Smallest value in array
6. sma(): Signal magnitude area
7. energy(): Energy measure. Sum of the squares divided by the number of values. 
8. iqr(): Interquartile range 
9. entropy(): Signal entropy
10. arCoeff(): Autorregresion coefficients with Burg order equal to 4
11. correlation(): correlation coefficient between two signals
12. maxInds(): index of the frequency component with largest magnitude
13. meanFreq(): Weighted average of the frequency components to obtain a mean frequency
14. skewness(): skewness of the frequency domain signal 
15. kurtosis(): kurtosis of the frequency domain signal 
16. bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
17. angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

1. gravityMean
2. tBodyAccMean
3. tBodyAccJerkMean
4. tBodyGyroMean
5. tBodyGyroJerkMean

##Transformations

The run_analysis.R code performs the following transformations:

1. Combines the training and test data into a single dataset.  The subject, activity and variables dataset are combined horizontally using the cbind function, and the resultant consolidated training and test data are then appended vertically to form a single consolidated dataset, with 563 variables. 

2. Extracts the variables that relate only to the mean and standard deviation measures, while retaining the Subject ID and Activity variables.  This reduces the number of variables to 68 variables.

3. The headings above are renamed to allow for more detailed descriptions that are more easily understood by the user.
"t" is renamed to "Time"
"f" is renamed to "Frequency"
"Gyro" is renamed to "Gyroscope"
"Acc" is renamed to "Accelerometer"
"Mag" is renamed to "Magnitude"
"Std" is renamed to "Standard Deviation"

4. Replaces the activity identifiers with a description of the activity. The numbers 1 to 6 which represent each of the activities are renamed the full activity description, i.e. "walking", "walking upstairs", "walking_downstairs", "sitting", "standing", "laying".  This is set out in the activity_labels.txt file.

5. Finally, the dataset is summarised, such that for each field, the average each is calculated, for each of the 30 subjects, and each of the 6 activities described in 4 above.  This reduces the number of rows in the dataset to 180 (30 subjects x 6 ).

##Transformed Variables

The transformed variables are listed below:

1. Subject
2. Activity
3. Time Body Accelerometer Mean - XYZ
4. Time Body Accelerometer Standard Deviation - XYZ
5. Time Gravity Accelerometer Mean - XYZ
6. Time Gravity Accelerometer Standard Deviation - XYZ
7. Time Body Accelerometer Jerk Mean - XYZ
8. Time Body Accelerometer Jerk Standard Deviation - XYZ
9. Time Body Gyroscope Mean - XYZ
10. Time Body Gyroscope Standard Deviation - XYZ
11. Time Body Gyroscope Jerk Mean - XYZ
12. Time Body Gyroscope Jerk Standard Deviation - XYZ
13. Time Body Accelerometer Magnitude Mean
14. Time Body Accelerometer Magnitude Standard Deviation
15. Time Gravity Accelerometer Magnitude Mean
16. Time Gravity Accelerometer Magnitude Standard Deviation
17. Time Body Accelerometer Jerk Magnitude Mean
18. Time Body Accelerometer Jerk Magnitude Standard Deviation
19. Time Body Gyroscope Magnitude Mean
20. Time Body Gyroscope Magnitude Standard Deviation
21. Time Body Gyroscope Jerk Magnitude Mean
22. Time Body Gyroscope Jerk Magnitude Standard Deviation
23. Frequency Body Accelerometer Mean - XYZ
24. Frequency Body Accelerometer Standard Deviation - XYZ
25. Frequency Body Accelerometer Jerk Mean - XYZ
26. Frequency Body Accelerometer Jerk Standard Deviation - XYZ
27. Frequency Body Gyroscope Mean - XYZ
28. Frequency Body Gyroscope Standard Deviation - XYZ
29. Frequency Body Accelerometer Magnitude Mean
30. Frequency Body Accelerometer Magnitude Standard Deviation
31. Frequency Body Accelerometer Jerk Magnitude Mean
32. Frequency Body Accelerometer Jerk Magnitude Standard Deviation
29. Frequency Body Gyroscope Magnitude Mean
30. Frequency Body Gyroscope Magnitude Standard Deviation
31. Frequency Body Gyroscope Jerk Magnitude Mean
32. Frequency Body Gyroscope Jerk Magnitude Standard Deviation
