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


#create lists of data
metadata_list <- c("Reuseable.rawdata", "Pictures", "Open.access", "ICPN.use", "Full.method")
Yes_list <- c(4.4, 74.2, 12.6, 46.9, 68.9)
No_list <- c(95.6, 25.8, 87.4, 53.1, 31.1)

#install and open ggplot2
library(ggplot2)

#remake vectors in accordance with ggplot2 input formatting
metadata <- c(rep("Reusable.rawdata", 2), rep("Pictures", 2), rep("Open.access", 2), rep("ICPN.use", 2), rep("Full.method", 2))
Yes_no <- rep(c("Yes","No"), 5)
Percentage <- c(c(4.4,95.6), c(74.2, 25.8), c(12.6,87.4), c(46.9,53.1), c(68.9,31.1))

print(metadata)
print(Yes_no)
print(Percentage)

#create data frame combining vectors
metadata_table <- data.frame(metadata, Yes_no, Percentage)

#plot stacked bar chart 
ggplot(metadata_table, aes(fill=Yes_no, x=(metadata), y=Percentage)) +
  geom_bar(position="stack", stat = "identity", color="black") + 
  ggtitle("Chart of percentages for presence/absence questions in this study") + ylab("Percentage") + xlab("Presence/absence question")+
  scale_x_discrete(limits = c("Reusable.rawdata", "Pictures", "Open.access", "ICPN.use", "Full.method"))+
  scale_fill_brewer(palette = "Dark2")
  
