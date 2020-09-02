
# Setup -------------------------------------------------------------------

### R Packages

library(tidyverse)

### Data Import

# 2020 Match Data
# link_match_data <- "https://oracleselixir-downloadable-match-data.s3-us-west-2.amazonaws.com/2020_LoL_esports_match_data_from_OraclesElixir_20200717.csv"
# link_match_data <- "https://oracleselixir-downloadable-match-data.s3-us-west-2.amazonaws.com/2020_LoL_esports_match_data_from_OraclesElixir_20200730.csv"
# link_match_data <- "https://oracleselixir-downloadable-match-data.s3-us-west-2.amazonaws.com/2020_LoL_esports_match_data_from_OraclesElixir_20200805.csv"
link_match_data <- "https://oracleselixir-downloadable-match-data.s3-us-west-2.amazonaws.com/2020_LoL_esports_match_data_from_OraclesElixir_20200901.csv"
match_data <- read_csv(link_match_data)



# Documentation -----------------------------------------------------------

### Not much info on variables included in match data, so let's document!

# Initialize dictionary
data_dictionary <- data.frame(
  variable = colnames(match_data),
  definition = NA,
  stringsAsFactors = FALSE
)

# Record information for each variable in dictionary
def_gameid <- "unique identifier demarcating an individual match"
def_datacompleteness <- "whether the match data are complete"
def_url <- "direct link to match history on League of Legends website"
def_league <- "competitive esports league the match was played in"
def_year <- "year the match was played in"
def_split <- "split the match was played in"
def_playoffs <- "whether the match was played during playoffs"
def_date <- "date the match was played in"
def_game <- "nth game played in a series of matches"
def_patch <- "League of Legends version the match was played in"
def_playerid <- "nth player in the match"
def_side <- "whether a player or team was assigned blue or red side"
def_position <- "lane/role of a player in the match"
def_player <- "name of the player in the match"
def_team <- "name of the team in the match"
def_champion <- "League of Legends champion in the match"
def_ban1 <- "League of Legends champion banned first"
def_ban2 <- "League of Legends champion banned second"
def_ban3 <- "League of Legends champion banned third"
def_ban4 <- "League of Legends champion banned fourth"
def_ban5 <- "League of Legends champion banned fifth"
def_gamelength <- "length of time, measured in seconds, a match lasts"
def_result <- "whether a player or team won the match"
def_kills <- "number of kills a player or team scored"
def_deaths <- "number of deaths a player or team scored"
def_assists <- "number of assists a player or team scored"
def_teamkills <- "number of kills a team scored"
def_teamdeaths <- "number of deaths a team scored"
def_doublekills <- "number of double kills a team scored"
def_triplekills <- "number of triple kills a team scored"
def_quadrakills <- "number of quadra kills a team scored"
def_pentakills <- "number of penta kills a team scored"
