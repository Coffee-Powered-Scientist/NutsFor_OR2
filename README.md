This is the master repository. 

Here is the list of folders with concise description of function:

Transient: Holds items yet to be officially added to calibration or manuscript

Sources: Holds bibliography files (BetterBibTex) for R markdown citations, and generates a report of the sources or methods used for calibration in a big-ol table! (See, "Parameter Table")

Reports: Holds the code and output of calibration reports

Output: Contains simulation outputs for base case and harvest scenario sites. It is really meant to hold edited data to make report and manuscript figure generation easier to code. 

Manual: Contains the code which generates the NutsFor user manual 

Data: Holds final dataset of model runs for reproducibility purposes, it is not well updated and is meant to be fully implemented at the end of the project.

Code: Holds all the R code used to analyze and visualize data, except for report Rmd files. 

Manuscript: Contains .tex and .cls formatting files for correct thesis formatting output, also contains the images folder which some code outputs figures too. 

List of Used R Packages (if you want to run the codes):

library(kableExtra)
library(ggplot2)
library(dplyr)
library(captioner)
library(car)
library(janitor)
library(scales)
library(reshape2)

