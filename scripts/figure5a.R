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
  mutate(percent = n / sum(n) * 100) %>% 
 
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

all_metadata <- bind_cols(reuseable_rawdata, pics, open_access, icpn, method, .name_repair = c("unique")) %>% 
  pivot_longer(all_metadata,cols = 2:3, )

tibble(x=1:5, y=c("a","b","c"))


library(ggplot2)
all_metadata %>% 
  ggplot(aes(x = factor(Reuse.data, Phyto.pictures.present, OA, Used.ICPN.1.0, Full.methods.given), y = percent)) +
  geom_col(color = "black") + 
  theme_minimal() + #graph theme
  labs(title = "Presence absence",
       x = "Yes or No",
       y = " Percentage of articles") + #labelling the graph
  theme(axis.text.x = element_text(angle = 30, hjust = 1, vjust = 1, size = 8))+
  scale_fill_brewer(palette = "Dark2")


ggplot(by_hwy_mpg) + 
  geom_bar(aes(x = class, y = hwy_mpg), stat = 'identity')

  



  

  


  
