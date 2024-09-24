library(tidyverse)
library(caret) ## Classification And Regression Tree

## Load Data
mtcars

## Split Data 70:30
set.seed(42)
n <- nrow(mtcars) ## 32
id <- sample(1:n, size = 0.7*n)
train_df <- mtcars[id, ]
test_df <- mtcars[-id, ]

## Train a Linear Regression Model
set.seed(42)
lm_model <- train(mpg ~ hp + wt + am,
                  data = train_df,
                  method = "lm")
lm_model

## Train KNN Model
knn_model <- train(mpg ~ hp + wt + am,
                  data = train_df,
                  method = "knn")
knn_model

## Score
p_test <- predict(lm_model, newdata = test_df)
p_test

p_test_knn <- predict(knn_model, newdata = test_df)
p_test_knn

## Evaluate MAE, MSE, RMSE
error <- test_df$mpg - p_test
error_knn <- test_df$mpg - p_test_knn

mae <- mean(abs(error))
mse <- mean(error**2)
rmse <- sqrt(mean(error**2)) ## rmse <- sqrt(mse)
mae
mse
rmse

mae_knn <- mean(abs(error_knn))
mse_knn <- mean(error_knn**2)
rmse_knn <- sqrt(mean(error_knn**2))
