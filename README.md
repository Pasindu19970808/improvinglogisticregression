# improvinglogisticregression
Using a data set used for logisitic regression from Andrew Ng's Machine Learning course on Coursera, where a base accuracy of 89% is achieved, I try to improve the accuracy using learning curves and investigating if adding more features would help increase accuracy. 

Upon implementing a learning curve, it was observed that the learning curve suggests high bias within the predictive model, hence extra polynomial features were added to try and obtain better accuracy. This was done using another branch on the initial master, "Extra features".

As an extra feature, a feature which is the multiplication of the 2 other features were implemented. The accuracy increased to 99% from 89% and the decision boundary shows excellent adherence with data. To ensure that it doesn't overfit causing high variance, learning curve was drawn again, and it shows that the cost of the cross validation also has significantly dropped. Hence the model has been improved achieving the goal of this repository. You may see the results of the improvements in the graphs uploaded to the Extra Features branch. 
