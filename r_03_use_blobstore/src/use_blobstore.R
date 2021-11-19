library(data.table)
library(optparse)

parser <- OptionParser()
parser <- add_option(parser, "--csv_file",
                     type="character", 
                     action="store")

args <- parse_args(parser)
print("Found CSV")
print(args$csv_file)
file_name = file.path(args$csv_file)
my_dt <- fread(file_name)
print("Now we print sum of var1")
print(sum(my_dt[,var1]))