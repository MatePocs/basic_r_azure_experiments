library(data.table)
library(optparse)

parser <- OptionParser()
parser <- add_option(parser, "--RData_file",
                     type="character", 
                     action="store")

args <- parse_args(parser)
cat("Found RData"); cat("\n")
cat(args$RData_file); cat("\n")
file_name = file.path(args$RData_file)
load(file = file_name)
cat("Now we print sum of var1"); cat("\n")
cat(sum(my_dt[,var1])); cat("\n")
