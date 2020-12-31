**Code folder Organization**

The Hierarchy of the code file follows the following structure:

Code Folder: Stores the LN_SED, LN_BAS, HN_BAS, and HN_SED sub folders. Within each sub folder are codes tailored for each site. 

In the open code site specific folders are the Calibration_Site R scripts, these scripts are called upon by the core Readme file in the head of the repository. 

(Project_Master->Test_Rep->Readme)

The functions folder holds general functions which all site-specific codes call onto to complete analysis/data transmutation. The site specific codes should only contain directory information (sending function-derived results to correct sub-folder), as well as any manual code that could not be made to written in a general function (apply functions and complex pipes). 

Figure_Parent.R is a sourcing code, it calls upon all relevant code in the folders and generates figures/tables for the manuscript. It outputs to an Images folder in the Manuscript directory. 