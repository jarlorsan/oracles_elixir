
# Setup -------------------------------------------------------------------

### R Packages

library(tidyverse)
library(skimr)

### Data Import

# 2020 Match Data
# link_match_data <- "https://oracleselixir-downloadable-match-data.s3-us-west-2.amazonaws.com/2020_LoL_esports_match_data_from_OraclesElixir_20200717.csv"
# link_match_data <- "https://oracleselixir-downloadable-match-data.s3-us-west-2.amazonaws.com/2020_LoL_esports_match_data_from_OraclesElixir_20200730.csv"
link_match_data <- "https://oracleselixir-downloadable-match-data.s3-us-west-2.amazonaws.com/2020_LoL_esports_match_data_from_OraclesElixir_20200805.csv"
match_data <- read_csv(link_match_data)



# EDA ---------------------------------------------------------------------

# Get an idea of what variables exist and generate any quick summaries
glimpse(match_data)
skim(match_data)

### Explore variables individually and what they represent
match_data %>%
  group_by(gameid) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) %>%
  filter(count > 12)

match_data %>%
  filter(is.na(gameid)) %>%
  View()

match_data  %>%
  filter(datacompleteness == "partial")

str(match_data, list.len = 1000)

map(match_data, unique)



# LCS Analysis ------------------------------------------------------------

### Data Manipulation

# Filter out data to only include data from LCS
data_nalcs <- filter(match_data, league == "LCS")

# Potentially useful to split data into Spring/Summer
data_nalcs_spring <- filter(data_nalcs, split == "Spring")
data_nalcs_summer <- filter(data_nalcs, split == "Summer")

# Spring Statistics (Team)
data_nalcs_spring_team <- filter(data_nalcs_spring, position == "team")

# Spring Statistics (Team, Regular Season)
data_nalcs_spring_team_reg <- filter(data_nalcs_spring_team, playoffs == 0)



### Spring Statistics (Team, Playoffs)

data_nalcs_spring_team_playoffs <- match_data %>%
  filter(league == "LCS", split == "Spring", playoffs == 1, position == "team")



# Analysis ----------------------------------------------------------------

current_data <- data_nalcs_spring_team_reg
