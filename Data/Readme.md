**Data Folder**

This folder is the raw data from every site, it is not a functional folder (it is not connected to any code). This is because NutsFor re-writes output data every time it runs and overwrites any folders (such as edited data folders) placed into it. Furthermore, the software NutsFor (Gregory van der Heijden, INRAE) cannot be in the repository (it is not mine to share, put simply). 

If you want to run the code, you have to copy and paste the entire contents of the Data Folder Subfolders directory into your C: drive. Do not copy the the Data Folder itself, but rather the individual sub-folders within. 

You may view the parameters calibrated for each site in the "Input Folder"-without the NutsFor.exe however, they are unable to dictate change in the output folders. 

"Base Sites" Subfolder contains the calibrated parameters and results of the 4 base conditions calibrated. 

1. LN_SED: Low N, Sedimentary Site
2. HN_SED: High N, Sedimentary Site
3. LN_BAS: Low N, Basalt Site
4. HN_BAS: High N, Basalt Site

Harvest Scenarios Contains raw data from 20 1000 year simulations, spilt into subfolders by the same above designation.

Each site type then contains 4 subfolders,

1. 40_BO: 40 rotation, bole only harvest
2. 40_WTH: 40 year rotation, whole tree harvest
3. 80_BO: 80 year rotation, bole only harvest
4. 80_WTH: 80 year rotation, whole tree harvest
5. Control: Base Site, 1000 years of continuous simulation, no harvest 