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
reuseable_rawdata %>% 
  ggplot(aes(x = factor(Reuse.data), y = percent)) +
  geom_col(color = "black") + 
  theme_minimal() + #graph theme
  labs(title = "Reuseable raw data",
       x = "Yes or No",
       y = " Percentage of articles") + #labelling the graph
  theme(axis.text.x = element_text(angle = 30, hjust = 1, vjust = 1, size = 8)) +
  scale_fill_brewer(palette = "Dark2")



  



  

  


  
