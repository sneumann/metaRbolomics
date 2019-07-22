FROM bioconductor/release_metabolomics2:R3.6.0_Bioc3.9

RUN R -e 'install.packages(c("miniCRAN","networkD3", "visNetwork"), repos = "http://cran.r-project.org")'

ADD install.R  miniMetabolomicsHelper.R  miniMetabolomics.Rmd  /metaRbolomics/
WORKDIR /metaRbolomics

