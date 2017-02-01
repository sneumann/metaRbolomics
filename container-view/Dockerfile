FROM container-registry.phenomenal-h2020.eu/bioconductor/devel_protmetcore2:latest

MAINTAINER Steffen Neumann <sneumann@ipb-halle.de>

LABEL Description="Looking at all Metabolomics packages in Bioconductor"

##
## Taken from https://github.com/rocker-org/hadleyverse/blob/master/Dockerfile
## Install some external dependencies. 
##
RUN apt-get update \
  && apt-get install -y --no-install-recommends  \
  && apt-get install libxml2-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

##
## Add required R packages 
##
ADD install.R /tmp/
RUN R -f /tmp/install.R \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

##
## Copy actual analysis
##

