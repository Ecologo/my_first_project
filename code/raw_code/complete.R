require("stringr")

idv = c()
nobs = c()

complete = function(directory, id = 1:332){

  for(i in id) {
    f_name = paste(str_pad(i,3,pad = "0"),".csv",sep = "")
    f_path = file.path(directory,f_name)
    tb_raw = read.csv(f_path)
    tb_clean = tb_raw[complete.cases(tb_raw),]
    idv = c(idv,i)
    nobs = c(nobs,(nrow(tb_clean)))
  }
  data.frame(id=idv,nobs=nobs)
}