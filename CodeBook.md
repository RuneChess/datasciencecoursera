---
title: "CodeBook.md"
author: "RuneChess"
date: "Wednesday, May 20, 2015"
output: html_document
---

means_by_activity_and_subject.txt is tidy data set containing aggregated data collected from the accelerometers from the Samsung Galaxy S smartphone.
The tiday data set consists of 1 header row and 180 data rows. Each row has 68 columns. Below is a description of the columns
<ul>
<li> Column 1 - Activity: Type of activity performed. There are 6 different activities: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
<li> Column 2 - Subject: The person performing the activity in column 1. Persons are numbered 1..30.
<li> Column 3-68: The average of a set of values from the corresponding  feature column in the full data set. Each value in the full data set is either the mean or the standard deviation of a feature measurement. Column name indicates whether the average value is for 'mean' or 'standard deviation' and the name of the feature in the full data set.
<li> All features are normalized and bounded within [-1,1], and therefore the average values are the same.
<li> Each of the 180 data row contains the average value for each of 66 variables for a given subject and a given activity
</ul>
