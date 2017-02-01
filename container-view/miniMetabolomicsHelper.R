getBioCDescriptions <- function(pkgs) {
  sapply(pkgs, function(pkg) {
  url <- paste("https://readonly:readonly@hedgehog.fhcrc.org/bioconductor/trunk/madman/Rpacks/",
               pkg, "DESCRIPTION", sep="/")
  
  t <- tempfile()
  download.file(url, t)
  dcf <- as.data.frame(read.dcf(t), stringsAsFactors = FALSE)
  dcf$Description})
}
  
index <- function(url, type = "source", filters = NULL) {
  contribUrl <- contrib.url(url, type = type)
  p <- available.packages(contribUrl, type = type, filters = filters)
  p
}
 
biocPackages <- function() {
  biocRepo <- local({
    env <- new.env()
    on.exit(rm(env))
    evalq(source("http://bioconductor.org/biocLite.R", local = TRUE), env)
    biocinstallRepos()
  })
  
  bioc <- index(biocRepo["BioCsoft"])
  return(bioc)
}

biocAndCranPackages <- function() {
  bioc <- biocPackages()
  cran <- available.packages()
  return(rbind(bioc, cran))
}

packagesInView <- function(wantedBiocViews, url) {
  ## From:
  ## https://github.com/phnmnl/bioc_docker/blob/master/out/devel_metabolomics/installFromBiocViews.R
  
  t <- tempfile()
  download.file(url, t)
  dcf <- as.data.frame(read.dcf(t), stringsAsFactors = FALSE)
  
  pkgs_matching_views <- c()
  
  for (i in 1:nrow(dcf))
  {
    row <- dcf[i, ]
    if ((!is.na(row$biocViews)) && (!is.null(row$biocViews)))
    {
      views <- strsplit(gsub("\\s", "", row$biocViews), ",")[[1]]
      if (any(wantedBiocViews %in% views))
        pkgs_matching_views <-
          append(pkgs_matching_views, row$Package)
    }
  }
  
  ap.db <- available.packages(contrib.url(biocinstallRepos()))
  ap <- rownames(ap.db)
  
  pkgs_to_install <-
    pkgs_matching_views[pkgs_matching_views %in% ap]
  pkgs_to_install
}
