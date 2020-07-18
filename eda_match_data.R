
# Setup -------------------------------------------------------------------

### R Packages

library(tidyverse)
library(skimr)

### Data Import

# 2020 Match Data
link_match_data <- "https://oracleselixir-downloadable-match-data.s3-us-west-2.amazonaws.com/2020_LoL_esports_match_data_from_OraclesElixir_20200717.csv"
match_data <- read_csv(link_match_data)



# EDA ---------------------------------------------------------------------

# Get an idea of what variables exist and generate any quick summaries
glimpse(match_data)
skim(match_data)

### Explore variables individually and what they mean
match_data %>%
  group_by(gameid) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) %>%
  filter(count < 12)

match_data %>%
  filter(gameid == "ESPORTSTMNT03/1392533" | gameid == "ESPORTSTMNT03/1392712") %>%
  View()

match_data %>% 
  filter(gameid == "5655-7249") %>%
  View()

match_data  %>%
  filter(datacompleteness == "partial")

unique(match_data$gameid)
str(match_data, list.len = 1000)
