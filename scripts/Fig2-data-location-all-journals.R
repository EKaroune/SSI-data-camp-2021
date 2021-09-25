#open packages needed and read in the data
library(tidyverse)
library(here)

#reading in the data and rename it as a tibble with shorter name
Open_phytos <- read_csv(here("raw data", "Open_Phyto_2020_cleaned.csv"))

# selecting the data column and rows for figure, counting by data location

Data_location_all_journal <- Open_phytos %>% 
  rename_with(make.names) %>%
  select("Journal", "Data.location") %>% 
  group_by(Journal) %>% 
  count(Data.location)

# calculating percentage
data_locations_all_percent <- Data_location_all_journal %>% 
  mutate (Percent = n / sum(n) * 100)
  
library(ggplot2)

# plotting a barchart 
data_locations_all_percent %>% 
  ggplot(aes(x = factor(Journal), y = Percent, fill = Data.location)) + #selecting the x and y axis values and also the stacked bar fills fpr the legend 
  geom_col(color = "black") + # making a stacked bar chart that has black outline
  theme_minimal() + #graph theme
  labs(title = "Location of phytolith data in journals sampled",
       x = "Journal",
       y = " Percentage of articles") + #labelling the graph
  theme(axis.text.x = element_text(angle = 30, hjust = 1, vjust = 1, size = 8)) +
  scale_x_discrete(limits = c("Vegetation History and Archaeobotany", "Archaeological and Anthropological Sciences", "Environmental Archaeology", "The Holocene", "Journal of Archaeological Science", "Journal of Archaeological Science reports", "Quaternary International", "Antiquity", "Journal of Field Archaeology",	
"Journal of Anthropological Archaeology", "PLoS One","Proceedings of the National Academy of Sciences"), labels = c("VHA", "AAS", "EA", "TH", "JAS", "JASR", "QI", "ANT", "JFA", "JAA", "PO", "PNAS")) +
  scale_fill_brewer(palette = "Dark2", limits = c("N", "Graph", "Table", ".docx", "pdf", ".xlsx", ".csv", "Repository")) #Dark2 is a colour blind friendly palette 
  
