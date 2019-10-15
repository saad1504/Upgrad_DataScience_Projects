# Upgrad DataScience Projects
All Data Science projects completed for PGPDS by Upgrad

## 1) Stock Market Analysis using SQL

**The dataset provided here has been extracted from the NSE website. The Stock price data provided is from 1-Jan-2015 to 31-July-2018 for six stocks Eicher Motors, Hero, Bajaj Auto, TVS Motors, Infosys and TCS.Aim of analysis is to provide insights to buy or sell the stocks**

In this project Stock market analysis is done for the 6 stocks provided above using MYSQL.
The Steps for analysis are as follows:
* Seperate tables are created from csv files for the respective Companies.
* The tables are then merged to form the master dataset.
* Data Inspection,Cleaning and Data Preparation is done on the dataset.
* Exploratory Data Analysis is done on the dataset and moving averages are calculated for each stock.
* Short term moving average is calculated for 20 days and long term moving average is calculated for 50 days.
* Buy and sell signals are generated based on the moving averages.
* Final Result of the anlysis is produced in the form of PDF.


## 2) Uber Supply Demand Gap

**The data set used for analysis  data set is a masked data set which is similar to what data analysts at Uber handle.The aim of analysis is to identify the root cause of the problem (i.e. cancellation and non-availability of cars) and recommend ways to improve the situation.**

In this project Supply Demand Gap is identified for Uber using EDA in both Python and Tableau.
The Steps for analysis are as follows:
* Load the dataset into a dataframe.
* Perform Data Inspection and  Data Cleaning on the dataframe.
* Exploratoratory Data Analysis is done on the dataframe.
* Plots are created to visualize the important attributes and how they contribute to the supply demand gap in Python as well as Tableau.
* Final Results and recommendations are provided in the form of PDF with self explanatory plots.

## 3) Lead Scoring Case Study using Logistic Regression

**We have been provided with a leads dataset from the past with around 9000 data points. This dataset consists of various attributes such as Lead Source, Total Time Spent on Website, Total Visits, Last Activity, etc. which may or may not be useful in ultimately deciding whether a lead will be converted or not.**

In this project lead scoring is done for a company.
The Steps for analysis are as follows:
* Load the dataset into a dataframe.
* Perform Data Inspection and  Data Cleaning on the dataframe.
* Exploratoratory Data Analysis is done on the dataframe.
* After EDA we have a basic idea of which are the important attributes from the plots created.
* Datasets is split into test and train datasets
* Scaling of features is done.
* Initial model is created and the summary is analyzed to find which are the important attributes.
* Feature Selection is then done on the train dataset using RFE
* Lead score is assigned to each record based on the probability calculated from model for conversion.
* accuracy sensitivity and specificity for various probability cutoffs are plotted to find optimal cutoff point.
* Predictions are done on the test dataset and accuracy is checked.
* Calculate the conversion rate of leads at the optimal cutoff lead score and classify them as hot leads.
* Create Presentation to represent the results of analysis in the form of PDF.

## 4) Handwriting Digit Recognition using SVM

**For this problem, we use the MNIST data which is a large database of handwritten digits. The 'pixel values' of each digit (image) comprise the features, and the actual number between 0-9 is the label.Objective of the analysis  is to develop a model using Support Vector Machine which should correctly classify the handwritten digits from 0-9 based on the pixel values given as features.**

In this project hand writing  digit recognition is done using SVM
The Steps for analysis are as follows:
* Load the dataset into a dataframe.
* Perform Data Inspection and  Data Cleaning on the dataframe.
* Exploratoratory Data Analysis is done on the dataframe.
* Datasets is split into test and train datasets
* Scaling of features is done.
* Linear SVM kernel is used to create a model and accuracy is checked
* RBF SVM kernel  is used to create a model and accuracy is checked.
* Hyperparametere tuning is done using GridSearchCV
* Optimal C and Gamma are found and final model is created using RBF kernel.
* Check accuracy of model and come to the conclusion that the problem is non-linear in nature.

## 5) NYC tickets analysis using Spark

**The NYC Police Department has collected data for parking tickets. Of these, the data files for multiple years are publicly available on Kaggle. We will try and perform some exploratory analysis on a part of this data. Spark will allow us to analyse the full files at high speeds as opposed to taking a series of random samples that will approximate the population. For the scope of this analysis, we will analyse the parking tickets over the year 2017.**

In this project ticket anlysis is don to find out the most pressing violations in NYC.
The Steps for analysis are as follows:
* Load the dataset into a dataframe.
* Perform Data Inspection and  Data Cleaning on the dataframe.
* Exploratoratory Data Analysis is done on the dataframe.
* Answer the following question using Spark
	1) Find the total number of tickets for the year.
	2) Find out the number of unique states from where the cars that got parking tickets came. 
	3) Find out How often does each violation code occur? Display the frequency of the top five violation codes.
	4) How often does each 'vehicle body type' get a parking ticket? How about the 'vehicle make'?
	5) Find the violation code frequencies for three precincts that have issued the most number of tickets. Do these precinct zones have an exceptionally high  frequency of certain violation codes? Are these codes common across precincts? 
	6) Divide 24 hours into six equal discrete bins of time. Choose the intervals as you see fit. For each of these groups, find the three most commonly 		occurring violations.
	7) Then, find the three most common violations for each of these seasons.
	8) The fines collected from all the instances of parking violation constitute a source of revenue for the NYC Police Department.Find the total occurrences of the three most common violation codes.
* After answering the questions insights based on viloation code are provided




