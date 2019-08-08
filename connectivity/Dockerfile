FROM bioconductor/release_metabolomics2:R3.6.0_Bioc3.9

RUN apt-get -y update && apt-get -y install chromium chromium-l10n

WORKDIR /metaRbolomics

ADD install.R README.md packages.Rmd Makefile AllMetaRbolomicsTables.csv revDepNet.Rmd /metaRbolomics/

RUN R -e "source('install.R')"



