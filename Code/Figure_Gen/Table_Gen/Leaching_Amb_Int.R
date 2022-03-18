
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

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/Table_Prep")


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

Years_80_Tail<-seq(2485, 2505, 1)

# Years in first harvest only

Years_R1_40<-c(2005	,2006,	2007,	2008,	2009,2010, 2011,
               2012	,2013	,2014	,2015,	2016,	2017,	2018,
               2019	,2020,	2021	,2022,	2023	,2024, 2025)


Years_R1_80<-c(2005	,2006	,2007	,2008,	2009,	2010,	2011,	2012,	2013,	2014,
               2015,	2016,	2017	,2018,	2019,	2020,	2021,	2022,	2023,	2024,
               2025,	2026,	2027,	2028,	2029,	2030,	2031,	2032,	2033,	2034,
               2035,	2036,	2037,	2038	,2039,	2040,	2041,	2042,	2043,	2044,
               2045,	2046,	2047,	2048,	2049,	2050,	2051,	2052,	2053,	2054,
               2055,	2056,	2057,	2058,	2059,	2060,	2061,	2062,	2063,	2064,	2065

)

Years_R1_40_INT<-c(2026,	2027,	2028	,2029,
                   2030	,2031	,2032	,2033,	2034, 2035
)

Years_R1_80_INT<-c(2066,	2067,	2068,	2069,
                   2070	,2071,	2072,	2073,	2074, 2075
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



L8_LNS_4B_Ambient_R1_Null<-L8_LNS_4B_Ambient %>% subset(!YEAR %in% Years_R1_40)

LNS_4B_Amb_R1_Null<-L8_LNS_4B_Ambient_R1_Null %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 BO", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/32, Mg=Mg*10/32, K=K*10/32, 
                                                             N=(NO3+NH4)*10/32, SO4=SO4*10/32,
                                                             P=P*10/32)

L8_LNS_4B_Ambient_R1<-Leaching_8_LNS4B %>% subset(YEAR %in% Years_R1_40)

LNS_4B_Amb_R1<-L8_LNS_4B_Ambient_R1%>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 BO", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/21, Mg=Mg*10/21, K=K*10/21, 
                                                             N=(NO3+NH4)*10/21, SO4=SO4*10/21,
                                                             P=P*10/21)

LNS_4B_Int_R1<-Leaching_8_LNS4B %>% subset(YEAR %in% Years_R1_40_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)

LNS_4B_Int_R1_Null<- Leaching_8_LNS4B %>% subset(YEAR %in% Years_40)  %>%
  mutate(N=NO3+NH4)


LNS_4B_Int_R1_Null<-LNS_4B_Int_R1_Null %>% subset(!YEAR %in% Years_R1_40_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


Ca_Ex<-LNS_4B_Int_R1_Null$Ca-LNS_4B_Amb_R1_Null$Ca+LNS_4B_Int_R1$Ca-LNS_4B_Amb_R1$Ca
Mg_Ex<-LNS_4B_Int_R1_Null$Mg-LNS_4B_Amb_R1_Null$Mg+LNS_4B_Int_R1$Mg-LNS_4B_Amb_R1$Mg
K_Ex<-LNS_4B_Int_R1_Null$K-LNS_4B_Amb_R1_Null$K+LNS_4B_Int_R1$K-LNS_4B_Amb_R1$K
N_Ex<-LNS_4B_Int_R1_Null$N-LNS_4B_Amb_R1_Null$N+LNS_4B_Int_R1$N-LNS_4B_Amb_R1$N
SO4_Ex<-LNS_4B_Int_R1_Null$SO4-LNS_4B_Amb_R1_Null$SO4+LNS_4B_Int_R1$SO4-LNS_4B_Amb_R1$SO4
P_Ex<-LNS_4B_Int_R1_Null$P-LNS_4B_Amb_R1_Null$P+LNS_4B_Int_R1$P-LNS_4B_Amb_R1$P

# R1 Alone

Ca_Ex_R1<-LNS_4B_Int_R1$Ca-LNS_4B_Amb_R1$Ca
Mg_Ex_R1<-LNS_4B_Int_R1$Mg-LNS_4B_Amb_R1$Mg
K_Ex_R1<-LNS_4B_Int_R1$K-LNS_4B_Amb_R1$K
N_Ex_R1<-LNS_4B_Int_R1$N-LNS_4B_Amb_R1$N
SO4_Ex_R1<-LNS_4B_Int_R1$SO4-LNS_4B_Amb_R1$SO4
P_Ex_R1<-LNS_4B_Int_R1$P-LNS_4B_Amb_R1$P



LNS_4B_EX_R1<-cbind(Ca_Ex_R1, Mg_Ex_R1, K_Ex_R1, N_Ex_R1, SO4_Ex_R1, P_Ex_R1)

LNS_4B_EX_R1<-as.data.frame(LNS_4B_EX_R1) %>% mutate(Site="LNS", Harvest="40BO")


LNS_4B_EX<-cbind(Ca_Ex, Mg_Ex, K_Ex, N_Ex, SO4_Ex, P_Ex)


LNS_4B_EX<-as.data.frame(LNS_4B_EX) %>% mutate(Site="LNS", Harvest="40BO")


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

L8_LNS_4W_Ambient_R1_Null<-L8_LNS_4W_Ambient %>% subset(!YEAR %in% Years_R1_40)

LNS_4W_Amb_R1_Null<-L8_LNS_4W_Ambient_R1_Null %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 WTH", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/32, Mg=Mg*10/32, K=K*10/32, 
                                                             N=(NO3+NH4)*10/32, SO4=SO4*10/32,
                                                             P=P*10/32)

L8_LNS_4W_Ambient_R1<-Leaching_8_LNS4W %>% subset(YEAR %in% Years_R1_40)

LNS_4W_Amb_R1<-L8_LNS_4W_Ambient_R1%>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 WTH", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/21, Mg=Mg*10/21, K=K*10/21, 
                                                             N=(NO3+NH4)*10/21, SO4=SO4*10/21,
                                                             P=P*10/21)

LNS_4W_Int_R1<-Leaching_8_LNS4W %>% subset(YEAR %in% Years_R1_40_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


LNS_4W_Int_R1_Null<- Leaching_8_LNS4W %>% subset(YEAR %in% Years_40) %>%
  mutate(N=NO3+NH4)


LNS_4W_Int_R1_Null<-LNS_4W_Int_R1_Null %>% subset(!YEAR %in% Years_R1_40_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


Ca_Ex<-LNS_4W_Int_R1_Null$Ca-LNS_4W_Amb_R1_Null$Ca+LNS_4W_Int_R1$Ca-LNS_4W_Amb_R1$Ca
Mg_Ex<-LNS_4W_Int_R1_Null$Mg-LNS_4W_Amb_R1_Null$Mg+LNS_4W_Int_R1$Mg-LNS_4W_Amb_R1$Mg
K_Ex<-LNS_4W_Int_R1_Null$K-LNS_4W_Amb_R1_Null$K+LNS_4W_Int_R1$K-LNS_4W_Amb_R1$K
N_Ex<-LNS_4W_Int_R1_Null$N-LNS_4W_Amb_R1_Null$N+LNS_4W_Int_R1$N-LNS_4W_Amb_R1$N
SO4_Ex<-LNS_4W_Int_R1_Null$SO4-LNS_4W_Amb_R1_Null$SO4+LNS_4W_Int_R1$SO4-LNS_4W_Amb_R1$SO4
P_Ex<-LNS_4W_Int_R1_Null$P-LNS_4W_Amb_R1_Null$P+LNS_4W_Int_R1$P-LNS_4W_Amb_R1$P

# R1 Alone

Ca_Ex_R1<-LNS_4W_Int_R1$Ca-LNS_4W_Amb_R1$Ca
Mg_Ex_R1<-LNS_4W_Int_R1$Mg-LNS_4W_Amb_R1$Mg
K_Ex_R1<-LNS_4W_Int_R1$K-LNS_4W_Amb_R1$K
N_Ex_R1<-LNS_4W_Int_R1$N-LNS_4W_Amb_R1$N
SO4_Ex_R1<-LNS_4W_Int_R1$SO4-LNS_4W_Amb_R1$SO4
P_Ex_R1<-LNS_4W_Int_R1$P-LNS_4W_Amb_R1$P



LNS_4W_EX_R1<-cbind(Ca_Ex_R1, Mg_Ex_R1, K_Ex_R1, N_Ex_R1, SO4_Ex_R1, P_Ex_R1)

LNS_4W_EX_R1<-as.data.frame(LNS_4W_EX_R1) %>% mutate(Site="LNS", Harvest="40WTH")

LNS_4W_EX<-cbind(Ca_Ex, Mg_Ex, K_Ex, N_Ex, SO4_Ex, P_Ex)

LNS_4W_EX<-as.data.frame(LNS_4W_EX) %>% mutate(Site="LNS", Harvest="40WTH")




# 80BO

L8_LNS_8B_Ambient<-Leaching_8_LNS8B %>% subset(!YEAR %in% Years_80)

Ambient_LNS_8B<-L8_LNS_8B_Ambient  %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Ambient")

L8_LNS_8B_Inter<-Leaching_8_LNS8B %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Inter_Harvest")

Interm_LNS_8B<-L8_LNS_8B_Inter %>% ungroup() %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))%>% 
  mutate(Harvest="80 BO", Loss_Type="Inter_Harvest")

L8_LNS_8B_Ambient_R1_Null<-L8_LNS_8B_Ambient %>% subset(!YEAR %in% Years_R1_80)

L8_LNS_8B_Ambient_R1_Null<-L8_LNS_8B_Ambient_R1_Null %>% subset(!YEAR %in% Years_80_Tail)

L8_LNS_8B_Ambient_R1_Null_TAIL<-L8_LNS_8B_Ambient %>% subset(YEAR %in% Years_80_Tail)

LNS_8B_Amb_R1_Null<-L8_LNS_8B_Ambient_R1_Null %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/72, Mg=Mg*10/72, K=K*10/72, 
                                                             N=(NO3+NH4)*10/72, SO4=SO4*10/72,
                                                             P=P*10/72)

LNS_8B_TAIL<- L8_LNS_8B_Ambient_R1_Null_TAIL %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/21, Mg=Mg*10/21, K=K*10/21, 
                                                             N=(NO3+NH4)*10/21, SO4=SO4*10/21,
                                                             P=P*10/21)


L8_LNS_8B_Ambient_R1<-Leaching_8_LNS8B %>% subset(YEAR %in% Years_R1_80)

LNS_8B_Amb_R1<-L8_LNS_8B_Ambient_R1%>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/61, Mg=Mg*10/61, K=K*10/61, 
                                                             N=(NO3+NH4)*10/61, SO4=SO4*10/61,
                                                             P=P*10/61)

LNS_8B_Int_R1<-Leaching_8_LNS8B %>% subset(YEAR %in% Years_R1_80_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


LNS_8B_Int_R1_Null<- Leaching_8_LNS8B %>% subset(YEAR %in% Years_80) %>%
  mutate(N=NO3+NH4)


LNS_8B_Int_R1_Null<-LNS_8B_Int_R1_Null %>% subset(!YEAR %in% Years_R1_80_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


Ca_Ex<-LNS_8B_Int_R1_Null$Ca-LNS_8B_Amb_R1_Null$Ca+LNS_8B_Int_R1$Ca-LNS_8B_Amb_R1$Ca-LNS_8B_TAIL$Ca
Mg_Ex<-LNS_8B_Int_R1_Null$Mg-LNS_8B_Amb_R1_Null$Mg+LNS_8B_Int_R1$Mg-LNS_8B_Amb_R1$Mg-LNS_8B_TAIL$Mg
K_Ex<-LNS_8B_Int_R1_Null$K-LNS_8B_Amb_R1_Null$K+LNS_8B_Int_R1$K-LNS_8B_Amb_R1$K-LNS_8B_TAIL$K
N_Ex<-LNS_8B_Int_R1_Null$N-LNS_8B_Amb_R1_Null$N+LNS_8B_Int_R1$N-LNS_8B_Amb_R1$N-LNS_8B_TAIL$N
SO4_Ex<-LNS_8B_Int_R1_Null$SO4-LNS_8B_Amb_R1_Null$SO4+LNS_8B_Int_R1$SO4-LNS_8B_Amb_R1$SO4-LNS_8B_TAIL$SO4
P_Ex<-LNS_8B_Int_R1_Null$P-LNS_8B_Amb_R1_Null$P+LNS_8B_Int_R1$P-LNS_8B_Amb_R1$P-LNS_8B_TAIL$P

# R1 Alone

Ca_Ex_R1<-LNS_8B_Int_R1$Ca-LNS_8B_Amb_R1$Ca
Mg_Ex_R1<-LNS_8B_Int_R1$Mg-LNS_8B_Amb_R1$Mg
K_Ex_R1<-LNS_8B_Int_R1$K-LNS_8B_Amb_R1$K
N_Ex_R1<-LNS_8B_Int_R1$N-LNS_8B_Amb_R1$N
SO4_Ex_R1<-LNS_8B_Int_R1$SO4-LNS_8B_Amb_R1$SO4
P_Ex_R1<-LNS_8B_Int_R1$P-LNS_8B_Amb_R1$P



LNS_8B_EX_R1<-cbind(Ca_Ex_R1, Mg_Ex_R1, K_Ex_R1, N_Ex_R1, SO4_Ex_R1, P_Ex_R1)

LNS_8B_EX_R1<-as.data.frame(LNS_8B_EX_R1) %>% mutate(Site="LNS", Harvest="80BO")

LNS_8B_EX<-cbind(Ca_Ex, Mg_Ex, K_Ex, N_Ex, SO4_Ex, P_Ex)

LNS_8B_EX<-as.data.frame(LNS_8B_EX) %>% mutate(Site="LNS", Harvest="80BO")




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

L8_LNS_8W_Ambient_R1_Null<-L8_LNS_8W_Ambient %>% subset(!YEAR %in% Years_R1_80)

L8_LNS_8W_Ambient_R1_Null<-L8_LNS_8W_Ambient_R1_Null %>% subset(!YEAR %in% Years_80_Tail)

L8_LNS_8W_Ambient_R1_Null_TAIL<-L8_LNS_8W_Ambient %>% subset(YEAR %in% Years_80_Tail)

LNS_8W_Amb_R1_Null<-L8_LNS_8W_Ambient_R1_Null %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 WTH", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/72, Mg=Mg*10/72, K=K*10/72, 
                                                              N=(NO3+NH4)*10/72, SO4=SO4*10/72,
                                                              P=P*10/72)

LNS_8W_TAIL<- L8_LNS_8W_Ambient_R1_Null_TAIL %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 WTH", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/21, Mg=Mg*10/21, K=K*10/21, 
                                                              N=(NO3+NH4)*10/21, SO4=SO4*10/21,
                                                              P=P*10/21)


L8_LNS_8W_Ambient_R1<-Leaching_8_LNS8W %>% subset(YEAR %in% Years_R1_80)

LNS_8W_Amb_R1<-L8_LNS_8W_Ambient_R1%>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 WTH", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/61, Mg=Mg*10/61, K=K*10/61, 
                                                              N=(NO3+NH4)*10/61, SO4=SO4*10/61,
                                                              P=P*10/61)

LNS_8W_Int_R1<-Leaching_8_LNS8W %>% subset(YEAR %in% Years_R1_80_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


LNS_8W_Int_R1_Null<- Leaching_8_LNS8W %>% subset(YEAR %in% Years_80) %>%
  mutate(N=NO3+NH4)


LNS_8W_Int_R1_Null<-LNS_8W_Int_R1_Null %>% subset(!YEAR %in% Years_R1_80_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


Ca_Ex<-LNS_8W_Int_R1_Null$Ca-LNS_8W_Amb_R1_Null$Ca+LNS_8W_Int_R1$Ca-LNS_8W_Amb_R1$Ca-LNS_8W_TAIL$Ca
Mg_Ex<-LNS_8W_Int_R1_Null$Mg-LNS_8W_Amb_R1_Null$Mg+LNS_8W_Int_R1$Mg-LNS_8W_Amb_R1$Mg-LNS_8W_TAIL$Mg
K_Ex<-LNS_8W_Int_R1_Null$K-LNS_8W_Amb_R1_Null$K+LNS_8W_Int_R1$K-LNS_8W_Amb_R1$K-LNS_8W_TAIL$K
N_Ex<-LNS_8W_Int_R1_Null$N-LNS_8W_Amb_R1_Null$N+LNS_8W_Int_R1$N-LNS_8W_Amb_R1$N-LNS_8W_TAIL$N
SO4_Ex<-LNS_8W_Int_R1_Null$SO4-LNS_8W_Amb_R1_Null$SO4+LNS_8W_Int_R1$SO4-LNS_8W_Amb_R1$SO4-LNS_8W_TAIL$SO4
P_Ex<-LNS_8W_Int_R1_Null$P-LNS_8W_Amb_R1_Null$P+LNS_8W_Int_R1$P-LNS_8W_Amb_R1$P-LNS_8W_TAIL$P

# R1 Alone

Ca_Ex_R1<-LNS_8W_Int_R1$Ca-LNS_8W_Amb_R1$Ca
Mg_Ex_R1<-LNS_8W_Int_R1$Mg-LNS_8W_Amb_R1$Mg
K_Ex_R1<-LNS_8W_Int_R1$K-LNS_8W_Amb_R1$K
N_Ex_R1<-LNS_8W_Int_R1$N-LNS_8W_Amb_R1$N
SO4_Ex_R1<-LNS_8W_Int_R1$SO4-LNS_8W_Amb_R1$SO4
P_Ex_R1<-LNS_8W_Int_R1$P-LNS_8W_Amb_R1$P



LNS_8W_EX_R1<-cbind(Ca_Ex_R1, Mg_Ex_R1, K_Ex_R1, N_Ex_R1, SO4_Ex_R1, P_Ex_R1)

LNS_8W_EX_R1<-as.data.frame(LNS_8W_EX_R1) %>% mutate(Site="LNS", Harvest="80WTH")

LNS_8W_EX<-cbind(Ca_Ex, Mg_Ex, K_Ex, N_Ex, SO4_Ex, P_Ex)

LNS_8W_EX<-as.data.frame(LNS_8W_EX) %>% mutate(Site="LNS", Harvest="80WTH")



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


L8_HNS_4B_Ambient_R1_Null<-L8_HNS_4B_Ambient %>% subset(!YEAR %in% Years_R1_40)

HNS_4B_Amb_R1_Null<-L8_HNS_4B_Ambient_R1_Null %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 BO", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/32, Mg=Mg*10/32, K=K*10/32, 
                                                             N=(NO3+NH4)*10/32, SO4=SO4*10/32,
                                                             P=P*10/32)

L8_HNS_4B_Ambient_R1<-Leaching_8_HNS4B %>% subset(YEAR %in% Years_R1_40)

HNS_4B_Amb_R1<-L8_HNS_4B_Ambient_R1%>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 BO", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/21, Mg=Mg*10/21, K=K*10/21, 
                                                             N=(NO3+NH4)*10/21, SO4=SO4*10/21,
                                                             P=P*10/21)

HNS_4B_Int_R1<-Leaching_8_HNS4B %>% subset(YEAR %in% Years_R1_40_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


HNS_4B_Int_R1_Null<- Leaching_8_HNS4B %>% subset(YEAR %in% Years_40) %>%
  mutate(N=NO3+NH4)


HNS_4B_Int_R1_Null<-HNS_4B_Int_R1_Null %>% subset(!YEAR %in% Years_R1_40_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


Ca_Ex<-HNS_4B_Int_R1_Null$Ca-HNS_4B_Amb_R1_Null$Ca+HNS_4B_Int_R1$Ca-HNS_4B_Amb_R1$Ca
Mg_Ex<-HNS_4B_Int_R1_Null$Mg-HNS_4B_Amb_R1_Null$Mg+HNS_4B_Int_R1$Mg-HNS_4B_Amb_R1$Mg
K_Ex<-HNS_4B_Int_R1_Null$K-HNS_4B_Amb_R1_Null$K+HNS_4B_Int_R1$K-HNS_4B_Amb_R1$K
N_Ex<-HNS_4B_Int_R1_Null$N-HNS_4B_Amb_R1_Null$N+HNS_4B_Int_R1$N-HNS_4B_Amb_R1$N
SO4_Ex<-HNS_4B_Int_R1_Null$SO4-HNS_4B_Amb_R1_Null$SO4+HNS_4B_Int_R1$SO4-HNS_4B_Amb_R1$SO4
P_Ex<-HNS_4B_Int_R1_Null$P-HNS_4B_Amb_R1_Null$P+HNS_4B_Int_R1$P-HNS_4B_Amb_R1$P

# R1 Alone

Ca_Ex_R1<-HNS_4B_Int_R1$Ca-HNS_4B_Amb_R1$Ca
Mg_Ex_R1<-HNS_4B_Int_R1$Mg-HNS_4B_Amb_R1$Mg
K_Ex_R1<-HNS_4B_Int_R1$K-HNS_4B_Amb_R1$K
N_Ex_R1<-HNS_4B_Int_R1$N-HNS_4B_Amb_R1$N
SO4_Ex_R1<-HNS_4B_Int_R1$SO4-HNS_4B_Amb_R1$SO4
P_Ex_R1<-HNS_4B_Int_R1$P-HNS_4B_Amb_R1$P



HNS_4B_EX_R1<-cbind(Ca_Ex_R1, Mg_Ex_R1, K_Ex_R1, N_Ex_R1, SO4_Ex_R1, P_Ex_R1)

HNS_4B_EX_R1<-as.data.frame(HNS_4B_EX_R1) %>% mutate(Site="HNS", Harvest="40BO")

HNS_4B_EX<-cbind(Ca_Ex, Mg_Ex, K_Ex, N_Ex, SO4_Ex, P_Ex)

HNS_4B_EX<-as.data.frame(HNS_4B_EX) %>% mutate(Site="HNS", Harvest="40BO")


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


L8_HNS_4W_Ambient_R1_Null<-L8_HNS_4W_Ambient %>% subset(!YEAR %in% Years_R1_40)

HNS_4W_Amb_R1_Null<-L8_HNS_4W_Ambient_R1_Null %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 WTH", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/32, Mg=Mg*10/32, K=K*10/32, 
                                                             N=(NO3+NH4)*10/32, SO4=SO4*10/32,
                                                             P=P*10/32)

L8_HNS_4W_Ambient_R1<-Leaching_8_HNS4W %>% subset(YEAR %in% Years_R1_40)

HNS_4W_Amb_R1<-L8_HNS_4W_Ambient_R1%>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 WTH", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/21, Mg=Mg*10/21, K=K*10/21, 
                                                             N=(NO3+NH4)*10/21, SO4=SO4*10/21,
                                                             P=P*10/21)

HNS_4W_Int_R1<-Leaching_8_HNS4W %>% subset(YEAR %in% Years_R1_40_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


HNS_4W_Int_R1_Null<- Leaching_8_HNS4W %>% subset(YEAR %in% Years_40) %>%
  mutate(N=NO3+NH4)


HNS_4W_Int_R1_Null<-HNS_4W_Int_R1_Null %>% subset(!YEAR %in% Years_R1_40_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


Ca_Ex<-HNS_4W_Int_R1_Null$Ca-HNS_4W_Amb_R1_Null$Ca+HNS_4W_Int_R1$Ca-HNS_4W_Amb_R1$Ca
Mg_Ex<-HNS_4W_Int_R1_Null$Mg-HNS_4W_Amb_R1_Null$Mg+HNS_4W_Int_R1$Mg-HNS_4W_Amb_R1$Mg
K_Ex<-HNS_4W_Int_R1_Null$K-HNS_4W_Amb_R1_Null$K+HNS_4W_Int_R1$K-HNS_4W_Amb_R1$K
N_Ex<-HNS_4W_Int_R1_Null$N-HNS_4W_Amb_R1_Null$N+HNS_4W_Int_R1$N-HNS_4W_Amb_R1$N
SO4_Ex<-HNS_4W_Int_R1_Null$SO4-HNS_4W_Amb_R1_Null$SO4+HNS_4W_Int_R1$SO4-HNS_4W_Amb_R1$SO4
P_Ex<-HNS_4W_Int_R1_Null$P-HNS_4W_Amb_R1_Null$P+HNS_4W_Int_R1$P-HNS_4W_Amb_R1$P

# R1 Alone

Ca_Ex_R1<-HNS_4W_Int_R1$Ca-HNS_4W_Amb_R1$Ca
Mg_Ex_R1<-HNS_4W_Int_R1$Mg-HNS_4W_Amb_R1$Mg
K_Ex_R1<-HNS_4W_Int_R1$K-HNS_4W_Amb_R1$K
N_Ex_R1<-HNS_4W_Int_R1$N-HNS_4W_Amb_R1$N
SO4_Ex_R1<-HNS_4W_Int_R1$SO4-HNS_4W_Amb_R1$SO4
P_Ex_R1<-HNS_4W_Int_R1$P-HNS_4W_Amb_R1$P



HNS_4W_EX_R1<-cbind(Ca_Ex_R1, Mg_Ex_R1, K_Ex_R1, N_Ex_R1, SO4_Ex_R1, P_Ex_R1)

HNS_4W_EX_R1<-as.data.frame(HNS_4W_EX_R1) %>% mutate(Site="HNS", Harvest="40WTH")

HNS_4W_EX<-cbind(Ca_Ex, Mg_Ex, K_Ex, N_Ex, SO4_Ex, P_Ex)

HNS_4W_EX<-as.data.frame(HNS_4W_EX) %>% mutate(Site="HNS", Harvest="40WTH")

# 80BO

L8_HNS_8B_Ambient<-Leaching_8_HNS8B %>% subset(!YEAR %in% Years_80)

Ambient_HNS_8B<-L8_HNS_8B_Ambient  %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Ambient")

L8_HNS_8B_Inter<-Leaching_8_HNS8B %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Inter_Harvest")

Interm_HNS_8B<-L8_HNS_8B_Inter %>% ungroup() %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))%>% 
  mutate(Harvest="80 BO", Loss_Type="Inter_Harvest")

L8_HNS_8B_Ambient_R1_Null<-L8_HNS_8B_Ambient %>% subset(!YEAR %in% Years_R1_80)

L8_HNS_8B_Ambient_R1_Null<-L8_HNS_8B_Ambient_R1_Null %>% subset(!YEAR %in% Years_80_Tail)

L8_HNS_8B_Ambient_R1_Null_TAIL<-L8_HNS_8B_Ambient %>% subset(YEAR %in% Years_80_Tail)

HNS_8B_Amb_R1_Null<-L8_HNS_8B_Ambient_R1_Null %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/72, Mg=Mg*10/72, K=K*10/72, 
                                                             N=(NO3+NH4)*10/72, SO4=SO4*10/72,
                                                             P=P*10/72)

HNS_8B_TAIL<- L8_HNS_8B_Ambient_R1_Null_TAIL %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/21, Mg=Mg*10/21, K=K*10/21, 
                                                             N=(NO3+NH4)*10/21, SO4=SO4*10/21,
                                                             P=P*10/21)


L8_HNS_8B_Ambient_R1<-Leaching_8_HNS8B %>% subset(YEAR %in% Years_R1_80)

HNS_8B_Amb_R1<-L8_HNS_8B_Ambient_R1%>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/61, Mg=Mg*10/61, K=K*10/61, 
                                                             N=(NO3+NH4)*10/61, SO4=SO4*10/61,
                                                             P=P*10/61)

HNS_8B_Int_R1<-Leaching_8_HNS8B %>% subset(YEAR %in% Years_R1_80_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


HNS_8B_Int_R1_Null<- Leaching_8_HNS8B %>% subset(YEAR %in% Years_80) %>%
  mutate(N=NO3+NH4)


HNS_8B_Int_R1_Null<-HNS_8B_Int_R1_Null %>% subset(!YEAR %in% Years_R1_80_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


Ca_Ex<-HNS_8B_Int_R1_Null$Ca-HNS_8B_Amb_R1_Null$Ca+HNS_8B_Int_R1$Ca-HNS_8B_Amb_R1$Ca-HNS_8B_TAIL$Ca
Mg_Ex<-HNS_8B_Int_R1_Null$Mg-HNS_8B_Amb_R1_Null$Mg+HNS_8B_Int_R1$Mg-HNS_8B_Amb_R1$Mg-HNS_8B_TAIL$Mg
K_Ex<-HNS_8B_Int_R1_Null$K-HNS_8B_Amb_R1_Null$K+HNS_8B_Int_R1$K-HNS_8B_Amb_R1$K-HNS_8B_TAIL$K
N_Ex<-HNS_8B_Int_R1_Null$N-HNS_8B_Amb_R1_Null$N+HNS_8B_Int_R1$N-HNS_8B_Amb_R1$N-HNS_8B_TAIL$N
SO4_Ex<-HNS_8B_Int_R1_Null$SO4-HNS_8B_Amb_R1_Null$SO4+HNS_8B_Int_R1$SO4-HNS_8B_Amb_R1$SO4-HNS_8B_TAIL$SO4
P_Ex<-HNS_8B_Int_R1_Null$P-HNS_8B_Amb_R1_Null$P+HNS_8B_Int_R1$P-HNS_8B_Amb_R1$P-HNS_8B_TAIL$P

# R1 Alone

Ca_Ex_R1<-HNS_8B_Int_R1$Ca-HNS_8B_Amb_R1$Ca
Mg_Ex_R1<-HNS_8B_Int_R1$Mg-HNS_8B_Amb_R1$Mg
K_Ex_R1<-HNS_8B_Int_R1$K-HNS_8B_Amb_R1$K
N_Ex_R1<-HNS_8B_Int_R1$N-HNS_8B_Amb_R1$N
SO4_Ex_R1<-HNS_8B_Int_R1$SO4-HNS_8B_Amb_R1$SO4
P_Ex_R1<-HNS_8B_Int_R1$P-HNS_8B_Amb_R1$P



HNS_8B_EX_R1<-cbind(Ca_Ex_R1, Mg_Ex_R1, K_Ex_R1, N_Ex_R1, SO4_Ex_R1, P_Ex_R1)

HNS_8B_EX_R1<-as.data.frame(HNS_8B_EX_R1) %>% mutate(Site="HNS", Harvest="80BO")

HNS_8B_EX<-cbind(Ca_Ex, Mg_Ex, K_Ex, N_Ex, SO4_Ex, P_Ex)

HNS_8B_EX<-as.data.frame(HNS_8B_EX) %>% mutate(Site="HNS", Harvest="80BO")




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

L8_HNS_8W_Ambient_R1_Null<-L8_HNS_8W_Ambient %>% subset(!YEAR %in% Years_R1_80)

L8_HNS_8W_Ambient_R1_Null<-L8_HNS_8W_Ambient_R1_Null %>% subset(!YEAR %in% Years_80_Tail)

L8_HNS_8W_Ambient_R1_Null_TAIL<-L8_HNS_8W_Ambient %>% subset(YEAR %in% Years_80_Tail)

HNS_8W_Amb_R1_Null<-L8_HNS_8W_Ambient_R1_Null %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 WTH", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/72, Mg=Mg*10/72, K=K*10/72, 
                                                              N=(NO3+NH4)*10/72, SO4=SO4*10/72,
                                                              P=P*10/72)

HNS_8W_TAIL<- L8_HNS_8W_Ambient_R1_Null_TAIL %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 WTH", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/21, Mg=Mg*10/21, K=K*10/21, 
                                                              N=(NO3+NH4)*10/21, SO4=SO4*10/21,
                                                              P=P*10/21)


L8_HNS_8W_Ambient_R1<-Leaching_8_HNS8W %>% subset(YEAR %in% Years_R1_80)

HNS_8W_Amb_R1<-L8_HNS_8W_Ambient_R1%>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 WTH", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/61, Mg=Mg*10/61, K=K*10/61, 
                                                              N=(NO3+NH4)*10/61, SO4=SO4*10/61,
                                                              P=P*10/61)

HNS_8W_Int_R1<-Leaching_8_HNS8W %>% subset(YEAR %in% Years_R1_80_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


HNS_8W_Int_R1_Null<- Leaching_8_HNS8W %>% subset(YEAR %in% Years_80) %>%
  mutate(N=NO3+NH4)


HNS_8W_Int_R1_Null<-HNS_8W_Int_R1_Null %>% subset(!YEAR %in% Years_R1_80_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


Ca_Ex<-HNS_8W_Int_R1_Null$Ca-HNS_8W_Amb_R1_Null$Ca+HNS_8W_Int_R1$Ca-HNS_8W_Amb_R1$Ca-HNS_8W_TAIL$Ca
Mg_Ex<-HNS_8W_Int_R1_Null$Mg-HNS_8W_Amb_R1_Null$Mg+HNS_8W_Int_R1$Mg-HNS_8W_Amb_R1$Mg-HNS_8W_TAIL$Mg
K_Ex<-HNS_8W_Int_R1_Null$K-HNS_8W_Amb_R1_Null$K+HNS_8W_Int_R1$K-HNS_8W_Amb_R1$K-HNS_8W_TAIL$K
N_Ex<-HNS_8W_Int_R1_Null$N-HNS_8W_Amb_R1_Null$N+HNS_8W_Int_R1$N-HNS_8W_Amb_R1$N-HNS_8W_TAIL$N
SO4_Ex<-HNS_8W_Int_R1_Null$SO4-HNS_8W_Amb_R1_Null$SO4+HNS_8W_Int_R1$SO4-HNS_8W_Amb_R1$SO4-HNS_8W_TAIL$SO4
P_Ex<-HNS_8W_Int_R1_Null$P-HNS_8W_Amb_R1_Null$P+HNS_8W_Int_R1$P-HNS_8W_Amb_R1$P-HNS_8W_TAIL$P

# R1 Alone

Ca_Ex_R1<-HNS_8W_Int_R1$Ca-HNS_8W_Amb_R1$Ca
Mg_Ex_R1<-HNS_8W_Int_R1$Mg-HNS_8W_Amb_R1$Mg
K_Ex_R1<-HNS_8W_Int_R1$K-HNS_8W_Amb_R1$K
N_Ex_R1<-HNS_8W_Int_R1$N-HNS_8W_Amb_R1$N
SO4_Ex_R1<-HNS_8W_Int_R1$SO4-HNS_8W_Amb_R1$SO4
P_Ex_R1<-HNS_8W_Int_R1$P-HNS_8W_Amb_R1$P



HNS_8W_EX_R1<-cbind(Ca_Ex_R1, Mg_Ex_R1, K_Ex_R1, N_Ex_R1, SO4_Ex_R1, P_Ex_R1)

HNS_8W_EX_R1<-as.data.frame(HNS_8W_EX_R1) %>% mutate(Site="HNS", Harvest="80WTH")

HNS_8W_EX<-cbind(Ca_Ex, Mg_Ex, K_Ex, N_Ex, SO4_Ex, P_Ex)

HNS_8W_EX<-as.data.frame(HNS_8W_EX) %>% mutate(Site="HNS", Harvest="80WTH")


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

L8_LNB_8B_Inter<-Leaching_8_LNB8B %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% 
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

### LNB Extra


L8_LNB_4B_Ambient_R1_Null<-L8_LNB_4B_Ambient %>% subset(!YEAR %in% Years_R1_40)

LNB_4B_Amb_R1_Null<-L8_LNB_4B_Ambient_R1_Null %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 BO", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/32, Mg=Mg*10/32, K=K*10/32, 
                                                             N=(NO3+NH4)*10/32, SO4=SO4*10/32,
                                                             P=P*10/32)

L8_LNB_4B_Ambient_R1<-Leaching_8_LNB4B %>% subset(YEAR %in% Years_R1_40)

LNB_4B_Amb_R1<-L8_LNB_4B_Ambient_R1%>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 BO", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/21, Mg=Mg*10/21, K=K*10/21, 
                                                             N=(NO3+NH4)*10/21, SO4=SO4*10/21,
                                                             P=P*10/21)

LNB_4B_Int_R1<-Leaching_8_LNB4B %>% subset(YEAR %in% Years_R1_40_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


LNB_4B_Int_R1_Null<- Leaching_8_LNB4B %>% subset(YEAR %in% Years_40) %>%
  mutate(N=NO3+NH4)


LNB_4B_Int_R1_Null<-LNB_4B_Int_R1_Null %>% subset(!YEAR %in% Years_R1_40_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


Ca_Ex<-LNB_4B_Int_R1_Null$Ca-LNB_4B_Amb_R1_Null$Ca+LNB_4B_Int_R1$Ca-LNB_4B_Amb_R1$Ca
Mg_Ex<-LNB_4B_Int_R1_Null$Mg-LNB_4B_Amb_R1_Null$Mg+LNB_4B_Int_R1$Mg-LNB_4B_Amb_R1$Mg
K_Ex<-LNB_4B_Int_R1_Null$K-LNB_4B_Amb_R1_Null$K+LNB_4B_Int_R1$K-LNB_4B_Amb_R1$K
N_Ex<-LNB_4B_Int_R1_Null$N-LNB_4B_Amb_R1_Null$N+LNB_4B_Int_R1$N-LNB_4B_Amb_R1$N
SO4_Ex<-LNB_4B_Int_R1_Null$SO4-LNB_4B_Amb_R1_Null$SO4+LNB_4B_Int_R1$SO4-LNB_4B_Amb_R1$SO4
P_Ex<-LNB_4B_Int_R1_Null$P-LNB_4B_Amb_R1_Null$P+LNB_4B_Int_R1$P-LNB_4B_Amb_R1$P

# R1 Alone

Ca_Ex_R1<-LNB_4B_Int_R1$Ca-LNB_4B_Amb_R1$Ca
Mg_Ex_R1<-LNB_4B_Int_R1$Mg-LNB_4B_Amb_R1$Mg
K_Ex_R1<-LNB_4B_Int_R1$K-LNB_4B_Amb_R1$K
N_Ex_R1<-LNB_4B_Int_R1$N-LNB_4B_Amb_R1$N
SO4_Ex_R1<-LNB_4B_Int_R1$SO4-LNB_4B_Amb_R1$SO4
P_Ex_R1<-LNB_4B_Int_R1$P-LNB_4B_Amb_R1$P



LNB_4B_EX_R1<-cbind(Ca_Ex_R1, Mg_Ex_R1, K_Ex_R1, N_Ex_R1, SO4_Ex_R1, P_Ex_R1)

LNB_4B_EX_R1<-as.data.frame(LNB_4B_EX_R1) %>% mutate(Site="LNB", Harvest="40BO")

LNB_4B_EX<-cbind(Ca_Ex, Mg_Ex, K_Ex, N_Ex, SO4_Ex, P_Ex)

LNB_4B_EX<-as.data.frame(LNB_4B_EX) %>% mutate(Site="LNB", Harvest="40BO")


L8_LNB_4W_Ambient_R1_Null<-L8_LNB_4W_Ambient %>% subset(!YEAR %in% Years_R1_40)

LNB_4W_Amb_R1_Null<-L8_LNB_4W_Ambient_R1_Null %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 WTH", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/32, Mg=Mg*10/32, K=K*10/32, 
                                                             N=(NO3+NH4)*10/32, SO4=SO4*10/32,
                                                             P=P*10/32)

L8_LNB_4W_Ambient_R1<-Leaching_8_LNB4W %>% subset(YEAR %in% Years_R1_40)

LNB_4W_Amb_R1<-L8_LNB_4W_Ambient_R1%>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 WTH", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/21, Mg=Mg*10/21, K=K*10/21, 
                                                             N=(NO3+NH4)*10/21, SO4=SO4*10/21,
                                                             P=P*10/21)

LNB_4W_Int_R1<-Leaching_8_LNB4W %>% subset(YEAR %in% Years_R1_40_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


LNB_4W_Int_R1_Null<- Leaching_8_LNB4W %>% subset(YEAR %in% Years_40) %>%
  mutate(N=NO3+NH4)


LNB_4W_Int_R1_Null<-LNB_4W_Int_R1_Null %>% subset(!YEAR %in% Years_R1_40_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


Ca_Ex<-LNB_4W_Int_R1_Null$Ca-LNB_4W_Amb_R1_Null$Ca+LNB_4W_Int_R1$Ca-LNB_4W_Amb_R1$Ca
Mg_Ex<-LNB_4W_Int_R1_Null$Mg-LNB_4W_Amb_R1_Null$Mg+LNB_4W_Int_R1$Mg-LNB_4W_Amb_R1$Mg
K_Ex<-LNB_4W_Int_R1_Null$K-LNB_4W_Amb_R1_Null$K+LNB_4W_Int_R1$K-LNB_4W_Amb_R1$K
N_Ex<-LNB_4W_Int_R1_Null$N-LNB_4W_Amb_R1_Null$N+LNB_4W_Int_R1$N-LNB_4W_Amb_R1$N
SO4_Ex<-LNB_4W_Int_R1_Null$SO4-LNB_4W_Amb_R1_Null$SO4+LNB_4W_Int_R1$SO4-LNB_4W_Amb_R1$SO4
P_Ex<-LNB_4W_Int_R1_Null$P-LNB_4W_Amb_R1_Null$P+LNB_4W_Int_R1$P-LNB_4W_Amb_R1$P

# R1 Alone

Ca_Ex_R1<-LNB_4W_Int_R1$Ca-LNB_4W_Amb_R1$Ca
Mg_Ex_R1<-LNB_4W_Int_R1$Mg-LNB_4W_Amb_R1$Mg
K_Ex_R1<-LNB_4W_Int_R1$K-LNB_4W_Amb_R1$K
N_Ex_R1<-LNB_4W_Int_R1$N-LNB_4W_Amb_R1$N
SO4_Ex_R1<-LNB_4W_Int_R1$SO4-LNB_4W_Amb_R1$SO4
P_Ex_R1<-LNB_4W_Int_R1$P-LNB_4W_Amb_R1$P



LNB_4W_EX_R1<-cbind(Ca_Ex_R1, Mg_Ex_R1, K_Ex_R1, N_Ex_R1, SO4_Ex_R1, P_Ex_R1)

LNB_4W_EX_R1<-as.data.frame(LNB_4W_EX_R1) %>% mutate(Site="LNB", Harvest="40WTH")

LNB_4W_EX<-cbind(Ca_Ex, Mg_Ex, K_Ex, N_Ex, SO4_Ex, P_Ex)

LNB_4W_EX<-as.data.frame(LNB_4W_EX) %>% mutate(Site="LNB", Harvest="40WTH")




# 80BO

L8_LNB_8B_Ambient<-Leaching_8_LNB8B %>% subset(!YEAR %in% Years_80)

Ambient_LNB_8B<-L8_LNB_8B_Ambient  %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Ambient")

L8_LNB_8B_Inter<-Leaching_8_LNB8B %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Inter_Harvest")

Interm_LNB_8B<-L8_LNB_8B_Inter %>% ungroup() %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))%>% 
  mutate(Harvest="80 BO", Loss_Type="Inter_Harvest")

L8_LNB_8B_Ambient_R1_Null<-L8_LNB_8B_Ambient %>% subset(!YEAR %in% Years_R1_80)

L8_LNB_8B_Ambient_R1_Null<-L8_LNB_8B_Ambient_R1_Null %>% subset(!YEAR %in% Years_80_Tail)

L8_LNB_8B_Ambient_R1_Null_TAIL<-L8_LNB_8B_Ambient %>% subset(YEAR %in% Years_80_Tail)

LNB_8B_Amb_R1_Null<-L8_LNB_8B_Ambient_R1_Null %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/72, Mg=Mg*10/72, K=K*10/72, 
                                                             N=(NO3+NH4)*10/72, SO4=SO4*10/72,
                                                             P=P*10/72)

LNB_8B_TAIL<- L8_LNB_8B_Ambient_R1_Null_TAIL %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/21, Mg=Mg*10/21, K=K*10/21, 
                                                             N=(NO3+NH4)*10/21, SO4=SO4*10/21,
                                                             P=P*10/21)


L8_LNB_8B_Ambient_R1<-Leaching_8_LNB8B %>% subset(YEAR %in% Years_R1_80)

LNB_8B_Amb_R1<-L8_LNB_8B_Ambient_R1%>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/61, Mg=Mg*10/61, K=K*10/61, 
                                                             N=(NO3+NH4)*10/61, SO4=SO4*10/61,
                                                             P=P*10/61)

LNB_8B_Int_R1<-Leaching_8_LNB8B %>% subset(YEAR %in% Years_R1_80_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


LNB_8B_Int_R1_Null<- Leaching_8_LNB8B %>% subset(YEAR %in% Years_80) %>%
  mutate(N=NO3+NH4)


LNB_8B_Int_R1_Null<-LNB_8B_Int_R1_Null %>% subset(!YEAR %in% Years_R1_80_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


Ca_Ex<-LNB_8B_Int_R1_Null$Ca-LNB_8B_Amb_R1_Null$Ca+LNB_8B_Int_R1$Ca-LNB_8B_Amb_R1$Ca-LNB_8B_TAIL$Ca
Mg_Ex<-LNB_8B_Int_R1_Null$Mg-LNB_8B_Amb_R1_Null$Mg+LNB_8B_Int_R1$Mg-LNB_8B_Amb_R1$Mg-LNB_8B_TAIL$Mg
K_Ex<-LNB_8B_Int_R1_Null$K-LNB_8B_Amb_R1_Null$K+LNB_8B_Int_R1$K-LNB_8B_Amb_R1$K-LNB_8B_TAIL$K
N_Ex<-LNB_8B_Int_R1_Null$N-LNB_8B_Amb_R1_Null$N+LNB_8B_Int_R1$N-LNB_8B_Amb_R1$N-LNB_8B_TAIL$N
SO4_Ex<-LNB_8B_Int_R1_Null$SO4-LNB_8B_Amb_R1_Null$SO4+LNB_8B_Int_R1$SO4-LNB_8B_Amb_R1$SO4-LNB_8B_TAIL$SO4
P_Ex<-LNB_8B_Int_R1_Null$P-LNB_8B_Amb_R1_Null$P+LNB_8B_Int_R1$P-LNB_8B_Amb_R1$P-LNB_8B_TAIL$P

# R1 Alone

Ca_Ex_R1<-LNB_8B_Int_R1$Ca-LNB_8B_Amb_R1$Ca
Mg_Ex_R1<-LNB_8B_Int_R1$Mg-LNB_8B_Amb_R1$Mg
K_Ex_R1<-LNB_8B_Int_R1$K-LNB_8B_Amb_R1$K
N_Ex_R1<-LNB_8B_Int_R1$N-LNB_8B_Amb_R1$N
SO4_Ex_R1<-LNB_8B_Int_R1$SO4-LNB_8B_Amb_R1$SO4
P_Ex_R1<-LNB_8B_Int_R1$P-LNB_8B_Amb_R1$P



LNB_8B_EX_R1<-cbind(Ca_Ex_R1, Mg_Ex_R1, K_Ex_R1, N_Ex_R1, SO4_Ex_R1, P_Ex_R1)

LNB_8B_EX_R1<-as.data.frame(LNB_8B_EX_R1) %>% mutate(Site="LNB", Harvest="80BO")

LNB_8B_EX<-cbind(Ca_Ex, Mg_Ex, K_Ex, N_Ex, SO4_Ex, P_Ex)

LNB_8B_EX<-as.data.frame(LNB_8B_EX) %>% mutate(Site="LNB", Harvest="80BO")




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

L8_LNB_8W_Ambient_R1_Null<-L8_LNB_8W_Ambient %>% subset(!YEAR %in% Years_R1_80)

L8_LNB_8W_Ambient_R1_Null<-L8_LNB_8W_Ambient_R1_Null %>% subset(!YEAR %in% Years_80_Tail)

L8_LNB_8W_Ambient_R1_Null_TAIL<-L8_LNB_8W_Ambient %>% subset(YEAR %in% Years_80_Tail)

LNB_8W_Amb_R1_Null<-L8_LNB_8W_Ambient_R1_Null %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 WTH", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/72, Mg=Mg*10/72, K=K*10/72, 
                                                              N=(NO3+NH4)*10/72, SO4=SO4*10/72,
                                                              P=P*10/72)

LNB_8W_TAIL<- L8_LNB_8W_Ambient_R1_Null_TAIL %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 WTH", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/21, Mg=Mg*10/21, K=K*10/21, 
                                                              N=(NO3+NH4)*10/21, SO4=SO4*10/21,
                                                              P=P*10/21)


L8_LNB_8W_Ambient_R1<-Leaching_8_LNB8W %>% subset(YEAR %in% Years_R1_80)

LNB_8W_Amb_R1<-L8_LNB_8W_Ambient_R1%>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 WTH", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/61, Mg=Mg*10/61, K=K*10/61, 
                                                              N=(NO3+NH4)*10/61, SO4=SO4*10/61,
                                                              P=P*10/61)

LNB_8W_Int_R1<-Leaching_8_LNB8W %>% subset(YEAR %in% Years_R1_80_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


LNB_8W_Int_R1_Null<- Leaching_8_LNB8W %>% subset(YEAR %in% Years_80) %>%
  mutate(N=NO3+NH4)


LNB_8W_Int_R1_Null<-LNB_8W_Int_R1_Null %>% subset(!YEAR %in% Years_R1_80_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


Ca_Ex<-LNB_8W_Int_R1_Null$Ca-LNB_8W_Amb_R1_Null$Ca+LNB_8W_Int_R1$Ca-LNB_8W_Amb_R1$Ca-LNB_8W_TAIL$Ca
Mg_Ex<-LNB_8W_Int_R1_Null$Mg-LNB_8W_Amb_R1_Null$Mg+LNB_8W_Int_R1$Mg-LNB_8W_Amb_R1$Mg-LNB_8W_TAIL$Mg
K_Ex<-LNB_8W_Int_R1_Null$K-LNB_8W_Amb_R1_Null$K+LNB_8W_Int_R1$K-LNB_8W_Amb_R1$K-LNB_8W_TAIL$K
N_Ex<-LNB_8W_Int_R1_Null$N-LNB_8W_Amb_R1_Null$N+LNB_8W_Int_R1$N-LNB_8W_Amb_R1$N-LNB_8W_TAIL$N
SO4_Ex<-LNB_8W_Int_R1_Null$SO4-LNB_8W_Amb_R1_Null$SO4+LNB_8W_Int_R1$SO4-LNB_8W_Amb_R1$SO4-LNB_8W_TAIL$SO4
P_Ex<-LNB_8W_Int_R1_Null$P-LNB_8W_Amb_R1_Null$P+LNB_8W_Int_R1$P-LNB_8W_Amb_R1$P-LNB_8W_TAIL$P

# R1 Alone

Ca_Ex_R1<-LNB_8W_Int_R1$Ca-LNB_8W_Amb_R1$Ca
Mg_Ex_R1<-LNB_8W_Int_R1$Mg-LNB_8W_Amb_R1$Mg
K_Ex_R1<-LNB_8W_Int_R1$K-LNB_8W_Amb_R1$K
N_Ex_R1<-LNB_8W_Int_R1$N-LNB_8W_Amb_R1$N
SO4_Ex_R1<-LNB_8W_Int_R1$SO4-LNB_8W_Amb_R1$SO4
P_Ex_R1<-LNB_8W_Int_R1$P-LNB_8W_Amb_R1$P



LNB_8W_EX_R1<-cbind(Ca_Ex_R1, Mg_Ex_R1, K_Ex_R1, N_Ex_R1, SO4_Ex_R1, P_Ex_R1)

LNB_8W_EX_R1<-as.data.frame(LNB_8W_EX_R1) %>% mutate(Site="LNB", Harvest="80WTH")

LNB_8W_EX<-cbind(Ca_Ex, Mg_Ex, K_Ex, N_Ex, SO4_Ex, P_Ex)

LNB_8W_EX<-as.data.frame(LNB_8W_EX) %>% mutate(Site="LNB", Harvest="80WTH")


LNB_Bound<-rbind(L8_LNB_4B, L8_LNB_4W, L8_LNB_8B, L8_LNB_8W)

LNB_Bound_Harvest<-rbind(L8_LNB_4B_Inter, L8_LNB_4W_Inter, L8_LNB_8B_Inter, L8_LNB_8W_Inter)

LNB_Comp_Bound<-rbind(Ambient_LNB_4B, Interm_LNB_4B ,Ambient_LNB_4W, Interm_LNB_4W,Ambient_LNB_8B, Interm_LNB_8B,Ambient_LNB_8W, Interm_LNB_8W)

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

L8_HNB_8B_Inter<-Leaching_8_HNB8B %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% 
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


# HNB Extra


L8_HNB_4B_Ambient_R1_Null<-L8_HNB_4B_Ambient %>% subset(!YEAR %in% Years_R1_40)

HNB_4B_Amb_R1_Null<-L8_HNB_4B_Ambient_R1_Null %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 BO", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/32, Mg=Mg*10/32, K=K*10/32, 
                                                             N=(NO3+NH4)*10/32, SO4=SO4*10/32,
                                                             P=P*10/32)

L8_HNB_4B_Ambient_R1<-Leaching_8_HNB4B %>% subset(YEAR %in% Years_R1_40)

HNB_4B_Amb_R1<-L8_HNB_4B_Ambient_R1%>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 BO", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/21, Mg=Mg*10/21, K=K*10/21, 
                                                             N=(NO3+NH4)*10/21, SO4=SO4*10/21,
                                                             P=P*10/21)

HNB_4B_Int_R1<-Leaching_8_HNB4B %>% subset(YEAR %in% Years_R1_40_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


HNB_4B_Int_R1_Null<- Leaching_8_HNB4B %>% subset(YEAR %in% Years_40) %>%
  mutate(N=NO3+NH4)


HNB_4B_Int_R1_Null<-HNB_4B_Int_R1_Null %>% subset(!YEAR %in% Years_R1_40_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


Ca_Ex<-HNB_4B_Int_R1_Null$Ca-HNB_4B_Amb_R1_Null$Ca+HNB_4B_Int_R1$Ca-HNB_4B_Amb_R1$Ca
Mg_Ex<-HNB_4B_Int_R1_Null$Mg-HNB_4B_Amb_R1_Null$Mg+HNB_4B_Int_R1$Mg-HNB_4B_Amb_R1$Mg
K_Ex<-HNB_4B_Int_R1_Null$K-HNB_4B_Amb_R1_Null$K+HNB_4B_Int_R1$K-HNB_4B_Amb_R1$K
N_Ex<-HNB_4B_Int_R1_Null$N-HNB_4B_Amb_R1_Null$N+HNB_4B_Int_R1$N-HNB_4B_Amb_R1$N
SO4_Ex<-HNB_4B_Int_R1_Null$SO4-HNB_4B_Amb_R1_Null$SO4+HNB_4B_Int_R1$SO4-HNB_4B_Amb_R1$SO4
P_Ex<-HNB_4B_Int_R1_Null$P-HNB_4B_Amb_R1_Null$P+HNB_4B_Int_R1$P-HNB_4B_Amb_R1$P


# R1 Alone

Ca_Ex_R1<-HNB_4B_Int_R1$Ca-HNB_4B_Amb_R1$Ca
Mg_Ex_R1<-HNB_4B_Int_R1$Mg-HNB_4B_Amb_R1$Mg
K_Ex_R1<-HNB_4B_Int_R1$K-HNB_4B_Amb_R1$K
N_Ex_R1<-HNB_4B_Int_R1$N-HNB_4B_Amb_R1$N
SO4_Ex_R1<-HNB_4B_Int_R1$SO4-HNB_4B_Amb_R1$SO4
P_Ex_R1<-HNB_4B_Int_R1$P-HNB_4B_Amb_R1$P



HNB_4B_EX_R1<-cbind(Ca_Ex_R1, Mg_Ex_R1, K_Ex_R1, N_Ex_R1, SO4_Ex_R1, P_Ex_R1)

HNB_4B_EX_R1<-as.data.frame(HNB_4B_EX_R1) %>% mutate(Site="HNB", Harvest="40BO")

HNB_4B_EX<-cbind(Ca_Ex, Mg_Ex, K_Ex, N_Ex, SO4_Ex, P_Ex)

HNB_4B_EX<-as.data.frame(HNB_4B_EX) %>% mutate(Site="HNB", Harvest="40BO")


L8_HNB_4W_Ambient_R1_Null<-L8_HNB_4W_Ambient %>% subset(!YEAR %in% Years_R1_40)

HNB_4W_Amb_R1_Null<-L8_HNB_4W_Ambient_R1_Null %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 WTH", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/32, Mg=Mg*10/32, K=K*10/32, 
                                                             N=(NO3+NH4)*10/32, SO4=SO4*10/32,
                                                             P=P*10/32)

L8_HNB_4W_Ambient_R1<-Leaching_8_HNB4W %>% subset(YEAR %in% Years_R1_40)

HNB_4W_Amb_R1<-L8_HNB_4W_Ambient_R1%>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="40 WTH", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/21, Mg=Mg*10/21, K=K*10/21, 
                                                             N=(NO3+NH4)*10/21, SO4=SO4*10/21,
                                                             P=P*10/21)

HNB_4W_Int_R1<-Leaching_8_HNB4W %>% subset(YEAR %in% Years_R1_40_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


HNB_4W_Int_R1_Null<- Leaching_8_HNB4W %>% subset(YEAR %in% Years_40) %>%
  mutate(N=NO3+NH4)


HNB_4W_Int_R1_Null<-HNB_4W_Int_R1_Null %>% subset(!YEAR %in% Years_R1_40_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


Ca_Ex<-HNB_4W_Int_R1_Null$Ca-HNB_4W_Amb_R1_Null$Ca+HNB_4W_Int_R1$Ca-HNB_4W_Amb_R1$Ca
Mg_Ex<-HNB_4W_Int_R1_Null$Mg-HNB_4W_Amb_R1_Null$Mg+HNB_4W_Int_R1$Mg-HNB_4W_Amb_R1$Mg
K_Ex<-HNB_4W_Int_R1_Null$K-HNB_4W_Amb_R1_Null$K+HNB_4W_Int_R1$K-HNB_4W_Amb_R1$K
N_Ex<-HNB_4W_Int_R1_Null$N-HNB_4W_Amb_R1_Null$N+HNB_4W_Int_R1$N-HNB_4W_Amb_R1$N
SO4_Ex<-HNB_4W_Int_R1_Null$SO4-HNB_4W_Amb_R1_Null$SO4+HNB_4W_Int_R1$SO4-HNB_4W_Amb_R1$SO4
P_Ex<-HNB_4W_Int_R1_Null$P-HNB_4W_Amb_R1_Null$P+HNB_4W_Int_R1$P-HNB_4W_Amb_R1$P


# R1 Alone

Ca_Ex_R1<-HNB_4W_Int_R1$Ca-HNB_4W_Amb_R1$Ca
Mg_Ex_R1<-HNB_4W_Int_R1$Mg-HNB_4W_Amb_R1$Mg
K_Ex_R1<-HNB_4W_Int_R1$K-HNB_4W_Amb_R1$K
N_Ex_R1<-HNB_4W_Int_R1$N-HNB_4W_Amb_R1$N
SO4_Ex_R1<-HNB_4W_Int_R1$SO4-HNB_4W_Amb_R1$SO4
P_Ex_R1<-HNB_4W_Int_R1$P-HNB_4W_Amb_R1$P



HNB_4W_EX_R1<-cbind(Ca_Ex_R1, Mg_Ex_R1, K_Ex_R1, N_Ex_R1, SO4_Ex_R1, P_Ex_R1)

HNB_4W_EX_R1<-as.data.frame(HNB_4W_EX_R1) %>% mutate(Site="HNB", Harvest="40WTH")

HNB_4W_EX<-cbind(Ca_Ex, Mg_Ex, K_Ex, N_Ex, SO4_Ex, P_Ex)

HNB_4W_EX<-as.data.frame(HNB_4W_EX) %>% mutate(Site="HNB", Harvest="40WTH")



# 80BO

L8_HNB_8B_Ambient<-Leaching_8_HNB8B %>% subset(!YEAR %in% Years_80)

Ambient_HNB_8B<-L8_HNB_8B_Ambient  %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Ambient")

L8_HNB_8B_Inter<-Leaching_8_HNB8B %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Inter_Harvest")

Interm_HNB_8B<-L8_HNB_8B_Inter %>% ungroup() %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))%>% 
  mutate(Harvest="80 BO", Loss_Type="Inter_Harvest")

L8_HNB_8B_Ambient_R1_Null<-L8_HNB_8B_Ambient %>% subset(!YEAR %in% Years_R1_80)

L8_HNB_8B_Ambient_R1_Null<-L8_HNB_8B_Ambient_R1_Null %>% subset(!YEAR %in% Years_80_Tail)

L8_HNB_8B_Ambient_R1_Null_TAIL<-L8_HNB_8B_Ambient %>% subset(YEAR %in% Years_80_Tail)

HNB_8B_Amb_R1_Null<-L8_HNB_8B_Ambient_R1_Null %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/72, Mg=Mg*10/72, K=K*10/72, 
                                                             N=(NO3+NH4)*10/72, SO4=SO4*10/72,
                                                             P=P*10/72)

HNB_8B_TAIL<- L8_HNB_8B_Ambient_R1_Null_TAIL %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/21, Mg=Mg*10/21, K=K*10/21, 
                                                             N=(NO3+NH4)*10/21, SO4=SO4*10/21,
                                                             P=P*10/21)


L8_HNB_8B_Ambient_R1<-Leaching_8_HNB8B %>% subset(YEAR %in% Years_R1_80)

HNB_8B_Amb_R1<-L8_HNB_8B_Ambient_R1%>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 BO", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/61, Mg=Mg*10/61, K=K*10/61, 
                                                             N=(NO3+NH4)*10/61, SO4=SO4*10/61,
                                                             P=P*10/61)

HNB_8B_Int_R1<-Leaching_8_HNB8B %>% subset(YEAR %in% Years_R1_80_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


HNB_8B_Int_R1_Null<- Leaching_8_HNB8B %>% subset(YEAR %in% Years_80) %>%
  mutate(N=NO3+NH4)


HNB_8B_Int_R1_Null<-HNB_8B_Int_R1_Null %>% subset(!YEAR %in% Years_R1_80_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


Ca_Ex<-HNB_8B_Int_R1_Null$Ca-HNB_8B_Amb_R1_Null$Ca+HNB_8B_Int_R1$Ca-HNB_8B_Amb_R1$Ca-HNB_8B_TAIL$Ca
Mg_Ex<-HNB_8B_Int_R1_Null$Mg-HNB_8B_Amb_R1_Null$Mg+HNB_8B_Int_R1$Mg-HNB_8B_Amb_R1$Mg-HNB_8B_TAIL$Mg
K_Ex<-HNB_8B_Int_R1_Null$K-HNB_8B_Amb_R1_Null$K+HNB_8B_Int_R1$K-HNB_8B_Amb_R1$K-HNB_8B_TAIL$K
N_Ex<-HNB_8B_Int_R1_Null$N-HNB_8B_Amb_R1_Null$N+HNB_8B_Int_R1$N-HNB_8B_Amb_R1$N-HNB_8B_TAIL$N
SO4_Ex<-HNB_8B_Int_R1_Null$SO4-HNB_8B_Amb_R1_Null$SO4+HNB_8B_Int_R1$SO4-HNB_8B_Amb_R1$SO4-HNB_8B_TAIL$SO4
P_Ex<-HNB_8B_Int_R1_Null$P-HNB_8B_Amb_R1_Null$P+HNB_8B_Int_R1$P-HNB_8B_Amb_R1$P-HNB_8B_TAIL$P

# R1 Alone

Ca_Ex_R1<-HNB_8B_Int_R1$Ca-HNB_8B_Amb_R1$Ca
Mg_Ex_R1<-HNB_8B_Int_R1$Mg-HNB_8B_Amb_R1$Mg
K_Ex_R1<-HNB_8B_Int_R1$K-HNB_8B_Amb_R1$K
N_Ex_R1<-HNB_8B_Int_R1$N-HNB_8B_Amb_R1$N
SO4_Ex_R1<-HNB_8B_Int_R1$SO4-HNB_8B_Amb_R1$SO4
P_Ex_R1<-HNB_8B_Int_R1$P-HNB_8B_Amb_R1$P



HNB_8B_EX_R1<-cbind(Ca_Ex_R1, Mg_Ex_R1, K_Ex_R1, N_Ex_R1, SO4_Ex_R1, P_Ex_R1)

HNB_8B_EX_R1<-as.data.frame(HNB_8B_EX_R1) %>% mutate(Site="HNB", Harvest="80BO")

HNB_8B_EX<-cbind(Ca_Ex, Mg_Ex, K_Ex, N_Ex, SO4_Ex, P_Ex)

HNB_8B_EX<-as.data.frame(HNB_8B_EX) %>% mutate(Site="HNB", Harvest="80BO")




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

L8_HNB_8W_Ambient_R1_Null<-L8_HNB_8W_Ambient %>% subset(!YEAR %in% Years_R1_80)

L8_HNB_8W_Ambient_R1_Null<-L8_HNB_8W_Ambient_R1_Null %>% subset(!YEAR %in% Years_80_Tail)

L8_HNB_8W_Ambient_R1_Null_TAIL<-L8_HNB_8W_Ambient %>% subset(YEAR %in% Years_80_Tail)

HNB_8W_Amb_R1_Null<-L8_HNB_8W_Ambient_R1_Null %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 WTH", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/72, Mg=Mg*10/72, K=K*10/72, 
                                                              N=(NO3+NH4)*10/72, SO4=SO4*10/72,
                                                              P=P*10/72)

HNB_8W_TAIL<- L8_HNB_8W_Ambient_R1_Null_TAIL %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 WTH", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/21, Mg=Mg*10/21, K=K*10/21, 
                                                              N=(NO3+NH4)*10/21, SO4=SO4*10/21,
                                                              P=P*10/21)


L8_HNB_8W_Ambient_R1<-Leaching_8_HNB8W %>% subset(YEAR %in% Years_R1_80)

HNB_8W_Amb_R1<-L8_HNB_8W_Ambient_R1%>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Harvest="80 WTH", Loss_Type="Ambient_R1") %>% mutate(Ca=Ca*10/61, Mg=Mg*10/61, K=K*10/61, 
                                                              N=(NO3+NH4)*10/61, SO4=SO4*10/61,
                                                              P=P*10/61)

HNB_8W_Int_R1<-Leaching_8_HNB8W %>% subset(YEAR %in% Years_R1_80_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


HNB_8W_Int_R1_Null<- Leaching_8_HNB8W %>% subset(YEAR %in% Years_80) %>%
  mutate(N=NO3+NH4)


HNB_8W_Int_R1_Null<-HNB_8W_Int_R1_Null %>% subset(!YEAR %in% Years_R1_80_INT) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  mutate(N=NO3+NH4)


Ca_Ex<-HNB_8W_Int_R1_Null$Ca-HNB_8W_Amb_R1_Null$Ca+HNB_8W_Int_R1$Ca-HNB_8W_Amb_R1$Ca-HNB_8W_TAIL$Ca
Mg_Ex<-HNB_8W_Int_R1_Null$Mg-HNB_8W_Amb_R1_Null$Mg+HNB_8W_Int_R1$Mg-HNB_8W_Amb_R1$Mg-HNB_8W_TAIL$Mg
K_Ex<-HNB_8W_Int_R1_Null$K-HNB_8W_Amb_R1_Null$K+HNB_8W_Int_R1$K-HNB_8W_Amb_R1$K-HNB_8W_TAIL$K
N_Ex<-HNB_8W_Int_R1_Null$N-HNB_8W_Amb_R1_Null$N+HNB_8W_Int_R1$N-HNB_8W_Amb_R1$N-HNB_8W_TAIL$N
SO4_Ex<-HNB_8W_Int_R1_Null$SO4-HNB_8W_Amb_R1_Null$SO4+HNB_8W_Int_R1$SO4-HNB_8W_Amb_R1$SO4-HNB_8W_TAIL$SO4
P_Ex<-HNB_8W_Int_R1_Null$P-HNB_8W_Amb_R1_Null$P+HNB_8W_Int_R1$P-HNB_8W_Amb_R1$P-HNB_8W_TAIL$P

# R1 Alone

Ca_Ex_R1<-HNB_8W_Int_R1$Ca-HNB_8W_Amb_R1$Ca
Mg_Ex_R1<-HNB_8W_Int_R1$Mg-HNB_8W_Amb_R1$Mg
K_Ex_R1<-HNB_8W_Int_R1$K-HNB_8W_Amb_R1$K
N_Ex_R1<-HNB_8W_Int_R1$N-HNB_8W_Amb_R1$N
SO4_Ex_R1<-HNB_8W_Int_R1$SO4-HNB_8W_Amb_R1$SO4
P_Ex_R1<-HNB_8W_Int_R1$P-HNB_8W_Amb_R1$P


HNB_8W_EX_R1<-cbind(Ca_Ex_R1, Mg_Ex_R1, K_Ex_R1, N_Ex_R1, SO4_Ex_R1, P_Ex_R1)

HNB_8W_EX_R1<-as.data.frame(HNB_8W_EX_R1) %>% mutate(Site="HNB", Harvest="80WTH")

HNB_8W_EX<-cbind(Ca_Ex, Mg_Ex, K_Ex, N_Ex, SO4_Ex, P_Ex)

HNB_8W_EX<-as.data.frame(HNB_8W_EX) %>% mutate(Site="HNB", Harvest="80WTH")




# BIND EX

Excess_Tbl<-rbind(LNS_4B_EX,LNS_4W_EX, LNS_8B_EX, LNS_8W_EX,
                  HNS_4B_EX,HNS_4W_EX, HNS_8B_EX, HNS_8W_EX,
                  LNB_4B_EX,LNB_4W_EX, LNB_8B_EX, LNB_8W_EX,
                  HNB_4B_EX,HNB_4W_EX, HNB_8B_EX, HNB_8W_EX)

Excess_Tbl_R1<-rbind(LNS_4B_EX_R1,LNS_4W_EX_R1, LNS_8B_EX_R1, LNS_8W_EX_R1,
                     HNS_4B_EX_R1,HNS_4W_EX_R1, HNS_8B_EX_R1, HNS_8W_EX_R1,
                     LNB_4B_EX_R1,LNB_4W_EX_R1, LNB_8B_EX_R1, LNB_8W_EX_R1,
                     HNB_4B_EX_R1,HNB_4W_EX_R1, HNB_8B_EX_R1, HNB_8W_EX_R1)

# BIND

HNB_Bound<-rbind(L8_HNB_4B, L8_HNB_4W, L8_HNB_8B, L8_HNB_8W)

HNB_Bound_Harvest<-rbind(L8_HNB_4B_Inter, L8_HNB_4W_Inter, L8_HNB_8B_Inter, L8_HNB_8W_Inter)

HNB_Comp_Bound<-rbind(Ambient_HNB_4B, Interm_HNB_4B ,Ambient_HNB_4W, Interm_HNB_4W,Ambient_HNB_8B, Interm_HNB_8B,Ambient_HNB_8W, Interm_HNB_8W)

HNB_Comp_Bound<-HNB_Comp_Bound%>% mutate(Site="HNB")

Tbl<-rbind(LNS_Comp_Bound, LNB_Comp_Bound, HNS_Comp_Bound, HNB_Comp_Bound)

write.csv(Excess_Tbl, "Excess_Table.csv")
write.csv(Tbl, "Rel_Loss_Table.csv")
write.csv(Excess_Tbl_R1, "Excess_Tbl_R1.csv")
