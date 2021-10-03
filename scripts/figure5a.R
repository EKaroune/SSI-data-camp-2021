#open packages needed and read in the data
library(tidyverse)
library(here)

#reading in the data and rename it as a tibble with shorter name
Open_phytos <- read_csv(here("raw data", "Open_Phyto_2020_cleaned.csv"))

#selecting column for reuse_rawdata
reuseable_rawdata <- Open_phytos %>%
rename_with(make.names) %>%
  select(12) %>%
  count(Reuse.data) %>% 
  mutate(percent = n / sum(n) * 100)

#picture
pics <- Open_phytos %>%
  rename_with(make.names) %>%
  select(13) %>%
  count(Phyto.pictures.present) %>% 
  mutate(percent = n / sum(n) * 100)

#Open access
open_access <- Open_phytos %>%
  rename_with(make.names) %>%
  select(14) %>%
  count(OA) %>% 
  mutate(percent = n / sum(n) * 100)

#ICPN
icpn <- Open_phytos %>%
  rename_with(make.names) %>%
  select(17) %>%
  count(Used.ICPN.1.0) %>% 
  mutate(percent = n / sum(n) * 100)

#method
method <- Open_phytos %>%
  rename_with(make.names) %>%
  select(18) %>%
  count(Full.methods.given) %>% 
  mutate(percent = n / sum(n) * 100)

library(ggplot2)

  



  

  


  
