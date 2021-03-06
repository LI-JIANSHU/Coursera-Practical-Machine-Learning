## Handle the raw dataset

* The dataset contains some invalid values and NAs, which are not helpful in build a machine learning model.
  * Exclude the first 7 columns, which contains information about the experiment takers and time of the experiment. 
  * For the remaining columns, use the columns with valid numberic values. 
  
* Split the dataset into training set and cross validation set
  * Use CreateDataPartition() function from caret package. 
  * Use 80% of the data as training set and the rest 20% as cross validation set

---

## Build the model

* Fit various models with the training dataset by setting the method within the train() function to different options.
* Use preprocessing by setting the preProcess option in train() function
* Save the models for cross validation

---

## Choose the best model

* Use predict() function on cross validation set to predict the resultant classes.
* Use confusionMatrix() function to see the accuracy of the predictions. 
* Choose the model with highest accuracy as the best model

---

## Predict the test dataset using the best model

* Use the best model above and use predict() function to predict the result on the test dataset
* The code to generate the best model is <a href='R_code/main.R'>here</a>. 
* The best model has an accuracy of 98.27%. The full result of the confusion matrix is <a href='R_code/log'>here</a>.
* On the test dataset, the prediction result is <a href='R_code/log2'>here</a>.
* The result above has 1 misclassification out of 20, the accuracy is 95%.
 

