library(readr)
burritos <- read_csv("burritos_01022018.csv")
read(burritos)

summary(burritos)


library(caret)
set.seed(1234)
trainIndex <- createDataPartition(burritos$Meat, p = .7, list = FALSE, times = 1, )
View(trainIndex)

library(ggplot2)
ggplot(burritos, aes(x= Meat, y= Fillings)) + 
        geom_point() 

#high correlation      
ggplot(burritos, aes(x= Fillings, y= overall)) + 
        geom_point() + 
        geom_smooth()

#partition the data
library(caTools)
set.seed(1234)
sampleSplit <- sample.split(Y=burritos$Fillings, SplitRatio=0.7, group = NULL)
trainSet <- subset(x=burritos, sampleSplit==TRUE)
testSet <- subset(x=burritos, sampleSplit==FALSE)

#run a linear regression model on the training set
regressiontrain <- lm(Fillings ~ overall, data = trainSet)
summary(regressiontrain)

#checking the residuals
modelResiduals <- as.data.frame(residuals(regressiontrain)) 
ggplot(modelResiduals, aes(residuals(regressiontrain))) +
        geom_histogram(fill='lightblue', color='black')

#checking for outliers
library(ggplot2)
ggplot(trainSet, aes(x=Fillings, y=overall)) + 
        geom_boxplot(outlier.colour="red", outlier.shape=8,
                     outlier.size=4)

#prediction with training set
predicttrainSet <- predict.lm(regressiontrain, trainSet)
summary(predicttrainSet)

#prediction with test set
predicttestSet <- predict.lm(regressiontrain, testSet)
summary(predicttestSet)

#to easily compare actual ratings with predicted ratings
modelEval <- cbind(predicttrainSet, predicttestSet)
colnames(modelEval) <- c('TrainSet', 'TestSet')
modelEval <- as.data.frame(modelEval)

#Logistic Regression

#reassign recommendations to 1 and 0.  In order to run a logistic regression
library(plyr)
burritos$Rec <- revalue(burritos$Rec, c("Yes"=1))
burritos$Rec <- revalue(burritos$Rec, c("No"=0))


#run a logistic regression on the training set
glm.fit <- glm(as.factor(Rec) ~ Tortilla + Temp + Meat + Fillings + Uniformity + 
        Meatfilling + Salsa + 
        Synergy + Wrap + overall, 
        data = trainSet, family = binomial)
summary(glm.fit)

#apply logistic regression model to prediction with training set
Rec.predictions.train <- predict(glm.fit, trainSet, type="response")
View(Rec.predictions.train)
summary(Rec.predictions.train)

#apply logistic regression model to prediction with test set
Rec.predictions.test <- predict(glm.fit, testSet, type="response")

#if the prediction is greater than 0.5, the outcome is a yes to recommendation. 
#if the prediction is less than 0.5, the outcome is a no to recommendation
log.results.train <- ifelse(Rec.predictions.train > 0.5, 1, 0)
table(log.results.train)

#applying the ML log model to test set
Rec.predictions.train <- predict(glm.fit, testSet, type="response")
log.results.test <- ifelse(Rec.predictions.train > 0.5, 1, 0)
table(log.results.test)
