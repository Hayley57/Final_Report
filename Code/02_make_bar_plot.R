here::i_am(
  "Code/02_make_bar_plot.R"
)

data <- readRDS(
  file = here::here("Clean_Data/cleaned_data.rds")
)

library(ggplot2)

barplot <- ggplot(data, aes(x = AirYear)) +
  geom_bar() +
  labs(
    x = "U.S. Premiere Year",                    
    y = "Number of Episodes",                     
    title = "Number of Episodes Released Each Year" 
  ) +
  geom_bar(fill = "yellow", color = "black", width = 0.7) + 
  theme_bw()    

ggsave(
  here::here("Output/Figure/barplot.png"),
  plot = barplot,
  device = "png"
)
