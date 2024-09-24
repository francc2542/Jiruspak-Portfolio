## Logistic Regression
library(dplyr)
mtcars %>% head()

str(mtcars)

## convert am to factor
mtcars$am <- factor(mtcars$am, 
                    levels = c(0, 1), 
                    labels = c("Auto", "Manual"))

class(mtcars$am)
table(mtcars$am)

## split data
set.seed(42)
n <- nrow(mtcars)
id <- sample(1:n, size = n*0.7) 
train_data <- mtcars[id, ]
test_data <- mtcars[-id, ]

## train model
logit_model <- glm(am ~ mpg, data = train_data, family = "binomial")
p_train <- predict(logit_model, type = "response") ## probability
train_data$pred <- if_else(p_train >= 0.5, "Manual", "Auto")
mean(train_data$am == train_data$pred)

## test model
p_train <- predict(logit_model, newdata = test_data, type = "response")
test_data$pred <- if_else(p_test >= 0.5, "Manual", "Auto")
mean(test_data$am == test_data$pred)

# --------------------------------------------------------------------------------------------------------------------------------

## Logistic Regression Example
## Binary Classification
happiness <- c(10, 8, 9, 7, 8, 5, 9, 6, 8, 7, 1, 1, 3, 1, 4, 5, 6, 3, 2, 0 ) 

divorce <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)

df <- data.frame(happiness, divorce)
df

rep("Franc", 20)

## Fit Logistic Regression Full Dataset
model <- glm(divorce ~ happiness, data = df, family = "binomial")

summary(model)

## Predict and Evaluate Model
df$prob_divorce <- predict(model, type = "response")
df$pred_divorce <- ifelse(df$prob_divorce >= 0.5, 1, 0)

## confusion matrix
confusion_matrix <- table(x = df$pred_divorce, y = df$divorce, dnn = c("Predicted", "Actual"))

## Model Evaluation
cat("Accuracy:", (confusion_matrix[1, 1] + confusion_matrix[2, 2]) / sum(confusion_matrix))
cat("Precision:", confusion_matrix[2,2] / (confusion_matrix[2, 1] + confusion_matrix[2, 2]))
cat("Recall:", confusion_matrix[2,2] / (confusion_matrix[1, 2] + confusion_matrix[2, 2]))
cat("F1:", 2 * ((0.9 * 0.9) / (0.9 + 0.9)))
