
docker run --rm -it  sneumann/metarbolomics Rscript -e 'library(rmarkdown); rmarkdown::render("miniMetabolomics.Rmd", "html_document")'




Also check:


https://stackoverflow.com/questions/44143110/visualizing-r-function-dependencies

https://cran.r-project.org/web/packages/miniCRAN/vignettes/miniCRAN-dependency-graph.html

https://cran.r-project.org/web/packages/pkgnet/vignettes/pkgnet-intro.html
pkgnet can analyze any R package locally installed. (Run installed.packages() to see the full list of packages installed on your system.)



