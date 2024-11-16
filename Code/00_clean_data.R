here::i_am(
  "Code/00_clean_data.R"
)

library(dplyr)
library(tidyr)

Spongebob <- read.csv(
  file = here::here("Data/spongebob_episodes.csv")
)


Spongebob_clean <- Spongebob |>
  filter(
    !is.na(Episode....), 
    !is.na(title), 
    !is.na(Airdate), 
    !is.na(characters),
    !is.na(U.S..viewers..millions.), 
    !is.na(Storyboard)
  ) |>
  mutate(
    AirMonth = sub(",.*", "", Airdate),
    AirYear = sub(".*\\s", "", Airdate)
  ) |>
  select(Episode...., title, AirMonth, AirYear,characters, U.S..viewers..millions., Storyboard)


saveRDS(
  Spongebob_clean, 
  file = here::here("Clean_Data/cleaned_data.rds")
)
