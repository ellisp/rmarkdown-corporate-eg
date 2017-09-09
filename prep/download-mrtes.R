# downloads some Monthly Regional Tourism Estimates data from MBIE
# Peter Ellis, 9 September 2017

url <- "http://www.mbie.govt.nz/info-services/sectors-industries/tourism/tourism-research-data/monthly-regional-tourism-estimates/document-image-library/international-product-by-rto.xlsx"

# Only download the file if we haven't already done it as I don't want to cause unnecessary network traffic
if(!file.exists("data/mrtes.xlsx")){
  download.file(url, destfile = "data/mrtes.xlsx", mode = "wb")
}

mrtes_orig <- read.xlsx("data/mrtes.xlsx", sheet = "Data base", detectDates = TRUE)

# make some alternative names for the Regional Tourism Organisations, more grpahic friendly,
# including one that is just the 5 big ones plus "Other":
mrtes <- mrtes_orig %>%
  mutate(rto_short = gsub(" RTO", "", RTO),
         rto_lumped = fct_reorder(rto_short, -Spend),
         rto_lumped = fct_other(rto_lumped, keep = levels(rto_lumped)[1:5]))

save(mrtes, file = "data/mrtes.rda")
