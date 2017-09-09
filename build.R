# This file downloads and munges data and builds the report/s for the project from scratch
# Peter Ellis 6 September 2017

library(rmarkdown)
library(openxlsx)
library(tidyverse)
library(stringr)
library(ggseas)    # for seasonal adjustment on the fly
library(forcats)   # for munging factors
library(extrafont) # in case running on windows
library(stringi)   # for generating pseudo lating lorem ipsum text

# Run all the files in the "R" folder, which create project assets
# like the corporate colours and the function we use to build documents.
assets <- list.files(path = "R", pattern = "\\.R$", full.names = TRUE)
created_assets <- lapply(assets, source)
rm(assets, created_assets)


# download, reshape, and save the data
source("prep/download-mrtes.R")

# load in the data (not really necessary)
load("data/mrtes.rda")

# buidl the report.  Note that the build will happen in the user's home directory (~).
build_doc(subdir = "report-1")

