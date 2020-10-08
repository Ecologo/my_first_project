source("complete.R")

vcor = c()

corr = function(directory, treshold = 0) {
    for (i in 1:332) {
        f_name = paste(str_pad(i, 3, pad = "0"), ".csv", sep = "")
        f_path = file.path(directory, f_name)
        tb_raw = read.csv(f_path)
        tb_clean = tb_raw[complete.cases(tb_raw), ]
        if (complete(directory, id = i)[["nobs"]] > treshold) {
            vcor = c(vcor, cor(tb_clean[["sulfate"]], tb_clean[["nitrate"]]))
        }
    }
    vcor
}