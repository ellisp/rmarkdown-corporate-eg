url <- "http://www.mbie.govt.nz/info-services/sectors-industries/tourism/tourism-research-data/monthly-regional-tourism-estimates/document-image-library/international-product-by-rto.xlsx"
download.file(url, destfile = "mrtes.xlsx", mode = "wb")

mrtes <- read.xlsx("mrtes.xlsx", sheet = "Data base", detectDates = TRUE)

save(mrtes, file = "data/mrtes.rda")
