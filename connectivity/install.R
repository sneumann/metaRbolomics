install.packages(c("fastmap", "miniCRAN","igraph","magrittr","networkD3",
                   "visNetwork","magrittr","rmarkdown"), 
                 repos="https://cran.r-project.org")

# Webshot and dependencies
install.packages(c("fastmap", "later", "promises"), 
                 repos="https://cran.r-project.org")
devtools::install_github("rstudio/websocket", upgrade = "always")
devtools::install_github("rstudio/webshot2", upgrade = "always")

# To read dependencies from DESCRIPTION file
devtools::install_github("r-lib/desc", upgrade = "always")
