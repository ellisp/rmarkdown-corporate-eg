

library(rmarkdown)
proj_dir <- setwd()


source("prep/download-rear.R")


subdir <- "report-1"
files <- list.files(subdir)
file.copy(paste0(subdir, "/", files), paste0("~/", files), overwrite = TRUE)  



# encompass all this in an "if error go back to proj_dir"
setwd("~")
render("housing-affordability.Rmd")  
file.copy("housing-affordability.html", paste0(proj_dir, "/", subdir, "/housing-affordability.html"), overwrite = TRUE)

setwd(proj_dir)  
