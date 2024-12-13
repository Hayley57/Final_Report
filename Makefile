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

# Install: If not working, try to manually install
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	

# Docker rules: files that if changed, we would want to rebuild image
PROJECTFILES = SpongeBob_report.Rmd Code/00_celan_data.R Code/01_make_table.R Code/02_make_bar_plot.R Code/03_render_report.R Makefile
RENVFILES = renv.lock renv/activate.R renv/settings.json


# rule to build image
# $@ evaluates to the target name in make
# $(<variable>) references a variable in make
project image: $(PROJECTFILES) $(RENVFILES)
	docker build -t project_image .
	touch $@


# rule to build the report automatically in our container
# $$(<command>) does command substitution in make
report/SpongeBob_report.html: project_image
	docker run -v /"$$(pwd)/report":/project/report project_image



