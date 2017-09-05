
url <- "http://www.mbie.govt.nz/info-services/business/business-growth-agenda/regions/documents-image-library/REAR-Webtool-20160610.zip"
download.file(url, destfile = "webrear.zip", mode = "wb")
unzip("webrear.zip", exdir = "data")
