# http://therbootcamp.github.io

# Script to install any packages necessary for the BaselRBootcamp

Bootcamp_package_installation <- function() {
  
  installed_packages <- rownames(installed.packages())
  
  
  # Critical packages 
  critical <- c(
    
    # Utilities --------------
    "devtools",
    
    # Tidyverse --------------
    
    "tidyverse",
    
    # caret ------------------
    "caret"
    
  )
  
  # Optional packages
  optional <- c(
    # 
    # # Utilities --------------
    # 
    "Rcpp",
    # "rvest",
    "lubridate", 
    # "skimr",
    
    # Markdown / Shiny --------------
    
    # "shiny", 
    # "shinyjs",
    # "markdown", 
    # "rmarkdown",
    # "rmdformats",
    # "DT",
    
    
    # Stats --------------
    
    # "lme4",
    # "afex",
    # "car",
    # "BayesFactor",
    # "parfm", 
    # "lava",
    # "rsq",
    "broom", 
    
    # ML --------------
    
    # "FFTrees",
    "rpart", 
    "randomForest", 
    "e1071", 
    "party", 
    "partykit", 
    "glmnet",
    # "earth",
    # "tensorflow",
    # "Boruta",
    
    # Plotting --------------
    # "yarrr", 
    # "diagram",
    # "ggRandomForests",
    #  "ggthemes", 
    # "ggpubr",
    
    # Datasets --------------
    "speff2trial",
    "ISLR",
    "mlbench")
  
  
  message("Willkommen bei The R Bootcamp!")
  message("Wir werden einige Pakete für dich installieren, dies könnte ein paar Minuten dauern...")
  
  critical_not_installed <- c()
  optional_not_installed <- c()
  
  for(package.i in sort(critical)) {
    
    if((package.i %in% installed_packages) == FALSE) {
      
      if(package.i == "Rcpp"){
        test <- try(install.packages(package.i))
        if(is.null(test)){
        } else {
          message(paste("Error: could not install package Rcpp"))
        }
      } else {
        install.packages(package.i)
      }
      
    }
    
    # If package wasn't installed, then send us an email
    if((package.i %in% rownames(installed.packages())) == FALSE) {
      
      critical_not_installed <- c(critical_not_installed, package.i)
      
    }
    
  }
  
  
  for(package.i in sort(optional)) {
    
    if((package.i %in% installed_packages) == FALSE) {
      
      if(package.i == "Rcpp"){
        test <- try(install.packages(package.i))
        if(is.null(test)){
          # message(paste("Installing", package.i, "..."))
        } else {
          message(paste("Error: could not install package Rcpp"))
        }
      } else {
        install.packages(package.i)
      }
      
    }
    
    
    # If package wasn't installed, then send us an email
    if((package.i %in% rownames(installed.packages())) == FALSE) {
      
      optional_not_installed <- c(optional_not_installed, package.i)
      
    }
    
  }
  
  # devtools_packages_to_install <- c("kassambara/ggcorrplot", "therbootcamp/baselers")
  # 
  # for(package.i in sort(devtools_packages_to_install)) {
  #   
  #   if((strsplit(package.i, split = "/")[[1]][2] %in% installed_packages) == FALSE) {
  #     
  #     devtools::install_github(package.i)
  #   }
  # }
  # 
  if(length(critical_not_installed) > 0 | length(optional_not_installed) > 0) {
    
    message("*** Bericht ***")
    
    warning(paste("Die kritischen Pakete [", 
                  paste(critical_not_installed, sep = ", "), 
                  "] und die optionalen Pakete [", 
                  paste(optional_not_installed, sep = ", "), 
                  "] konnten nicht installiert werden. Bitte kopiere diesen Text mit dem gesamten Installationsverlauf und sende uns diesen an therbootcamp@gmail.com damit wir helfen können.")) 
  } else {
    message("*** Bericht ***")
    
    message("Alle Pakete wurden erfolgreich installiert.")
    
  }
  
  message("--------------------------------")
  message("Bis bald im Bootcamp")
  message("therbootcamp@gmail.com")
  message("www.therbootcamp.com")
  message("--------------------------------")
  
}


# Run code!
Bootcamp_package_installation()
