# Classification/Machine Learning Homework

## Credit Risk Ensemble

### Balanced Random Forest
* Accuracy Score: 0.7971655164356133
#### Random Forest Imbalanced Classification Report:
![randomforest](randomforest.png)
#### Important Features:
* loan_amnt: (0.07683167692623348)
* int_rate: (0.0764295316324861)
* installment: (0.07138400890036296)
* annual_inc: (0.05749201408182217)
* dti: (0.056061938800932784)

### Easy Ensemble AdaBoost
* Accuracy Score : 0.925427358175101
#### Easy Enseble AdaBoost Imbalanced Classification Report:
![eec](eec.png)

### Gradient Boost
* Accuracy Score : 0.925427358175101
#### Gradient Boost Imbalanced Classification Report:
![gradientboost](gradientboost.png)

## Analysis of Methods:
* The Balanced Random Forest accuracy score outcompeted the Easy Ensemble AdaBoost and Gradient Boost models.

----------------------------------

## Credit Risk Resampling

### Naive Random Oversampling
* Accuracy Score: 0.6533977140416822
#### Oversample Imbalanced Classification Report:
![oversample](oversample.png)

### SMOTE Oversampling
* Accuracy Score: 0.6533977140416822
#### SMOTE Imbalanced Classification Report:
![smote](smote.png)

### Undersampling
* Accuracy Score: 0.6533977140416822
#### Undersample Imbalanced Classification Report:
![undersample](undersample.png)

### Combination
* Accuracy Score: 0.5062567734709582
#### Combination Imbalanced Classification Report:
![combination](combination.png)

## Analysis on Methods:
* The worst accuracy score was from the combination method.


