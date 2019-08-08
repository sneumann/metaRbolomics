FROM bioconductor/release_metabolomics2:R3.6.0_Bioc3.9

RUN apt-get -y update && apt-get -y install chromium chromium-l10n

# Install dependency packages
COPY install.R  /connectivity/
RUN R -e "source('/connectivity/install.R')"

# Install Vignettes 
COPY AllMetaRbolomicsTables.csv miniMetabolomicsHelper.R README.md revDepNet.Rmd packages.Rmd  /connectivity/
RUN mkdir /docs

RUN groupadd -r mygrp && useradd -r -g mygrp myuser && chown -R myuser /connectivity

ENV CHROMOTE_CHROME /usr/bin/chromium

USER myuser
WORKDIR /connectivity






