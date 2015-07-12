## This script is used to read in, merge, and summarize the UCI dataset on human activity recognition
## using smart phones
## (see here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
## This is the course project for the coursera class on getting and cleaning data.
## Data are read in and combined to one data set containing subject ID, activity, and the measured features.
## Only features measuring a mean or std are selected.
## Finally, the features are averaged by subject and activity and the results are printed to a file.
## The results are explained in CodeBook.md

library("dplyr")

## This is where we will put the results
file_result <- file.path(getwd(), "cleaned_data.txt")

## This is the directory containing the data files
datadir <- file.path(getwd(), "UCI HAR Dataset")

## Make sure the directory is there 
if( !file.exists(datadir))
{
  stop( "Error, directory ", datadir, " not found, exiting." )
}

## These are all the files that will need to be read.
file_activity_labels <- file.path(datadir, "activity_labels.txt")
file_feature_labels <- file.path(datadir, "features.txt")
file_subject_test <- file.path(datadir, "test", "subject_test.txt")
file_feature_test <- file.path(datadir, "test", "X_test.txt")
file_activity_test <- file.path(datadir, "test", "y_test.txt")
file_subject_train <- file.path(datadir, "train", "subject_train.txt")
file_feature_train <- file.path(datadir, "train", "X_train.txt")
file_activity_train <- file.path(datadir, "train", "y_train.txt")

## Make sure the files are there. If not, exit with an error message.
files <- c( file_activity_labels, file_feature_labels,
            file_subject_test, file_feature_test, file_activity_test, 
            file_subject_train, file_feature_train, file_activity_train )
for (file in files)
  if( !file.exists(file) )
  {
    stop( "Error, file ",file," not found. Exiting." ) 
  }

message("All files found. Now load and clean data. This may take a while...")

## Load the feature labels. These will become the column names for the feature datasets.
tbl_feature_labels <- read.table( file_feature_labels, stringsAsFactors = F, head=F, sep=" ",
                            col.names = c("ID", "label") )

##Load the activity labels. These will become the factor levels for the activity datasets.
tbl_activity_labels <- read.table( file_activity_labels, stringsAsFactors = F, head=F, sep=" ",
                              col.names = c("ID", "label") )

## Read in subject data
tbl_subject_test <- tbl_df( read.table(file_subject_test, header=F, sep="", col.names = "subject.id" ))
tbl_subject_train <- tbl_df( read.table(file_subject_train, header=F, sep="", col.names = "subject.id" ))

## Read in activity data
tbl_activity_test <- tbl_df( read.table(file_activity_test, header=F, sep="", col.names = "activity" ))
tbl_activity_train <- tbl_df( read.table(file_activity_train, header=F, sep="", col.names = "activity" ))

## Read in features. The column names are given by the feature table read in earlier.
tbl_feature_test <- tbl_df( read.table(file_feature_test, head=F, sep="", colClasses="numeric",
                                       col.names = tbl_feature_labels$label ))
tbl_feature_train <- tbl_df( read.table(file_feature_train, head=F, sep="", colClasses="numeric",
                                       col.names = tbl_feature_labels$label ))

## Merge datasets
tbl_test <- bind_cols( tbl_subject_test, tbl_activity_test, tbl_feature_test )
tbl_train <- bind_cols( tbl_subject_train, tbl_activity_train, tbl_feature_train )
tbl_full <- bind_rows(tbl_train, tbl_test)

## Label activities by making the column into a factor.
## The levels are given by the activity table we read in earlier.
tbl_full <- mutate(tbl_full, activity = factor(activity) )
levels( tbl_full$activity ) <- tbl_activity_labels$label

## Only keep features measuring the mean or std of some value.
## R doesn't like parentheses in column names, so it translates ()- to ... in column headers.
## We want to select features ending in mean(), mean()-X, mean()-Y, 
## mean()-Z, std(), std()-X, std()-Y, or std()-Z.
## So, we look for mean..$, mean...X$, ... std...Z$ .
## Note that we have to escape the . since it is a metacharacter.
keep <- grep( "([Mm]ean|[Ss]td)\\.\\.(\\.[XYZ])?$", names(tbl_full), value = F )
tbl <- select( tbl_full, subject.id, activity, keep) 

## Group by activity and subject
tbl <- group_by( tbl, subject.id, activity ) 

## Average features for each subject & activity
tbl_summ <- summarise_each( tbl, "mean" ) 

## Write results to file. Results can be read via read.csv( "cleaned_data.txt" ) )
write.csv(tbl_summ, file_result, row.names=F )

message( paste( "Cleaning done. Results written to", file_result,".") )