Code book
======

The analysis provides per subject and activity mean values for all features in the "Human Activity Recognition Using Smartphones Data Set ".

The analysis is based on the dataset at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones . All units and variable names with the exception of activity label are the same as in the original data set. The activity id was changed for a more readable activity label.

From the original dataset the Test and Training set were concatenated and enriched with the subjects and activity performed. Only the mean and standard deviation features were selected, e.g. features with names containing case insensitive 'mean' or 'std', including 'freqMean'. Activity id's were replaced by the activity labels to provide readable names. For each subject and activity the mean values from the data subset are taken per feature.

Output is saved in getdata_project_tidy_df.txt as a space seperated file. Headers are provided in the file.
