###############################################################################
#####                 Script to install and load packages                 #####
#####                                                                     #####
##### Author: Marion van Vugt                                             #####
##### Version: 0.1.0                                                      #####
##### Date: 02-10-2020                                                    #####
##### E-mail: m.vanvugt-2@umcutrecht.nl                                   #####
#####                                                                     #####
###############################################################################

req <- read.table("requirements.txt")
source("config/Config.R")

# Package devtools is installed seperately, because it is needed for the
# correct installation of the other packages.
if(isFALSE(require(devtools))) {
  print("Package devtools not present yet, installing now.")
  install.packages("devtools")
} else {
  print("Loading devtools")
  library(devtools)
}


## Installing the packages

if(version == "old") {
  print("You want the packages to be installed in the versions as specified in the Readme.")
  print("Installing packages now.")
  for (nrow in 3:nrow(req)) {
  print(paste0(req[nrow, 1], " version ", req[nrow, 2], " will be installed now."))
  install_version(paste(req[nrow, 1]), version = paste(req[nrow, 2]), upgrade = "never")
  print(paste0(req[nrow, 1], " version ", req[nrow, 2], " is now installed."))
  install.packages("data.table")  
  } 
} else if (version == "new") {
  print("You want the newest versions of the required packages.")
  print("I always do as you ask, installing packages now.")
  for (nrow in 2:nrow(req)) {
    print(paste0(req[nrow, 1], " will be installed now."))
    install.packages(paste0(req[nrow, 1]))
    print(paste0(req[nrow, 1], " is now installed."))
  } 
} else if (version == "no") {
  print("You don't want to install any packages.")
} else {
    stop("The version parameter is not recognized. Please choose: no/old/new")
}

## Loading the packages
for (nrow in 1:nrow(req)) {
  if (isFALSE(eval(parse(text = sprintf("require(\"%s\")", req[nrow, 1]))))) {
    warning(paste0(req[nrow, 1], " is still not installed properly"))
  } else {
    print(paste0("Loading ", req[nrow, 1]))
    eval(parse(text = sprintf("library(\"%s\")", req[nrow, 1])))
  }
}

rm(req, nrow, version)
