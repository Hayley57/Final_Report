SpongeBob_report.html: SpongeBob_report.rmd Code/03_render_report.R clean_data make_Figure make_Table
	Rscript Code/03_render_report.R

clean_data: 
	Rscript Code/00_clean_data.R
	
make_Table: clean_data
	Rscript Code/01_make_table1.R
	
make_Figure: clean_data make_Table
	Rscript Code/02_make_bar_plot.R


.PHONY: clean
clean:
	rm -f Output/*.png && rm -f report.html && rm -f Derived_data/*