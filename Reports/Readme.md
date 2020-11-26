This folder holds sub-directories which hold a report and report code for all sites and harvest scenarios. These reports are meant to facilitate calibration of sites one at a time. 

These report (.Rmd)  source the mutator and function codes, and then access updated data from the "edited data" folders in the "Output" folder. This allows the code to update the report after each model run is complete; although running the code is a manual process. 

.Rmd->Mutator->Output->edited data->.Rmd