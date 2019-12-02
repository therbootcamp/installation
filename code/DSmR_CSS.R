# 2. Dezember 2019
# http://therbootcamp.github.io

# Skript um alle nötigen Pakete zu installieren

Bootcamp_package_installation <- function() {
  
  installed_packages <- rownames(installed.packages())
  
  
  # Critical packages 
  critical <- c(
    
    # Utilities --------------
    # "devtools",
    
    # Tidyverse --------------
    
    "tidyverse"
    
  )
  
  # Optional packages
  optional <- c(
    
    # Plotting --------------
    "patchwork", 
    "ggmap",
    "plotly",
    "viridis",
    "ggthemes"
    )
  
  
  message("Willkommen bei The R Bootcamp!")
  message("Wir werden einige Pakete für Sie installieren, dies könnte ein paar Minuten dauern...")
  
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
          # message(paste("Installiere", package.i, "..."))
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
  
  if(length(critical_not_installed) > 0 | length(optional_not_installed) > 0) {
    
    message("Bericht:")
    
    warning(paste("Die kritischen Pakete [", 
                  paste(critical_not_installed, sep = ", "), 
                  "] und die optionalen Pakete [", 
                  paste(optional_not_installed, sep = ", "), 
                  "] konnten nicht installiert werden. Bitte kopieren Sie diesen Text mit dem gesamten Bericht und senden ihn uns an therbootcamp@gmail.com damit wir helfen können.")) 
  } else {
    message("*** Bericht ***")
    
    message("Alle Pakete wurden ohne Probleme installiert.")
    
  }
  
  
  
  
  
  
  message("--------------------------------")
  message("Bis bald im Bootcamp")
  message("therbootcamp@gmail.com")
  message("www.therbootcamp.com")
  message("--------------------------------")
  
}


# Run code!
Bootcamp_package_installation()