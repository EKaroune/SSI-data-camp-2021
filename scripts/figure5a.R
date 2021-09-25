#open packages needed and read in the data
library(tidyverse)
library(here)

#reading in the data and rename it as a tibble with shorter name
Open_phytos <- read_csv(here("raw data", "Open_Phyto_2020_cleaned.csv"))

#selecting column
reuseable_rawdata <- Open_phytos %>%
rename_with(make.names) %>%
  select(12) %>%
  count(Reuse.data) %>% 
  mutate(percent = n / sum(n) * 100)

library(ggplot2)

  



  

  


  
