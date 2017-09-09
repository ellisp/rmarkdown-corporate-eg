#' Build an R Markdown file that is in a subdirectory
#' 
#' Function to move all files in a subdirectory to the user's home directory, build the markdown file there,
#' and return the built version to the original subdirectory.  Why would you want to do this?  Because
#' R Markdown doesn't build nicely on RStudio Server on a mapped network drive due to a bug in Pandoc, so
#' sometimes you need to move everything to somewhere else.
#' 
#' @export
#' @import rmarkdown
#' @param subdir sub directory (relative to the project directory) holding a report and its necessary files
#' @param report_name name of the report, excluding the .Rmd suffix.
#' @param ... other arguments to be passed to rmarkdown::render()
#' @author Peter Ellis
build_doc <- function(subdir = "report", report_name = "report", ...){
  proj_dir <- getwd()
  on.exit(setwd(proj_dir))
  
  # copy all the files from the report's sub directory to the home directory
  files <- list.files(subdir)
  file.copy(paste0(subdir, "/", files), paste0("~/", files), overwrite = TRUE)  
  
  # go to the home directory and render the report
  setwd("~")
  rmarkdown::render(paste0(report_name, ".Rmd"), ...)  
  
  # copy the built version of the document back to the project:
  file.copy(paste0(report_name, ".html"), 
            paste0(proj_dir, "/", subdir, "/", report_name, ".html"), 
            overwrite = TRUE)
  
  # clean up by deleting the copies of the files in the home directory:
  file.remove(files)
  # go back to the project:
  setwd(proj_dir)  
}
