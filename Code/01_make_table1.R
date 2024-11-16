here::i_am(
  "Code/01_make_table1.R"
)

data <- readRDS(
  file = here::here("Clean_Data/cleaned_data.rds")
)


library(labelled)
library(gtsummary)

var_label(data) <- list(
  Episode.... = "Episode Number",
  title = "Episode Name",
  AirYear = "U.S. Premiere Year",
  U.S..viewers..millions. = "U.S. viewers (millions)",
  characters = "Character",
  Storyboard = "Storyboard"
)


data$viewers <- ifelse(data$U.S..viewers..millions. <4, "<4", ">=4")

Table1 <- data |>
  select("Storyboard", "viewers") |>
  tbl_summary(by = viewers)|>
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Number of viewers for storyboard**") |>
  add_overall()

saveRDS(
  Table1,
  file = here::here("Output/Table/table_one.rds")
)


