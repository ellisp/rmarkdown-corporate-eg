library(rmarkdown)
library(openxlsx)
library(tidyverse)
library(stringr)
library(ggseas)
library(forcats)
library(extrafont) # in case running on windows
library(stringi) # for generating pseudo lating lorem ipsum text

# source("prep/download-mrtes.R")






build_doc <- function(subdir = "report-1", report_name = "report"){
  proj_dir <- getwd()
  on.exit(setwd(proj_dir))
  
  # copy all the files from the report's sub directory to the home directory
  files <- list.files(subdir)
  file.copy(paste0(subdir, "/", files), paste0("~/", files), overwrite = TRUE)  
  
  # go to the home directory and render the report
  setwd("~")
  render(paste0(report_name, ".Rmd"))  
  
  # copy the built version of the document back to the project:
  file.copy(paste0(report_name, ".html"), 
            paste0(proj_dir, "/", subdir, "/", report_name, ".html"), 
            overwrite = TRUE)
  
  # clean up by deleting the copies of the files in the home directory:
  file.remove(files)
  # go back to the project:
  setwd(proj_dir)  
}

build_doc()

