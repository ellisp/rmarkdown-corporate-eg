library(rmarkdown)
library(openxlsx)
library(tidyverse)
library(stringr)
library(ggseas)
library(forcats)
library(extrafont) # in case running on windows

# source("prep/download-mrtes.R")

proj_dir <- getwd()



subdir <- "report-1"
files <- list.files(subdir)
file.copy(paste0(subdir, "/", files), paste0("~/", files), overwrite = TRUE)  



# encompass all this in an "if error go back to proj_dir"
setwd("~")
render("example-1.Rmd")  
file.copy("example-1.html", paste0(proj_dir, "/", subdir, "/example-1.html"), overwrite = TRUE)

setwd(proj_dir)  


