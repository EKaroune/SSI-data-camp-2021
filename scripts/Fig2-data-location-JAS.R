
library(tidyverse)

head(Open_Phyto_2020_cleaned)

class(Open_Phyto_2020_cleaned)

names(Open_Phyto_2020_cleaned)

#selecting for column needed for data location
Open_Phyto_2020_cleaned[[11]]

#this is the rows and column needed for data location and JAS
Open_Phyto_2020_cleaned[95:156,11]

#getting data location results for JAS in a tibble
data_location_jas <- Open_Phyto_2020_cleaned[95:156,11]



Open_Phyto_2020_cleaned %>%
  rename_with(make.names) %>%
  filter(Journal == "Journal of Archaeological Science") %>% 
  count(Data.location)

install.packages("here")

library(tidyverse)
library(here)

interviews <- read_csv(here("raw data", "Open_Phyto_2020_cleaned.csv"))
