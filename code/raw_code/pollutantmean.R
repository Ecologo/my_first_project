require("stringr")

url = "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"

if(!file.exists("specdata.zip")){
  download.file(url,"specdata.zip",mode="wb")
}

if(!dir.exists("specdata")){
  unzip("specdata.zip",overwrite = TRUE)
}

pollutantmean = function(directory, pollutant, id = 1:332){
  
  values = c()

  for(i in id) {
    f_name = paste(str_pad(i,3,pad = "0"),".csv",sep = "")
    f_path = file.path(directory,f_name)
    tb_raw = read.csv(f_path)
    tb_clean = tb_raw[!is.na(tb_raw[pollutant]),]
    values = c(values,tb_clean[[pollutant]])
  }
  mean(values)
}