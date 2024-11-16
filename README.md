#Report Description
The SpongeBob Report contains some information about the popular TV show. The objectives of this report are to 
examine trends in viewership across storyboards, explore how episode characteristics evolve over time, 
and assess the contributions of different writers and artists to the success of the series.


# Code Description
`Code/01_make_table1.R`
- make table1
- saves the table1 as `.rds` object in `Output/Table` folder

`Code/02_make_bar_plot.R`
- make barplot
- saves the barplot as a `.rds` object in `Output/Figure` folder

`Code/03_render_report.R`
- render the report to be `SpongeBob.html` 

`SpongeBob_report.Rmd`
- loads table1 and barplot saved by the three `.R` scripts


# **Makefile**: Automates the process of running the analysis and generating the output.


