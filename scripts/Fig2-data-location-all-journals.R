#open packages needed and read in the data
library(tidyverse)
library(here)

#reading in the data and rename it as a tibble with shorter name
Open_phytos <- read_csv(here("raw data", "Open_Phyto_2020_cleaned.csv"))

# selecting the data column and rows for figure

Data_location_all_journal <- Open_phytos %>% 
  rename_with(make.names) %>%
  select("Journal", "Data.location") %>% 
  group_by(Journal) %>% 
  count(Data.location)


data_locations_all_percent <- Data_location_all_journal %>% 
  mutate (Percent = n / sum(n) * 100)
  
library(ggplot2)

data_locations_all_percent %>% 
  ggplot(aes(x = Journal, y = Percent, fill = Data.location)) +
  geom_col() +
  scale_fill_brewer(palette="Dark2") +
  theme_minimal() +
  labs(title = "Location of phytolith data in journals sampled",
       x = "Journal",
       y = " Percentage of articles")
  