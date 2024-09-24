## decision tree
set.seed(42)
ctrl <- trainControl(method = "cv",
                     number = 5)

tree_model <- train(diabetes ~ .,
                    data = df,
                    method = "rpart", # decision tree
                    metric = "Accuracy",
                    trControl = ctrl)
tree_model$finalModel

library(rpart.plot)
rpart.plot(tree_model$finalModel)


forest_model <- train(diabetes ~ .,
                    data = df,
                    method = "rf", # random forest
                    metric = "Accuracy",
                    trControl = ctrl)

glmnet_model <- train(diabetes ~ .,
                      data = df,
                      method = "glmnet", # ridge/lasso regression
                      metric = "Accuracy",
                      trControl = ctrl,
                      tuneGrid = expand.grid(
                        alpha = c(0, 1),
                        lambda = c(0.01, 0.10, 0.2, 0.5)
                      ))

## train model for the future
## future == test data
