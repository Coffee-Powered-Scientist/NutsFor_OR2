
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


Years_40<-c(2025, 2026, 2027, 2028, 2029, 2030, 2031, 2032, 2033, 2034, 2035, 2036, 2037, 2038, 2039, 2040, 2067, 2068, 2069, 2070, 2071, 2072, 2073, 2074, 
            2075, 2076, 2077, 2078, 2079, 2080, 2081, 2082, 2109,	2110	,2111,	2112	,2113	,2114,	2115,	2116,	2117,	2118,	2119,	2120	,2121,	2122,	2123,	2124,
            2151,	2152,	2153,	2154,	2155,	2156,	2157,	2158,	2159,	2160,	2161,	2162,	2163,	2164,	2165,	2166,
            
            2193,	2194,	2195,	2196,	2197,	2198,	2199,	2200,	2201 ,2202,	2203,	2204,	2205,	2206,	2207,	2208,
            
            2235	,2236	,2237	,2238,	2239,	2240,	2241,	2242,	2243,	2244,	2245,	2246,	2247,	2248,	2249,	2250,
          
            2277	,2319,	2361,	2403,	2445	,2487	,2529	,2571	,2613,	2655	,2697	,2739,	2781,	2823,	2865,	2907,
            
            2361,	2362,	2363,	2364,	2365,	2366	,2367	,2368,	2369,	2370,	2371,	2372	,2373	,2374	,2375	,2376,
            
            2403,	2404,	2405,	2406,	2407	,2408	,2409,	2410,	2411,	2412	,2413	,2414	,2415,	2416,	2417,	2418,
            
            2445,	2446,	2447,	2448,	2449	,2450	,2451,	2452,	2453,	2454,	2455,	2456	,2457	,2458	,2459	,2460
            

)



Years_80<-c(2065,	2066,	2067,	2068,	2069,	2070,	2071,	2072,	2073,	2074,	2075,	2076,	2077,	2078,	2079,	2080,
            2147,	2148,	2149,	2150,	2151,	2152,	2153,	2154,	2155,	2156,	2157,	2158,	2159,	2160,	2161,	2162,
            2229,	2230,	2231,	2232,	2233,	2234,	2235,	2236,	2237,	2238,	2239,	2240,	2241,	2242,	2243,	2244,
            2311,	2312,	2313,	2314,	2315,	2316,	2317,	2318,	2319,	2320,	2321,	2322,	2323,	2324,	2325,	2326,
            2393,	2394,	2395,	2396,	2397,	2398,	2399,	2400,	2401,	2402,	2403,	2404,	2405,	2406,	2407,	2408,
            2475,	2476,	2477,	2478,	2479,	2480,	2481,	2482,	2483,	2484,	2485,	2486,	2487,	2488,	2489,	2490
)

# LNS

Leaching_Pre_LNS4B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNS4B<-Leaching_Pre_LNS4B %>% filter(group_id %in% 8)

L8_LNS_4B<-Leaching_8_LNS4B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

L8_LNS_4B_Inter<-Leaching_8_LNS4B %>% group_by(YEAR) %>% subset(YEAR %in% Years_40) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="40 BO")


Leaching_Pre_LNS8B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNS8B<-Leaching_Pre_LNS8B %>% filter(group_id %in% 8)

L8_LNS_8B<-Leaching_8_LNS8B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

L8_LNS_8B_Inter<-Leaching_8_LNS8B %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="80 BO")


Leaching_Pre_LNS4W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNS4W<-Leaching_Pre_LNS4W %>% filter(group_id %in% 8)

L8_LNS_4W<-Leaching_8_LNS4W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

L8_LNS_4W_Inter<-Leaching_8_LNS4W %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="40 WTH")


Leaching_Pre_LNS8W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNS8W<-Leaching_Pre_LNS8W %>% filter(group_id %in% 8)

L8_LNS_8W<-Leaching_8_LNS8W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

L8_LNS_8W_Inter<-Leaching_8_LNS8W %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="80 WTH")


L8_LNS_4B$Harvest<-"40 BO"
L8_LNS_8B$Harvest<-"80 BO"
L8_LNS_4W$Harvest<-"40 WTH"
L8_LNS_8W$Harvest<-"80 WTH"

LNS_Bound<-rbind(L8_LNS_4B, L8_LNS_4W, L8_LNS_8B, L8_LNS_8W)

LNS_Bound_Harvest<-rbind(L8_LNS_4B_Inter, L8_LNS_4W_Inter, L8_LNS_8B_Inter, L8_LNS_8W_Inter)

Ca_LNS_4W_lm <- lm(Ca ~ NO3, data = L8_LNS_4W)
Ca_LNS_8W_lm <- lm(Ca ~ NO3, data = L8_LNS_8W)
Ca_LNS_4B_lm <- lm(Ca ~ NO3, data = L8_LNS_4B)
Ca_LNS_8B_lm <- lm(Ca ~ NO3, data = L8_LNS_8B)


ggplot(LNS_Bound, aes(x=NO3, y=Ca, color=Harvest))+geom_point()+
  geom_abline(slope = coef(Ca_LNS_4B_lm)[[2]], intercept = coef(Ca_LNS_4B_lm)[[1]], color="red", linetype="dashed", size=1.2)+
  geom_abline(slope = coef(Ca_LNS_8B_lm)[[2]], intercept = coef(Ca_LNS_8B_lm)[[1]], color="blue", size=1.2)+
  geom_abline(slope = coef(Ca_LNS_4W_lm)[[2]], intercept = coef(Ca_LNS_4W_lm)[[1]], color="green",linetype="dashed" ,size=1.2)+
  geom_abline(slope = coef(Ca_LNS_8W_lm)[[2]], intercept = coef(Ca_LNS_8W_lm)[[1]], color="purple",  size=1.2)







Homo_gen_LNS<-LNS_Bound%>% anova_test(Ca ~ Harvest*NO3)

# HNS


Leaching_Pre_HNS4B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNS4B<-Leaching_Pre_HNS4B %>% filter(group_id %in% 8)

L8_HNS_4B<-Leaching_8_HNS4B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_HNS8B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNS8B<-Leaching_Pre_HNS8B %>% filter(group_id %in% 8)

L8_HNS_8B<-Leaching_8_HNS8B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_HNS4W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNS4W<-Leaching_Pre_HNS4W %>% filter(group_id %in% 8)

L8_HNS_4W<-Leaching_8_HNS4W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_HNS8W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNS8W<-Leaching_Pre_HNS8W %>% filter(group_id %in% 8)

L8_HNS_8W<-Leaching_8_HNS8W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

L8_HNS_4B_Inter<-Leaching_8_HNS4B %>% group_by(YEAR) %>% subset(YEAR %in% Years_40) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="40 BO")
L8_HNS_8B_Inter<-Leaching_8_HNS8B %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="80 BO")
L8_HNS_4W_Inter<-Leaching_8_HNS4W %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="40 WTH")
L8_HNS_8W_Inter<-Leaching_8_HNS8W %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="80 WTH")


L8_HNS_4B$Harvest<-"40 BO"
L8_HNS_8B$Harvest<-"80 BO"
L8_HNS_4W$Harvest<-"40 WTH"
L8_HNS_8W$Harvest<-"80 WTH"

HNS_Bound<-rbind(L8_HNS_4B, L8_HNS_4W, L8_HNS_8B, L8_HNS_8W)

HNS_Bound_Harvest<-rbind(L8_HNS_4B_Inter, L8_HNS_4W_Inter, L8_HNS_8B_Inter, L8_HNS_8W_Inter)

Ca_HNS_4W_lm <- lm(Ca ~ NO3, data = L8_HNS_4W)
Ca_HNS_8W_lm <- lm(Ca ~ NO3, data = L8_HNS_8W)
Ca_HNS_4B_lm <- lm(Ca ~ NO3, data = L8_HNS_4B)
Ca_HNS_8B_lm <- lm(Ca ~ NO3, data = L8_HNS_8B)


ggplot(HNS_Bound, aes(x=NO3, y=Ca, color=Harvest))+geom_point()+
  geom_abline(slope = coef(Ca_HNS_4B_lm)[[2]], intercept = coef(Ca_HNS_4B_lm)[[1]], color="red", linetype="dashed", size=1.2)+
  geom_abline(slope = coef(Ca_HNS_8B_lm)[[2]], intercept = coef(Ca_HNS_8B_lm)[[1]], color="blue", size=1.2)+
  geom_abline(slope = coef(Ca_HNS_4W_lm)[[2]], intercept = coef(Ca_HNS_4W_lm)[[1]], color="green",linetype="dashed" ,size=1.2)+
  geom_abline(slope = coef(Ca_HNS_8W_lm)[[2]], intercept = coef(Ca_HNS_8W_lm)[[1]], color="purple",  size=1.2)



Homo_gen_HNS<-HNS_Bound%>% anova_test(Ca ~ Harvest*NO3)


#Basalt

Leaching_Pre_LNB4B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNB4B<-Leaching_Pre_LNB4B %>% filter(group_id %in% 8)

L8_LNB_4B<-Leaching_8_LNB4B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_LNB8B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNB8B<-Leaching_Pre_LNB8B %>% filter(group_id %in% 8)

L8_LNB_8B<-Leaching_8_LNB8B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_LNB4W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNB4W<-Leaching_Pre_LNB4W %>% filter(group_id %in% 8)

L8_LNB_4W<-Leaching_8_LNB4W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_LNB8W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNB8W<-Leaching_Pre_LNB8W %>% filter(group_id %in% 8)

L8_LNB_8W<-Leaching_8_LNB8W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


L8_LNB_4B_Inter<-Leaching_8_LNB4B %>% group_by(YEAR) %>% subset(YEAR %in% Years_40) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="40 BO")
L8_LNB_8B_Inter<-Leaching_8_LNB8B %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="80 BO")
L8_LNB_4W_Inter<-Leaching_8_LNB4W %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="40 WTH")
L8_LNB_8W_Inter<-Leaching_8_LNB8W %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="80 WTH")


L8_LNB_4B$Harvest<-"40 BO"
L8_LNB_8B$Harvest<-"80 BO"
L8_LNB_4W$Harvest<-"40 WTH"
L8_LNB_8W$Harvest<-"80 WTH"

LNB_Bound<-rbind(L8_LNB_4B, L8_LNB_4W, L8_LNB_8B, L8_LNB_8W)

LNB_Bound_Harvest<-rbind(L8_LNB_4B_Inter, L8_LNB_4W_Inter, L8_LNB_8B_Inter, L8_LNB_8W_Inter)

Ca_LNB_4W_lm <- lm(Ca ~ NO3, data = L8_LNB_4W)
Ca_LNB_8W_lm <- lm(Ca ~ NO3, data = L8_LNB_8W)
Ca_LNB_4B_lm <- lm(Ca ~ NO3, data = L8_LNB_4B)
Ca_LNB_8B_lm <- lm(Ca ~ NO3, data = L8_LNB_8B)


ggplot(LNB_Bound, aes(x=NO3, y=Ca, color=Harvest))+geom_point()+
  geom_abline(slope = coef(Ca_LNB_4B_lm)[[2]], intercept = coef(Ca_LNB_4B_lm)[[1]], color="red", linetype="dashed", size=1.2)+
  geom_abline(slope = coef(Ca_LNB_8B_lm)[[2]], intercept = coef(Ca_LNB_8B_lm)[[1]], color="blue", size=1.2)+
  geom_abline(slope = coef(Ca_LNB_4W_lm)[[2]], intercept = coef(Ca_LNB_4W_lm)[[1]], color="green",linetype="dashed" ,size=1.2)+
  geom_abline(slope = coef(Ca_LNB_8W_lm)[[2]], intercept = coef(Ca_LNB_8W_lm)[[1]], color="purple",  size=1.2)



Homo_gen_LNB<-LNB_Bound%>% anova_test(Ca ~ Harvest*NO3)

# HNB


Leaching_Pre_HNB4B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNB4B<-Leaching_Pre_HNB4B %>% filter(group_id %in% 8)

L8_HNB_4B<-Leaching_8_HNB4B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_HNB8B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNB8B<-Leaching_Pre_HNB8B %>% filter(group_id %in% 8)

L8_HNB_8B<-Leaching_8_HNB8B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_HNB4W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNB4W<-Leaching_Pre_HNB4W %>% filter(group_id %in% 8)

L8_HNB_4W<-Leaching_8_HNB4W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_HNB8W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNB8W<-Leaching_Pre_HNB8W %>% filter(group_id %in% 8)

L8_HNB_8W<-Leaching_8_HNB8W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))




L8_HNB_4B_Inter<-Leaching_8_HNB4B %>% group_by(YEAR) %>% subset(YEAR %in% Years_40) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="40 BO")
L8_HNB_8B_Inter<-Leaching_8_HNB8B %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="80 BO")
L8_HNB_4W_Inter<-Leaching_8_HNB4W %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="40 WTH")
L8_HNB_8W_Inter<-Leaching_8_HNB8W %>% group_by(YEAR) %>% subset(YEAR %in% Years_80) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>% mutate(Harvest="80 WTH")


L8_HNB_4B$Harvest<-"40 BO"
L8_HNB_8B$Harvest<-"80 BO"
L8_HNB_4W$Harvest<-"40 WTH"
L8_HNB_8W$Harvest<-"80 WTH"

HNB_Bound<-rbind(L8_HNB_4B, L8_HNB_4W, L8_HNB_8B, L8_HNB_8W)

HNB_Bound_Harvest<-rbind(L8_HNB_4B_Inter, L8_HNB_4W_Inter, L8_HNB_8B_Inter, L8_HNB_8W_Inter)

Ca_HNB_4W_lm <- lm(Ca ~ NO3, data = L8_HNB_4W)
Ca_HNB_8W_lm <- lm(Ca ~ NO3, data = L8_HNB_8W)
Ca_HNB_4B_lm <- lm(Ca ~ NO3, data = L8_HNB_4B)
Ca_HNB_8B_lm <- lm(Ca ~ NO3, data = L8_HNB_8B)


LNS<-ggplot(LNS_Bound, aes(x=NO3, y=Ca, color=Harvest))+geom_point()+
  geom_abline(slope = coef(Ca_LNS_4B_lm)[[2]], intercept = coef(Ca_LNS_4B_lm)[[1]], color="red", linetype="dashed", size=1.2)+
  geom_abline(slope = coef(Ca_LNS_8B_lm)[[2]], intercept = coef(Ca_LNS_8B_lm)[[1]], color="blue", size=1.2)+
  geom_abline(slope = coef(Ca_LNS_4W_lm)[[2]], intercept = coef(Ca_LNS_4W_lm)[[1]], color="green",linetype="dashed" ,size=1.2)+
  geom_abline(slope = coef(Ca_LNS_8W_lm)[[2]], intercept = coef(Ca_LNS_8W_lm)[[1]], color="purple",  size=1.2)+
  geom_point(LNS_Bound_Harvest, mapping = aes(x=NO3, y=Ca, color=Harvest, shape=Harvest), size=3)+
  theme_classic2()+
  scale_x_continuous(expand = c(0, 0), limits = c(0, 15), breaks=c(0, 5, 10, 15)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 15), breaks=c(0, 5, 10, 15))+
  labs(x=NULL,y=NULL, title="Low N Sedimentary")+
  theme(plot.title = element_text(hjust = 0.5))



HNS<-ggplot(HNS_Bound, aes(x=NO3, y=Ca, color=Harvest))+geom_point()+
  geom_abline(slope = coef(Ca_HNS_4B_lm)[[2]], intercept = coef(Ca_HNS_4B_lm)[[1]], color="red", linetype="dashed", size=1.2)+
  geom_abline(slope = coef(Ca_HNS_8B_lm)[[2]], intercept = coef(Ca_HNS_8B_lm)[[1]], color="blue", size=1.2)+
  geom_abline(slope = coef(Ca_HNS_4W_lm)[[2]], intercept = coef(Ca_HNS_4W_lm)[[1]], color="green",linetype="dashed" ,size=1.2)+
  geom_abline(slope = coef(Ca_HNS_8W_lm)[[2]], intercept = coef(Ca_HNS_8W_lm)[[1]], color="purple",  size=1.2)+
  geom_point(HNS_Bound_Harvest, mapping = aes(x=NO3, y=Ca, color=Harvest, shape=Harvest), size=3)+
  theme_classic2()+
  scale_x_continuous(expand = c(0, 0), limits = c(0, 60), breaks=c(0, 15, 30, 45, 60)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 15), breaks=c(0, 5, 10, 15))+
  labs(x=NULL,y=NULL, title="High N Sedimentary")+
  theme(plot.title = element_text(hjust = 0.5))





LNB<-ggplot(LNB_Bound, aes(x=NO3, y=Ca, color=Harvest))+geom_point()+
  geom_abline(slope = coef(Ca_LNB_4B_lm)[[2]], intercept = coef(Ca_LNB_4B_lm)[[1]], color="red", linetype="dashed", size=1.2)+
  geom_abline(slope = coef(Ca_LNB_8B_lm)[[2]], intercept = coef(Ca_LNB_8B_lm)[[1]], color="blue", size=1.2)+
  geom_abline(slope = coef(Ca_LNB_4W_lm)[[2]], intercept = coef(Ca_LNB_4W_lm)[[1]], color="green",linetype="dashed" ,size=1.2)+
  geom_abline(slope = coef(Ca_LNB_8W_lm)[[2]], intercept = coef(Ca_LNB_8W_lm)[[1]], color="purple",  size=1.2)+
  geom_point(LNB_Bound_Harvest, mapping = aes(x=NO3, y=Ca, color=Harvest, shape=Harvest), size=3)+
  theme_classic2()+
  scale_x_continuous(expand = c(0, 0), limits = c(0, 15), breaks=c(0, 5, 10, 15)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 15), breaks=c(0, 5, 10, 15))+
  labs(x=NULL,y=NULL, title="Low N Basalt")+
  theme(plot.title = element_text(hjust = 0.5))

HNB<-ggplot(HNB_Bound, aes(x=NO3, y=Ca, color=Harvest))+geom_point()+
  geom_abline(slope = coef(Ca_HNB_4B_lm)[[2]], intercept = coef(Ca_HNB_4B_lm)[[1]], color="red", linetype="dashed", size=1.2)+
  geom_abline(slope = coef(Ca_HNB_8B_lm)[[2]], intercept = coef(Ca_HNB_8B_lm)[[1]], color="blue", size=1.2)+
  geom_abline(slope = coef(Ca_HNB_4W_lm)[[2]], intercept = coef(Ca_HNB_4W_lm)[[1]], color="green",linetype="dashed" ,size=1.2)+
  geom_abline(slope = coef(Ca_HNB_8W_lm)[[2]], intercept = coef(Ca_HNB_8W_lm)[[1]], color="purple",  size=1.2)+
  geom_point(HNB_Bound_Harvest, mapping = aes(x=NO3, y=Ca, color=Harvest, shape=Harvest), size=3)+
  theme_classic2()+
  scale_x_continuous(expand = c(0, 0), limits = c(0, 60), breaks=c(0, 15, 30, 45, 60)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 15), breaks=c(0, 5, 10, 15))+
  labs(x=NULL,y=NULL, title="High N Basalt")+
  theme(plot.title = element_text(hjust = 0.5))

Aov1_HNB<-aov(NO3 ~ Harvest, data=HNB_Bound)

summary(Aov1_HNB)

Homo_gen_HNB<-HNB_Bound%>% anova_test(Ca ~ Harvest*NO3)
Homo_gen_HNS<-HNS_Bound%>% anova_test(Ca ~ Harvest*NO3)
Homo_gen_LNB<-LNB_Bound%>% anova_test(Ca ~ Harvest*NO3)
Homo_gen_LNS<-LNS_Bound%>% anova_test(Ca ~ Harvest*NO3)

HNS_Contrast<-anova_test(formula = Ca ~ Harvest + NO3, data = HNS_Bound)


ggarrange(LNS, LNB, labels=c("A", "B"),
          ncol = 2, nrow = 1, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  annotate_figure(left = textGrob(expression("Ca Leaching ( kg"~'⋅'~ha^{-1}~'⋅'~year^{-1}~')'), rot = 90, vjust=.45, gp = gpar(cex = 1.3,
                  font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob(expression("N Leaching ( kg"~'⋅'~ha^{-1}~'⋅'~year^{-1}~')'), gp = gpar(cex = 1.3,
                   font.label = list(size = 14, color = "black", face = "bold"))), top=textGrob("Low N",gp = gpar(
                  font.label = list(size = 20, color = "black", face = "bold")))) %>%
  ggexport(filename="Low_N_COR.png", height=650, width=850, res=90)

ggarrange(HNS, HNB, labels=c("A", "B"),
          ncol = 2, nrow = 1, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  annotate_figure(left = textGrob(expression("Ca Leaching ( kg"~'⋅'~ha^{-1}~'⋅'~year^{-1}~')'), rot = 90, vjust=.45, gp = gpar(cex = 1.3,
                                                                                                                               font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob(expression("N Leaching ( kg"~'⋅'~ha^{-1}~'⋅'~year^{-1}~')'), gp = gpar(cex = 1.3,
                                                                                                           font.label = list(size = 14, color = "black", face = "bold"))), top=textGrob("High N",gp = gpar(
                                                                                                             font.label = list(size = 20, color = "black", face = "bold")))) %>%
  ggexport(filename="High_N_COR.png", height=650, width=850, res=90)
