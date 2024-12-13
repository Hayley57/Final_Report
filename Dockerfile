# DATA550 Final

FROM rocker/r-ubuntu

RUN apt-get update && apt-get install -y pandoc

RUN mkdir /project
WORKDIR /project

RUN mkdir Clean_Data
RUN mkdir Code
RUN mkdir Output

#copy all relevant files
COPY Clean_Data Clean_Data
COPY Code Code
COPY Makefile .
COPY SpongeBob_report.Rmd .

COPY .Rprofile .
COPY renv.lock .
RUN mkdir renv

COPY renv/activate.R renv
COPY renv/settings.json renv

RUN Rscript -e "renv::restore(prompt = FALSE)"

RUN mkdir report

CMD make && mv SpongeBob_report.html report












