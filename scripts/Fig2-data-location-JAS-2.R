
#open packages needed and read in the data
library(tidyverse)
library(here)

#reading in the data and rename it as a tibble with shorter name
Open_phytos <- read_csv(here("raw data", "Open_Phyto_2020_cleaned.csv"))


# selecting the data column and rows for figure
Open_phytos %>%
  rename_with(make.names) %>%
  filter(Journal == "Journal of Archaeological Science") %>% 
  count(Data.location)

