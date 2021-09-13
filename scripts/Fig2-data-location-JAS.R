
library(tidyverse)

head(Open_Phyto_2020_cleaned)

class(Open_Phyto_2020_cleaned)

names(Open_Phyto_2020_cleaned)

Open_Phyto_2020_cleaned[[11]]

Open_Phyto_2020_cleaned[95:156,11]

#getting data location results for JAS in a tibble
data_location_jas <- Open_Phyto_2020_cleaned[95:156,11]

data_location_jas <- factor(c("N","Graph","Table","pdf",".docx",".xlsx","Repository"))

levels(data_location_jas)
nlevels(data_location_jas)

