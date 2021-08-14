
## Correlation Plots ###

rm(list = ls())

library(ggplot2)
library(dplyr)
library(Hmisc)
library(reshape2)
library(ggpubr)
library(rstatix)
library(broom)
library(grid)
library(gridExtra)

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated")


Time_Frame<-seq(2005, 2505, 1)



Years_40<-c(2026, 2027, 2028, 2029, 2030, 2031, 2032, 2033, 2034, 2035, 
             2068, 2069, 2070, 2071, 2072, 2073, 2074, 2075, 2076, 2077, 
             2110, 2111,	2112,2113	, 2114, 2115, 2116, 2117, 2118, 2119,
            2152,	2153,	2154,	2155,	2156, 2157, 2158, 2159, 2160, 2161,
            
            2194,	2195,	2196,	2197,	2198, 2199, 2200, 2201, 2202, 2203,
            
            2236	,2237	,2238,	2239,	2240, 2241, 2242, 2243, 2244, 2245,
            	2278	,2279	,2280	,2281, 2282, 2283, 2284, 2285, 2286, 2287,		
	
            
            2320,	2321	,2322,	2323,	2324, 2325, 2326, 2327, 2328, 2329,
            
            
            	2362,	2363,	2364,	2365,	2365, 2366, 2367, 2368, 2369, 2370,
            
            	2404,	2405,	2406,	2407, 2408, 2409, 2410, 2411, 2412, 2413,
            
            2446,	2447,	2448,	2449, 2450, 2451, 2452, 2453, 2454, 2455,
            
            2488, 2489, 2490, 2491, 2492, 2493, 2494, 2495, 2496, 2497
            
            
)



Years_80<-c(2066,	2067,	2068,	2069,	2070,	2071, 2072, 2073, 2074, 2075,
            2148,	2149,	2150,	2151,	2152, 2153, 2154, 2155, 2156, 2157,
            2230,	2231,	2232,	2233,	2234, 2235, 2236, 2237, 2238, 2239,
            2312,	2313,	2314,	2315,	2316, 2317, 2318, 2319, 2320, 2321,
            2394,	2395,	2396,	2397,	2398, 2398, 2399, 2400, 2401, 2402,
            2476,	2477,	2478,	2479,	2480, 2480, 2481, 2482, 2483, 2484	
)

# LNS

Leaching_Pre_LNS4B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNS4B<-Leaching_Pre_LNS4B %>% filter(group_id %in% 8) %>% subset (YEAR %in% Time_Frame)

L8_LNS_4B<-Leaching_8_LNS4B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))



Leaching_Pre_LNS8B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNS8B<-Leaching_Pre_LNS8B %>% filter(group_id %in% 8) %>% subset (YEAR %in% Time_Frame)

L8_LNS_8B<-Leaching_8_LNS8B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

L8_LNS_8B_Inter<-Leaching_8_LNS8B %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="80 BO")


Leaching_Pre_LNS4W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNS4W<-Leaching_Pre_LNS4W %>% filter(group_id %in% 8) %>% subset (YEAR %in% Time_Frame)

L8_LNS_4W<-Leaching_8_LNS4W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

L8_LNS_4W_Inter<-Leaching_8_LNS4W %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="40 WTH")


Leaching_Pre_LNS8W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNS8W<-Leaching_Pre_LNS8W %>% filter(group_id %in% 8) %>% subset (YEAR %in% Time_Frame)

L8_LNS_8W<-Leaching_8_LNS8W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

L8_LNS_8W_Inter<-Leaching_8_LNS8W %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="80 WTH")


L8_LNS_4B$Harvest<-"40 BO"
L8_LNS_8B$Harvest<-"80 BO"
L8_LNS_4W$Harvest<-"40 WTH"
L8_LNS_8W$Harvest<-"80 WTH"


# 40 BO 

L8_LNS_4B_Ambient<-Leaching_8_LNS4B %>% subset(!YEAR %in% Years_40)

Ambient_LNS_4B<-L8_LNS_4B_Ambient  %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 BO", Loss_Type="Ambient")

L8_LNS_4B_Inter<-Leaching_8_LNS4B %>% group_by(YEAR) %>% subset(YEAR %in% Years_40) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 BO", Loss_Type="Inter_Harvest")

Interm_LNS_4B<-L8_LNS_4B_Inter %>% ungroup() %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 BO", Loss_Type="Inter_Harvest")

# 40 WTH


L8_LNS_4W_Ambient<-Leaching_8_LNS4W %>% subset(!YEAR %in% Years_40)

Ambient_LNS_4W<-L8_LNS_4W_Ambient  %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 WTH", Loss_Type="Ambient")

L8_LNS_4W_Inter<-Leaching_8_LNS4W %>% group_by(YEAR) %>% subset(YEAR %in% Years_40) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 WTH", Loss_Type="Inter_Harvest")

Interm_LNS_4W<-L8_LNS_4W_Inter %>% ungroup() %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))%>% 
  mutate(Harvest="40 WTH", Loss_Type="Inter_Harvest")

# 80BO

L8_LNS_8B_Ambient<-Leaching_8_LNS8B %>% subset(!YEAR %in% Years_80)

Ambient_LNS_8B<-L8_LNS_8B_Ambient  %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Ambient")

L8_LNS_8B_Inter<-Leaching_8_LNS4B %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Inter_Harvest")

Interm_LNS_8B<-L8_LNS_8B_Inter %>% ungroup() %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))%>% 
  mutate(Harvest="80 BO", Loss_Type="Inter_Harvest")

# 80 WTH


L8_LNS_8W_Ambient<-Leaching_8_LNS8W %>% subset(!YEAR %in% Years_80)

Ambient_LNS_8W<-L8_LNS_8W_Ambient  %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 WTH", Loss_Type="Ambient")

L8_LNS_8W_Inter<-Leaching_8_LNS8W %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 WTH", Loss_Type="Inter_Harvest")

Interm_LNS_8W<-L8_LNS_8W_Inter %>% ungroup() %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))%>% 
  mutate(Harvest="80 WTH", Loss_Type="Inter_Harvest")


# BIND

LNS_Bound<-rbind(L8_LNS_4B, L8_LNS_4W, L8_LNS_8B, L8_LNS_8W)

LNS_Bound_Harvest<-rbind(L8_LNS_4B_Inter, L8_LNS_4W_Inter, L8_LNS_8B_Inter, L8_LNS_8W_Inter)

LNS_Comp_Bound<-rbind(Ambient_LNS_4B, Interm_LNS_4B ,Ambient_LNS_4W, Interm_LNS_4W,Ambient_LNS_8B, Interm_LNS_8B,Ambient_LNS_8W, Interm_LNS_8W)

LNS_Comp_Bound<-LNS_Comp_Bound%>% mutate(Site="LNS")

# HNS


Leaching_Pre_HNS4B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNS4B<-Leaching_Pre_HNS4B %>% filter(group_id %in% 8) %>% subset (YEAR %in% Time_Frame)

L8_HNS_4B<-Leaching_8_HNS4B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_HNS8B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNS8B<-Leaching_Pre_HNS8B %>% filter(group_id %in% 8) %>% subset (YEAR %in% Time_Frame)

L8_HNS_8B<-Leaching_8_HNS8B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_HNS4W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNS4W<-Leaching_Pre_HNS4W %>% filter(group_id %in% 8) %>% subset (YEAR %in% Time_Frame)

L8_HNS_4W<-Leaching_8_HNS4W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_HNS8W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNS8W<-Leaching_Pre_HNS8W %>% filter(group_id %in% 8) %>% subset (YEAR %in% Time_Frame)

L8_HNS_8W<-Leaching_8_HNS8W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

L8_HNS_4B_Inter<-Leaching_8_HNS4B %>% group_by(YEAR) %>% subset(YEAR %in% Years_40) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="40 BO")
L8_HNS_8B_Inter<-Leaching_8_HNS8B %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="80 BO")
L8_HNS_4W_Inter<-Leaching_8_HNS4W %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="40 WTH")
L8_HNS_8W_Inter<-Leaching_8_HNS8W %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="80 WTH")


L8_HNS_4B$Harvest<-"40 BO"
L8_HNS_8B$Harvest<-"80 BO"
L8_HNS_4W$Harvest<-"40 WTH"
L8_HNS_8W$Harvest<-"80 WTH"

# 40 BO 

L8_HNS_4B_Ambient<-Leaching_8_HNS4B %>% subset(!YEAR %in% Years_40)

Ambient_HNS_4B<-L8_HNS_4B_Ambient  %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 BO", Loss_Type="Ambient")

L8_HNS_4B_Inter<-Leaching_8_HNS4B %>% group_by(YEAR) %>% subset(YEAR %in% Years_40) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 BO", Loss_Type="Inter_Harvest")

Interm_HNS_4B<-L8_HNS_4B_Inter %>% ungroup() %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))%>% 
  mutate(Harvest="40 BO", Loss_Type="Inter_Harvest")

# 40 WTH


L8_HNS_4W_Ambient<-Leaching_8_HNS4W %>% subset(!YEAR %in% Years_40)

Ambient_HNS_4W<-L8_HNS_4W_Ambient  %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 WTH", Loss_Type="Ambient")

L8_HNS_4W_Inter<-Leaching_8_HNS4W %>% group_by(YEAR) %>% subset(YEAR %in% Years_40) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 WTH", Loss_Type="Inter_Harvest")

Interm_HNS_4W<-L8_HNS_4W_Inter %>% ungroup() %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))%>% 
  mutate(Harvest="40 WTH", Loss_Type="Inter_Harvest")

# 80BO

L8_HNS_8B_Ambient<-Leaching_8_HNS8B %>% subset(!YEAR %in% Years_80)

Ambient_HNS_8B<-L8_HNS_8B_Ambient  %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Ambient")

L8_HNS_8B_Inter<-Leaching_8_HNS4B %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Inter_Harvest")

Interm_HNS_8B<-L8_HNS_8B_Inter %>% ungroup() %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))%>% 
  mutate(Harvest="80 BO", Loss_Type="Inter_Harvest")

# 80 WTH


L8_HNS_8W_Ambient<-Leaching_8_HNS8W %>% subset(!YEAR %in% Years_80)

Ambient_HNS_8W<-L8_HNS_8W_Ambient  %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 WTH", Loss_Type="Ambient")

L8_HNS_8W_Inter<-Leaching_8_HNS8W %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 WTH", Loss_Type="Inter_Harvest")

Interm_HNS_8W<-L8_HNS_8W_Inter %>% ungroup() %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))%>% 
  mutate(Harvest="80 WTH", Loss_Type="Inter_Harvest")


# BIND

HNS_Bound<-rbind(L8_HNS_4B, L8_HNS_4W, L8_HNS_8B, L8_HNS_8W)

HNS_Bound_Harvest<-rbind(L8_HNS_4B_Inter, L8_HNS_4W_Inter, L8_HNS_8B_Inter, L8_HNS_8W_Inter)

HNS_Comp_Bound<-rbind(Ambient_HNS_4B, Interm_HNS_4B ,Ambient_HNS_4W, Interm_HNS_4W,Ambient_HNS_8B, Interm_HNS_8B,Ambient_HNS_8W, Interm_HNS_8W)


HNS_Comp_Bound<-HNS_Comp_Bound%>% mutate(Site="HNS")



#Basalt

Leaching_Pre_LNB4B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNB4B<-Leaching_Pre_LNB4B %>% filter(group_id %in% 8) %>% subset (YEAR %in% Time_Frame)

L8_LNB_4B<-Leaching_8_LNB4B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_LNB8B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNB8B<-Leaching_Pre_LNB8B %>% filter(group_id %in% 8) %>% subset (YEAR %in% Time_Frame)

L8_LNB_8B<-Leaching_8_LNB8B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_LNB4W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_WTH/Edited Data/Soil_Solution_All2.csv")
 
Leaching_8_LNB4W<-Leaching_Pre_LNB4W %>% filter(group_id %in% 8) %>% subset (YEAR %in% Time_Frame)

L8_LNB_4W<-Leaching_8_LNB4W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_LNB8W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNB8W<-Leaching_Pre_LNB8W %>% filter(group_id %in% 8) %>% subset (YEAR %in% Time_Frame)

L8_LNB_8W<-Leaching_8_LNB8W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


L8_LNB_4B_Inter<-Leaching_8_LNB4B %>% group_by(YEAR) %>% subset(YEAR %in% Years_40) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="40 BO")
L8_LNB_8B_Inter<-Leaching_8_LNB8B %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="80 BO")
L8_LNB_4W_Inter<-Leaching_8_LNB4W %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="40 WTH")
L8_LNB_8W_Inter<-Leaching_8_LNB8W %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="80 WTH")


L8_LNB_4B$Harvest<-"40 BO"
L8_LNB_8B$Harvest<-"80 BO"
L8_LNB_4W$Harvest<-"40 WTH"
L8_LNB_8W$Harvest<-"80 WTH"

# 40 BO 

L8_LNB_4B_Ambient<-Leaching_8_LNB4B %>% subset(!YEAR %in% Years_40)

Ambient_LNB_4B<-L8_LNB_4B_Ambient  %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 BO", Loss_Type="Ambient")

L8_LNB_4B_Inter<-Leaching_8_LNB4B %>% group_by(YEAR) %>% subset(YEAR %in% Years_40) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 BO", Loss_Type="Inter_Harvest")

Interm_LNB_4B<-L8_LNB_4B_Inter %>% ungroup() %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))%>% 
  mutate(Harvest="40 BO", Loss_Type="Inter_Harvest")

# 40 WTH


L8_LNB_4W_Ambient<-Leaching_8_LNB4W %>% subset(!YEAR %in% Years_40)

Ambient_LNB_4W<-L8_LNB_4W_Ambient  %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 WTH", Loss_Type="Ambient")

L8_LNB_4W_Inter<-Leaching_8_LNB4W %>% group_by(YEAR) %>% subset(YEAR %in% Years_40) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 WTH", Loss_Type="Inter_Harvest")

Interm_LNB_4W<-L8_LNB_4W_Inter %>% ungroup() %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))%>% 
  mutate(Harvest="40 WTH", Loss_Type="Inter_Harvest")

# 80BO

L8_LNB_8B_Ambient<-Leaching_8_LNB8B %>% subset(!YEAR %in% Years_80)

Ambient_LNB_8B<-L8_LNB_8B_Ambient  %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Ambient")

L8_LNB_8B_Inter<-Leaching_8_LNB4B %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Inter_Harvest")

Interm_LNB_8B<-L8_LNB_8B_Inter %>% ungroup() %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))%>% 
  mutate(Harvest="80 BO", Loss_Type="Inter_Harvest")

# 80 WTH


L8_LNB_8W_Ambient<-Leaching_8_LNB8W %>% subset(!YEAR %in% Years_80)

Ambient_LNB_8W<-L8_LNB_8W_Ambient  %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 WTH", Loss_Type="Ambient")

L8_LNB_8W_Inter<-Leaching_8_LNB8W %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 WTH", Loss_Type="Inter_Harvest")

Interm_LNB_8W<-L8_LNB_8W_Inter %>% ungroup() %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))%>% 
  mutate(Harvest="80 WTH", Loss_Type="Inter_Harvest")


# BIND

LNB_Bound<-rbind(L8_LNB_4B, L8_LNB_4W, L8_LNB_8B, L8_LNB_8W)

LNB_Bound_Harvest<-rbind(L8_LNB_4B_Inter, L8_LNB_4W_Inter, L8_LNB_8B_Inter, L8_LNB_8W_Inter)

LNB_Comp_Bound<-rbind(Ambient_LNB_4B, Interm_LNB_4B ,Ambient_LNB_4W, Interm_LNB_4W,Ambient_LNB_8B, Interm_LNB_8B,Ambient_LNB_8W,Interm_LNB_8W)


LNB_Comp_Bound<-LNB_Comp_Bound%>% mutate(Site="LNB")

# HNB


Leaching_Pre_HNB4B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNB4B<-Leaching_Pre_HNB4B %>% filter(group_id %in% 8) %>% subset (YEAR %in% Time_Frame)

L8_HNB_4B<-Leaching_8_HNB4B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_HNB8B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNB8B<-Leaching_Pre_HNB8B %>% filter(group_id %in% 8) %>% subset (YEAR %in% Time_Frame)

L8_HNB_8B<-Leaching_8_HNB8B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_HNB4W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNB4W<-Leaching_Pre_HNB4W %>% filter(group_id %in% 8) %>% subset (YEAR %in% Time_Frame)

L8_HNB_4W<-Leaching_8_HNB4W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_HNB8W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNB8W<-Leaching_Pre_HNB8W %>% filter(group_id %in% 8) %>% subset (YEAR %in% Time_Frame)

L8_HNB_8W<-Leaching_8_HNB8W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))




L8_HNB_4B_Inter<-Leaching_8_HNB4B %>% group_by(YEAR) %>% subset(YEAR %in% Years_40) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="40 BO")
L8_HNB_8B_Inter<-Leaching_8_HNB8B %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="80 BO")
L8_HNB_4W_Inter<-Leaching_8_HNB4W %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="40 WTH")
L8_HNB_8W_Inter<-Leaching_8_HNB8W %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="80 WTH")


L8_HNB_4B$Harvest<-"40 BO"
L8_HNB_8B$Harvest<-"80 BO"
L8_HNB_4W$Harvest<-"40 WTH"
L8_HNB_8W$Harvest<-"80 WTH"

# 40 BO 

L8_HNB_4B_Ambient<-Leaching_8_HNB4B %>% subset(!YEAR %in% Years_40)

Ambient_HNB_4B<-L8_HNB_4B_Ambient  %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 BO", Loss_Type="Ambient")

L8_HNB_4B_Inter<-Leaching_8_HNB4B %>% group_by(YEAR) %>% subset(YEAR %in% Years_40) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 BO", Loss_Type="Inter_Harvest")

Interm_HNB_4B<-L8_HNB_4B_Inter %>% ungroup() %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))%>% 
  mutate(Harvest="40 BO", Loss_Type="Inter_Harvest")

# 40 WTH


L8_HNB_4W_Ambient<-Leaching_8_HNB4W %>% subset(!YEAR %in% Years_40)

Ambient_HNB_4W<-L8_HNB_4W_Ambient  %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 WTH", Loss_Type="Ambient")

L8_HNB_4W_Inter<-Leaching_8_HNB4W %>% group_by(YEAR) %>% subset(YEAR %in% Years_40) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 WTH", Loss_Type="Inter_Harvest")

Interm_HNB_4W<-L8_HNB_4W_Inter %>% ungroup() %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))%>% 
  mutate(Harvest="40 WTH", Loss_Type="Inter_Harvest")

# 80BO

L8_HNB_8B_Ambient<-Leaching_8_HNB8B %>% subset(!YEAR %in% Years_80)
Ambient_HNB_8B<-L8_HNB_8B_Ambient  %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Ambient")%>% 
  mutate(Harvest="80 BO", Loss_Type="Inter_Harvest")

L8_HNB_8B_Inter<-Leaching_8_HNB4B %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Inter_Harvest")

Interm_HNB_8B<-L8_HNB_8B_Inter %>% ungroup() %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))%>% 
  mutate(Harvest="80 BO", Loss_Type="Inter_Harvest")

# 80 WTH


L8_HNB_8W_Ambient<-Leaching_8_HNB8W %>% subset(!YEAR %in% Years_80)

Ambient_HNB_8W<-L8_HNB_8W_Ambient  %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 WTH", Loss_Type="Ambient")

L8_HNB_8W_Inter<-Leaching_8_HNB8W %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 WTH", Loss_Type="Inter_Harvest")

Interm_HNB_8W<-L8_HNB_8W_Inter %>% ungroup() %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))%>% 
  mutate(Harvest="80 WTH", Loss_Type="Inter_Harvest")


# BIND

HNB_Bound<-rbind(L8_HNB_4B, L8_HNB_4W, L8_HNB_8B, L8_HNB_8W)

HNB_Bound_Harvest<-rbind(L8_HNB_4B_Inter, L8_HNB_4W_Inter, L8_HNB_8B_Inter, L8_HNB_8W_Inter)

HNB_Comp_Bound<-rbind(Ambient_HNB_4B, Interm_HNB_4B ,Ambient_HNB_4W, Interm_HNB_4W,Ambient_HNB_8B, Interm_HNB_8B,Ambient_HNB_8W, Interm_HNB_8W)

HNB_Comp_Bound<-HNB_Comp_Bound%>% mutate(Site="HNB")

Tbl<-rbind(LNS_Comp_Bound, LNB_Comp_Bound, HNS_Comp_Bound, HNB_Comp_Bound)

write.csv(Tbl, "Rel_Loss_Table.csv")
