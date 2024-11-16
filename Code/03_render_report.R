here::i_am(
  "Code/03_render_report.R"
)


library(rmarkdown)
# rendering a report in production mode
render("SpongeBob_report.Rmd", output_file = here::here("SpongeBob.html"))
