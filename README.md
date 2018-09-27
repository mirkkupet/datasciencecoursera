==================================================================
Code to modify
Human Activity Recognition Using Smartphones Dataset
==================================================================
Original data source: 
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

run_analysis.R can be used to produce a modified version of Human Activity Recognition Using Smartphones Dataset, which can be obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

1. The code first merges the testing and training data of the data set
2. Only mean and standard deviation of each measurement are extracted
3. Averages of the variables is calculated for each subject and activity
4. New dataset containing the means is written to text file