FROM rocker/rstudio:latest-daily

RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    python3-pip \
    libmysqlclient-dev libcurl4-openssl-dev libssl-dev libxml2-dev git build-essential \
    libpcre2-dev libbz2-dev liblzma-dev \
    libpng-dev

# set work directory
WORKDIR /app

# Password for rstudio username
ENV PASSWORD methylit

# copy project
COPY scripts /apt/scripts

RUN Rscript /apt/scripts/setup-dependencies.r

RUN R -e "BiocManager::install(c('genomaths/MethylIT'), dependencies=TRUE, ask=FALSE)"

RUN R -e "BiocManager::install(c('genomaths/MethylIT.utils'), dependencies=TRUE, ask=FALSE)"

# *** CLEANING ***
#RUN apt-get remove -y libmysqlclient-dev libcurl4-openssl-dev libssl-dev libxml2-dev git build-essential
RUN apt-get autoremove -y
RUN rm -rf /app/scripts
RUN rm -rf /var/lib/apt/lists/*

CMD ["/init"]
