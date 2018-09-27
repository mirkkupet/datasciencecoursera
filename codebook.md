# Modified Human Activity Recognition Using Smartphones Data Set 

This dataset is modification of Human Activity Recognition Using Smartphones Data Set that can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones")

The set contains data collected from 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

For this dataset, the training and test sets were merged and only the means and standard deviations of each measurement were extracted. Then averages of variables were calculated for each activity and subject. 

The dataset contains 88 features:

| Variable		| Description					  |
| ----------------------| ------------------------------------------------|
| subjectid 		| Identifyer of the experiment subject		  |
| activity		| Activity performed by the subject	 	  |
| avg_tbodyaccmeanx...	| Averages of the original mean and std variables |