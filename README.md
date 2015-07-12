# getdataProject

This is the course project for the *getting and cleaning data* coursera course by JHU.

The project is a data cleaning task: data on human activity recognition using smartphones from UCI is read in and merged into one large data set. The averages of specific features are extracted and the results written to a file for later processing.

The raw data & its description can be obtained from 
[here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones here).

The repository contains 4 files:

* This **README.md** file
* The analysis script, **run_analysis.R**, that reads in and cleans the UCI dataset.
* The codebook, **CodeBook.md**, describing the format of the output data.
* The output file, **cleaned_data.txt**.

## Usage notes

`run_analysis.R` requires the `dplyr` package for manipulation of data sets.

The input files are expected to be in a directory named `UCI HAR Dataset` in the working directory. The test data is expected in `UCI HAR Dataset/test/` , the training data in `UCI HAR Dataset/train/`. The script only runs if all files are found.

The output will be written to the file `cleaned_data.txt` in the working directory. It is written in csv format including column titles, and can be read via the command

```
read.csv("cleaned_data.txt")
```

## Note on output and selected columns

The output is a wide-format, **tidy** table with one **row per subject and activity**. There is **one column for each feature** (averaged per subject/activity), plus the `subject ID` and `activity` columns.

Only features measuring the mean or standard deviation of some measurement were kept. This was done by selecting features ending in `mean()`, `mean()-X`, `mean()-Y`, `mean()-Z`, `std()`, `std()-X`, `std()-Y`, or `std()-Z`. For example, `tBodyAcc-mean()-X` was kept, while `angle(Z,gravityMean)` was not, as it is itself not a mean.

