library(data.table)

dt_to_save <- data.table(var1 = c(1,2,3,4), var2 = c("A", "B", "C", "D"))

output_dir = "outputs"
if (!dir.exists(output_dir)){dir.create(output_dir)}

fwrite(dt_to_save, "./outputs/my_csv_output.csv")

