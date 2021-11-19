# SAVING DATA ##########################
library(lightgbm)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path)) # set to current location
data(agaricus.train, package = "lightgbm")
data(agaricus.test, package = "lightgbm")
train <- agaricus.train
test <- agaricus.test
my_agaricus_data <- list("train" = train, "test" = test)
save(my_agaricus_data, file = "my_agaricus_data.RData")
# TEST LOADING BACK ###################
rm(list = ls())
load("my_agaricus_data.RData")
train <- my_agaricus_data$train
test <- my_agaricus_data$test
# GET METRIC ##########################
dtrain <- lgb.Dataset(data = train$data, label = train$label, free_raw_data = FALSE)
dtest <- lgb.Dataset.create.valid(dtrain, data = test$data, label = test$label)
valids <- list(train = dtrain, test = dtest)
bst <- lgb.train(data = dtrain,objective = "binary", learning_rate = 0.1, max_depth = 2, num_rounds = 8)
label <- test$label
pred <- predict(bst, test$data)
err <- as.numeric(sum(as.integer(pred > 0.5) != label)) / length(label)
print(paste("test-error=", err)) # [1] "test-error= 0.0403476101800124"



