url <- "http://www.mbie.govt.nz/info-services/sectors-industries/tourism/tourism-research-data/monthly-regional-tourism-estimates/document-image-library/international-product-by-rto.xlsx"
download.file(url, destfile = "mrtes.xlsx", mode = "wb")

mrtes_orig <- read.xlsx("mrtes.xlsx", sheet = "Data base", detectDates = TRUE)

mrtes <- mrtes_orig %>%
  mutate(rto_short = gsub(" RTO", "", RTO),
         rto_lumped = fct_reorder(rto_short, -Spend),
         rto_lumped = fct_other(rto_lumped, keep = levels(rto_lumped)[1:5]))

save(mrtes, file = "data/mrtes.rda")
