# Reproducible Clustering

Version 0.1.0


## Introduction

This project includes a method to perform a clustering analysis on patients. A table is created with the patient characteristics (using `tableOne`) and then the actual analysis is performed. For now, the analysis is performed using the `poLCA` package in R and this means it determines the number of latent (hidden) classes/clusters in the data and then performs the analysis using this number of clusters. Graphs are included to evaluate the number of clusters that is optimal for the dataset and after the analysis a graph is produced to visualize the probability of belonging to the clusters for patients with a certain sex and age. At the end, a new characteristics table is created stratified by cluster, so the characteristics per cluster can be determined easily.

NOTE: This is the first and a very raw version of a project that is just starting. Below are some instructions on using this project for other data, on installation, but any feedback and input is welcome!\
Also, below you will find a section on future plans and improvements that are already projected to be implemented.


## Installation

To use the project, please clone this repository: \
`git clone https://github.com/mvvugt/repro-clus.git`

Or alternatively, if you are not familiar with github, click on the green **code**-button on the top of this page and choose **Download zip**. This will download all materials that can be browsed on this page and is organized in the same way as you can see below in the section **Project organization**.


## Project organization

```
.
├── .gitignore
├── CITATION.md
├── LICENSE.md
├── README.md
├── requirements.txt
├── bin                <- Compiled and external code, ignored by git (PG)
│   └── external       <- Any external source code, ignored by git (RO)
├── config             <- Configuration files (HW)
├── data               <- All project data, ignored by git
│   ├── processed      <- The final, canonical data sets for modeling. (PG)
│   ├── raw            <- The original, immutable data dump. (RO)
│   └── temp           <- Intermediate data that has been transformed. (PG)
├── docs               <- Documentation notebook for users (HW)
│   ├── manuscript     <- Manuscript source, e.g., LaTeX, Markdown, etc. (HW)
│   └── reports        <- Other project reports and notebooks (e.g. Jupyter, .Rmd) (HW)
├── results
│   ├── figures        <- Figures for the manuscript or reports (PG)
│   └── output         <- Other output for the manuscript or reports (PG)
└── src                <- Source code for this project (HW)

```


## Dependencies

It is recommended to use this project in _R version 4.0.2 (2020-06-22) -- "Taking Off Again"_ as it was developed and tested in this setting.\
Furthermore, everything is performed on a _MacOS Catalina 10.15.6_, but theoretically everything should also work on any other system. \
Shortly, the system and program versions:

R version 4.0.2 (2020-06-22)\
Platform: x86_64-apple-darwin17.0 (64-bit)\
Running under: macOS Catalina 10.15.6\


In the beginning of the script, all required packages are downloaded and loaded automatically. However, to control for different versions, the required packages and their versions are listed here as well (obtained from using the function `sessionInfo()`):

```
attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] reshape2_1.4.4       data.table_1.13.0    ggplot2_3.3.2        poLCA_1.4.1         
 [5] MASS_7.3-51.6        scatterplot3d_0.3-41 haven_2.3.1          tableone_0.11.1     
 [9] dplyr_1.0.0          readr_1.3.1          TempPackage_1.0      docstring_1.0.0     
```


## Usage

### Dataframe
This project requires a dataframe with observations (rows) and variables (columns).

### Variables
Generally, for the Latent Class Analysis, all variables should be categorical (or discrete, but that is not advised). However, it is allowed to have continuous variables in the dataframe, but exclude them from the analysis. Alternatively, as is already done in the script for age and BMI, the continuous variables can be converted into categorical variables. For age this is done rather arbitrarily in the script, and might depend on the data. For BMI the three WHO-classes of `<25`, `25-29` and `>30` are used. To change the categories for other variables, the script should be adapted.\
The coding of the variables could create problems if the dataframe is not loaded correctly. To this end, review the code and see if everything is according the dataset loaded, since for now, there is no other way to solve this problem yet.


## Future improvements

### Automatization
As of now, the script still needs a lot of input from the user, but this should become automated in the future. To that end, a configuration-file will be created in which the user changes some parameters and the script will do the rest automatically. Some features that need to be changed for this:\

* Parameter for including/excluding variables from analysis;
* Automatically converting continuous variables into categories specified by the user;
* Automatic choice of the best model (number of clusters);
* Make graphs of different variables, specified by user;
* Option to run several models, including different variables.

### Reorganization
In this first version only one script is made, which does several things and produces little output. This script should be divided into several scripts and should output more data. Some ideas for now:

* Seperate Characteristics table into new script;
  - One for general characteristics table, before any analysis;
  - One for characteristics table of all individuals and variables as included in the analysis;
  - One for characteristics table after performing analysis, stratified by clusters.
* Make script solely for the LCA;
  - Script chooses number of clusters and performs cluster analysis on this;
  - Script should also compute the graphs already mentioned;
  - Script should output all graphs and dataset after analysis (including the probabilites etc.).
* Add a script for data cleaning, containing at least:
  - Sanity checks, to see if the variables are categorical;
  - A way to correctly code the data;
  - A method of data conversion if continuous variables should become categories;
  - Data output.
* Expansion of the project;
  - Another clustering analysis to compare;
  - Comparison of the two clustering algorithms using metrics and visualization;
  - Additional analyses to follow-up on this clusters.


## License

This project is licensed under the terms of the [MIT License](/LICENSE.md)

## Citation

Please [cite this project as described here](/CITATION.md).
