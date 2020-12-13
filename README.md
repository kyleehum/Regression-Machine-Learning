# Regression Machine Learning

## Background Information

My data set consists of information regarding the evaluation of burritos in San Diego, California.  The data was gathered mostly from the neuroscience graduate department at UC San Diego.  With a total of 385 rows, the dataset contains both burrito evaluation criteria and general information about the individual establishment, such as address, website, etc..  The burritos were evaluated based on 10 core dimensions: Volume, Tortilla quality (Temperature), Meat quality, Non-meat filling quality, Meat-to-filling ratio, uniformity, salsa quality, flavor synergy, and wrap integrity.  The dimensions were rated on a scale from 0 to 5.  0 being horrible and 5 being ideal.  

## Overview

This project will consist of two machine learning algorithms.  The first algorithm utilizes linear regression to predict the overall rating of burritos using a highly correlated variable of non-meat fillings.  The second algorithm utilizes logistic regression to predict a binary classification variable.  Factoring in all 10 core dimensions that the burritos are evaluated on, the model will predict whether or not the reviewers will recommend it or not recommend it.

The full detailed write up and code can be found in the Regression Machine Learning repo [here](https://github.com/kyleehum/Regression-Machine-Learning.git)


### Linear Regression Model Results

Once the data was validated, a linear regression model was developed.  The linear regression was then fitted to a prediction model.  Shown below are my results in comparison to the training and test sets

![](https://github.com/kyleehum/Kyle-Hum-Portfolio-Website/blob/main/images/Screen%20Shot%202020-12-13%20at%201.56.31%20PM.png)


### Logistic Regression Model Results

As shown below, the model has predicted a total of 234 burrito restaurants that the reviewers would recommend and 96 establishments that the reviewers would not recommend

![](https://github.com/kyleehum/Kyle-Hum-Portfolio-Website/blob/main/images/Screen%20Shot%202020-12-13%20at%202.15.18%20PM.png)


