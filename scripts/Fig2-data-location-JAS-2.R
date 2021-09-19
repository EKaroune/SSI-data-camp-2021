
#open packages needed and read in the data
library(tidyverse)
library(here)

#reading in the data and rename it as a tibble with shorter name
Open_phytos <- read_csv(here("raw data", "Open_Phyto_2020_cleaned.csv"))


# selecting the data column and rows for figure

Open_phytos %>%
  rename_with(make.names) %>%
  filter(Journal == "Journal of Archaeological Science") %>% 
  count(Data.location) %>% 
  
  
data_locations_percent <- Open_phytos %>% 
  rename_with(make.names) %>%
  filter(Journal == "Journal of Archaeological Science") %>% 
  count(Data.location)
  
data_locations_percent2 <- data_locations_percent %>% 
  mutate(Percent = n / sum(n) * 100) %>% 
  
library(ggplot2)

data_locations_percent2 %>% 
  ggplot(aes(x = Data.location, y = Percent, fill = Data.location)) +
  geom_col() +
  scale_fill_brewer(palette="Dark2") +
  theme_minimal() +
  geom_text(aes(label=Percent), vjust = 1.6, color = "black", size = 3.5) +
  labs(title = "Data location in Journal of Archaeological Science articles",
       x = "Data location",
       y = " Percentage") +
  scale_x_discrete(limits=c("N","Graph","Table","pdf",".docx",".xlsx"))
  
  

             