#Cleaned Data codebook

The cleaned data as per the instructions is saved in the file `cleaned_data.txt`. It may be read into R via 

```
read.csv("cleaned_data.txt")
```

The data is in wide format. There are 180 data rows (plus the column headers), one for each combination of subject id and activity. There are 68 columns: subject ID, activity, plus one for each of the 66 features extracted from the original data.

A description of the original features can be found in the file **features_info.txt** contained in the UCI dataset. Download the dataset from [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones here).

Only features measuring the mean or standard deviation of some measurement were kept. This was done by selecting features ending in `mean()`, `mean()-X`, `mean()-Y`, `mean()-Z`, `std()`, `std()-X`, `std()-Y`, or `std()-Z`. For example, `tBodyAcc-mean()-X` was kept, while `angle(Z,gravityMean)` was not, as it is itself not a mean. These features were averaged by subject and activity.


Here is the list of columns:

- subject.id: integer, identifies the subject.
- activity: Factor w/ 6 levels: "WALKING","WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING","LAYING" describing the activity performed when the measurements were taken.  

The other columns are the **averages of the corresponding features in the original data set, grouped by subject and activity**. Note that the following characters were replaced by "." in the column headers: "()-". For example, tBodyAcc-mean()-X becomes tBodyAcc.mean...X.  

- tBodyAcc.mean...X  
- tBodyAcc.mean...Y  
- tBodyAcc.mean...Z  
- tBodyAcc.std...X   
- tBodyAcc.std...Y   
- tBodyAcc.std...Z   
- tGravityAcc.mean...X 
- tGravityAcc.mean...Y 
- tGravityAcc.mean...Z 
- tGravityAcc.std...X  
- tGravityAcc.std...Y  
- tGravityAcc.std...Z  
- tBodyAccJerk.mean...X
- tBodyAccJerk.mean...Y
- tBodyAccJerk.mean...Z
- tBodyAccJerk.std...X 
- tBodyAccJerk.std...Y 
- tBodyAccJerk.std...Z 
- tBodyGyro.mean...X   
- tBodyGyro.mean...Y   
- tBodyGyro.mean...Z         
- tBodyGyro.std...X          
- tBodyGyro.std...Y          
- tBodyGyro.std...Z          
- tBodyGyroJerk.mean...X     
- tBodyGyroJerk.mean...Y     
- tBodyGyroJerk.mean...Z     
- tBodyGyroJerk.std...X      
- tBodyGyroJerk.std...Y
- tBodyGyroJerk.std...Z
- tBodyAccMag.mean..         
- tBodyAccMag.std..          
- tGravityAccMag.mean..      
- tGravityAccMag.std..       
- tBodyAccJerkMag.mean..     
- tBodyAccJerkMag.std..      
- tBodyGyroMag.mean..        
- tBodyGyroMag.std..         
- tBodyGyroJerkMag.mean..    
- tBodyGyroJerkMag.std..     
- fBodyAcc.mean...X          
- fBodyAcc.mean...Y          
- fBodyAcc.mean...Z          
- fBodyAcc.std...X           
- fBodyAcc.std...Y           
- fBodyAcc.std...Z           
- fBodyAccJerk.mean...X      
- fBodyAccJerk.mean...Y      
- fBodyAccJerk.mean...Z      
- fBodyAccJerk.std...X       
- fBodyAccJerk.std...Y       
- fBodyAccJerk.std...Z       
- fBodyGyro.mean...X         
- fBodyGyro.mean...Y         
- fBodyGyro.mean...Z         
- fBodyGyro.std...X          
- fBodyGyro.std...Y          
- fBodyGyro.std...Z          
- fBodyAccMag.mean..         
- fBodyAccMag.std..          
- fBodyBodyAccJerkMag.mean.. 
- fBodyBodyAccJerkMag.std..  
- fBodyBodyGyroMag.mean..    
- fBodyBodyGyroMag.std..     
- fBodyBodyGyroJerkMag.mean..
- fBodyBodyGyroJerkMag.std.. 