library(data.table)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path)) # set to current location
my_dt <- data.table(var1 = c(5,6,7,8), var2 = c("E", "F", "G", "H")) # create dt to save
save(my_dt, file = "my_dt.RData")
fwrite(my_dt, file = "my_dt.csv")
rm(list = ls()); load(file = "my_dt.RData") # test if it worked
load("my_dt.RData")
