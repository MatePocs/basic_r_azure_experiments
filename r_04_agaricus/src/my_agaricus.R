library(data.table)
library(optparse)
library(lightgbm)

# load in data

parser <- OptionParser()
parser <- add_option(parser, "--RData_file",
                     type="character", 
                     action="store")

args <- parse_args(parser)
file_name = file.path(args$RData_file)
load(file = file_name)

# run lgbm
train <- my_agaricus_data$train
test <- my_agaricus_data$test
dtrain <- lgb.Dataset(data = train$data, label = train$label, free_raw_data = FALSE)
dtest <- lgb.Dataset.create.valid(dtrain, data = test$data, label = test$label)
valids <- list(train = dtrain, test = dtest)
bst <- lgb.train(data = dtrain,objective = "binary", learning_rate = 0.1, max_depth = 2, num_rounds = 8)
label <- test$label
pred <- predict(bst, test$data)
err <- as.numeric(sum(as.integer(pred > 0.5) != label)) / length(label)
print(paste("test-error=", err)) # hoping for this output:  [1] "test-error= 0.0403476101800124"