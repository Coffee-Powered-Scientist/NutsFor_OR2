### Abstract ###

<!--Include elements from proposal, include Ca-specific stuff as well as giving an overview of the field-->

In this study the potential for forest nutrient limitation soil nutrient depletion under intensive forest management was analyzed at the high and lower ranges of soil N saturation in Douglas-fir sites of the Oregon Coast Range (OCR). The numerical model NutsFor was calibrated to represent the forest sites. The sites underwent bole-only or whole-tree-harvest, growing through either a 40-year or 80-year rotation. The aim of this study was to identify the number of rotations each stand could undergo before nutrient limitation occurred. The study was specifically concerned with the incidence of calcium (Ca) limitation in highly N saturated soils, however NutsFor was parameterized such that any nutrient could become limiting over the course of the simulation. This study defines the sources of nutrient loss and retention within each site, represents these factors in a dynamic ecosystem model, and quantifies the depletion of nutrients relative to stand requirements. This study provides an approximation of forest-soil behavior between the selected sites over the long term, however it isolates the relationship between soil N status, soil minerology, and forest harvest.  In summary, we found that more intensive harvest scenarios lead to soil Ca depletion and growth limitation in highly N saturated soils, whereas low N soils experienced more significant N and P limitations compared to other nutrients.  



### Acknowledgements ###

This is just a draft version, I will likely write this last. 

### Introduction ### 

<!--From Proposal-->

Coastal Douglas-fir forests of the Pacific Northwest are among the most productive worldwide (Hermann and Lavender, 1999). This is largely due to a combination of high soil nitrogen (N) availability and favorable climate for tree growth. Whereas forest growth worldwide is often limited by low N availability, coastal Pacific Northwest forests often display high soil N availability due to a history of symbiotic N-fixation associated with red alder (Alnus rubra) (Binkley, 1983). In some cases, red alder can fix more N to soils than ecosystems can retain, leading to a condition known as N saturation (Perakis and Sinkhorn, 2011). In N saturated forests, excess soil N is converted to nitrate, which generates acidity and stimulates the leaching of nitrate and essential base cations (particularly calcium, Ca) from soils (Homann et al., 1994). When N-saturation and Ca leaching persist for centuries, it can result severe depletion of soil available Ca pools and Ca deficiency in Douglas-fir (Perakis et al., 2006). In these cases, the potential for soil Ca resupply from mineral weathering can differ by bedrock type (Hynicka et al., 2016). Specifically, even when high soil N depletes the soil exchangeable pool of Ca, it is possible that the base-cation rich minerals of basaltic sites have a higher capacity to replenish the exchangeable pool compared to the minerals of sedimentary sites (Hynicka et al., 2016). Removal of nutrients off-site through tree harvest is a primary cause of soil nutrient depletion in many managed forests (Johnson, 1983). Depletion of soil N through multiple harvest cycles is often a concern in N-limited forests (Himes et al., 2014), but nutrient depletion risk can shift to other nutrients such as Ca, P, K, S, etc., in forests with high N supply (Mainwaring et al., 2014; Perakis et al., 2013; Turner et al., 1977; Radwan and Shumway, 1985). Depletion of soil Ca in some N-saturated Douglas-fir forests has been hypothesized to be particularly imminent (~50 years) under whole-tree harvest, whereas stem-only harvest may extend site Ca supply up to 400 years (Perakis et al., 2006). Recent intensification of forest management to improve economic returns has led to shorter rotation schedules in many areas (Mason, 2003), with potential to accelerate nutrient removals as well. However, it remains unknown how many short-rotation harvests must occur to cause nutrient depletion under a variety of soil nutrient conditions. In Coastal Douglas-fir forests, it is likely to depend on the interaction of harvest intensity and how forest N saturation influences Ca supply from mineral weathering. Various approaches are used to evaluate soil nutrient depletion in managed forests. This ranges from field-based nutrient-budget analyses to static and dynamic modeling approaches. Static modeling cannot account for the long-term changes in site development, such as changes in CEC and nutrient availability. Representing the interactive relationship between forest management, soil N status, and site mineral weathering rates is therefore similarly impractical in such approaches. Dynamic models more realistically reflect how multiple ecosystem compartments interact to drive nutrient depletion (Johnson, 1983), as these models evaluate how changes in ecosystem processes interdependently affect each other over time. Dynamic models are generally more empirical or process-based in their formulation, with process-based modeling having more internal resolution than empirical models, allowing for changes in soil nutrient availability to be explicitly represented (Korzukhin et al., 1996). Relatively few dynamic models of forest nutrient cycling contain sufficient chemical detail to evaluate interactions between nitrogen cycling and calcium supply from mineral weathering. One such model is called “Nutrient Cycling in Forest Ecosystems”, or NutsFor. NutsFor is one of several dynamic process-oriented models that was developed to simulate forest-soil chemical responses to harvest and acidic deposition (van der Heijden et al., 2017). It is a hybrid of the Nutrient Cycling Model (NuCM), which has been used to study base cation nutrient depletion due to acidic deposition and harvest intensity (Verburg et al., 2001; van der Heijden et al., 2011; Liu et al., 1991). NutsFor has adopted NuCM’s exchange site simulations and N-transformation processes, while adding the PROFILE soil mineral weathering model (van der Heijden et al. 2017). NutsFor’s ability to link soil N transformations to soil acidification, mineral weathering, forest management, and exchange site depletion of base cations makes NutsFor well suited to the study of nutrient cycling and depletion in the biogeochemically diverse, intensively managed coastal forests of the PNW. The aim of this study is to evaluate how interactions among forest management, site N status, and site mineralogy influence the rate of nutrient depletion from soils. By applying NutsFor, the following set of questions can be answered;  The questions have the following corresponding hypotheses: Hypothesis 1: Highly N saturated soils will drive base cation leaching independent of the potential base cation supply by site mineralogy. Hypothesis 2: More intensive management scenarios (whole tree harvest and shorter rotations) will increase the rate of nutrient depletion compared to less intensive management scenarios (stem-only harvest and longer rotations).  5 Hypothesis 3a: Nutrient depletion will occur more rapidly in sedimentary than in basaltic sites because the weathering capacity of minerals in sedimentary sites will provide fewer base cation inputs from mineral weathering. Hypothesis 3b: Mineralogical differences among bedrock-type and consequent dynamics of Ca availability through weathering have a larger effect than static estimates of the exchangeable Ca pool on the long-term sustainability of forest Ca supply, as assessed by tree growth over time.

 

Chapter 1: Introduction v.1

<!--Chapter version-->

The forests of the coastal Pacific Northwest are among the most productive forests globally ~/citep{mcardleYieldDouglasFir1930,waringEvergreenConiferousForests1979,HermanLavender1999}. This productivity is due to a combination of high soil nitrogen (N) and climate that is favorable to tree growth. Whereas the majority of forests worldwide are N limited due to low N availability, the coastal Douglas-fir forests  have undergone centuries of N accumulation <!----> due to historic presence of the symbiotic N-fixing red alder (*Alnus rubra*) in the region ~/citep{binkley1983}. In some soils, N accumulation has persisted long enough for N to be available in excess of ecosystem requirements, this state of extreme N accumulation is known as N saturation \citep{agrenNitrogenSaturationTerrestrial1988}. In instances of soil N saturation, tree N demand is met, opening the possibility that other nutrients may become limiting. Other nutrients known to sometimes be limiting to Douglas-fir forests of the Pacific Northwest are P, Ca, K, and S ~citep{mainwaringThreeyearGrowthResponse2014; perakisForestCalciumDepletion2013; turnerUseFoliageSulphate1977; radwanNutritionDouglasfir}. While P is commonly held as a major secondary limiting nutrient globally, regional data suggests that base cation limitation (particularly, Ca) may be a more significant restraint on tree growth. 

Although high soil N stimulates tree growth, it can also lead to nutrient limitation through specific interactions between soil N and base cations. This can occur due to nitrification, an acidifying soil process that converts ammonium-N to nitrate-N ~citep{}. As nitrate is a highly mobile anion, nitrate leaching from soils is coupled with cation leaching ~/citep{}. Nitrification and nitrate leaching particularly accelerates calcium (Ca) and magnesium (Mg) losses from soils compared to other base cations ~/citep{homann1994}. As Ca is required in higher quantities by trees than Mg, and is known to be distinctly limiting in other forests predisposed to highly acidic and weathered soil conditions ~citep{likensHB1998, federerLongtermDepletionCalcium1989, bigelowNutrientLimitationJuvenile2007}, it is more likely that Ca deficiency is to develop in the higher N soils of the Oregon Coast Range (OCR) rather than other base cations. In contrast to accelerated leaching losses, chronic N saturation and nitrification can stimulate accelerated mineral weathering ~citep{berthelinMajorRoleNitrification1985, PerakisPettRidge2019}. 

Douglas-fir forests grow on soils derived from distinct bedrock minerals, known generally as sedimentary or basaltic minerals. Sedimentary minerals are those deposited by marine and alluvial processes, whereas basaltic minerals are derived from cooled lava flows from historic volcanic activity ~citep{}. Sedimentary minerals are cation poor compared to basaltic minerals, this means that sedimentary minerals supply less nutrient cations to forests than basaltic minerals over similar time scales. However, over millennia, the  source of ecosystem Ca supply in the OCR has shifted from mineral to atmospheric in N saturated soils, regardless of bedrock type ~citep{hynicka206}. This implies either a depletion or an inaccessibility of the weatherable pool of nutrient cations at N saturated sites ~/citep{hynicka2016, leysNaturalAnthropogenicDrivers2016a}. Chronic N saturation may thus lead to base cation limitations in all N-saturated soils regardless of the potential base cation supply of the bedrock. 

Although ecosystem nutrient cycling processes are sufficient in supplying Ca  in many unaltered forests ~/citep{vitousekLitterfallNutrientCycling1984, hiltonNutrientCyclingTropical1987}, a large portion of Douglas-fir in the OCR is grown for the harvest of timber ~/citep{}. Removals of tree nutrients through harvest is a primary cause of ecosystem nutrient losses in managed forests ~citep{johnsonSymposiumForestSite1986}, and may quickly lead to soil Ca depletion and subsequent forest productivity losses in Ca deficient forests ~citep{federerLongtermDepletionCalcium1989,nykvistTropicalForestsCan2000}. Intensive forest-harvest practices, such as whole-tree-harvest (WTH), are known to be the major cause of nutrient losses in a range of forest plantations in comparison to moderate practices, such as bole-only (BOH) harvest  ~citep{achatQuantifyingConsequencesRemoving2015}. Recent intensification of forest management to improve economic returns has led to shorter rotation schedules of 40 years and lower ~citep{diazTradeoffsTimberCarbon2018}, with potential to accelerate nutrient removals substantially. It is estimated that high N Douglas-fir forests under WTH will reach soil Ca depletion within ~50 years of continued harvest, whereas the application of BOH can extend this to ~400 years ~citep{}. However, it remains unknown how many short-rotation harvests must occur to cause nutrient depletion under the variety of soil nutrient conditions underlying the Oregon Coast Range.  In Coastal Douglas-fir forests, it is likely to depend on the interaction of harvest intensity and how forest N saturation influences Ca supply from mineral  and exchangeable base cation supply. 

A dynamic modelling approach is used to  observe the potential for soil N saturation and harvest to drive nutrient depletion in soils. Relatively few dynamic models of forest nutrient cycling contain sufficient chemical detail to evaluate interactions between nitrogen cycling and calcium supply from mineral weathering. One such model is called “Nutrient Cycling in Forest Ecosystems”, or NutsFor. NutsFor is one of several dynamic process-oriented models that was developed to simulate forest-soil chemical responses to harvest and acidic deposition (van der Heijden et al., 2017). It is a hybrid of the Nutrient Cycling Model (NuCM), the ForSAFE model, and the PROFILE model, which have been used to study base cation nutrient depletion due to acidic deposition and harvest intensity (Verburg et al., 2001; van der Heijden et al., 2011; Liu et al., 1991). NutsFor has adopted NuCM’s exchange site simulations and N-transformation processes, while adding the PROFILE soil mineral weathering model (van der Heijden et al. 2017). NutsFor’s ability to link soil N transformations to soil acidification, mineral weathering, forest management, and exchange site depletion of base cations makes NutsFor well suited to the study of nutrient cycling and depletion in the biogeochemically diverse, intensively managed coastal forests of the PNW. 

<!--How to link introduction back to objectives-->

In this study, we report how extreme soil N enrichment affects long-term nutrient retention in OCR forests under repeated harvest. We further describe how bedrock type interacts with soil N to supply base cation nutrients to forests. We studied the effects that soil N extremes (low to high) have on nutrient limitation on forests sites overlying either sedimentary or basaltic minerals, over a range of harvest intensities to answer the following questions: Q1: How does soil N saturation affect nutrient losses (especially Ca) in coastal Douglas-fir stands? Q2: How do different stand rotation lengths and harvest types change the rate at which nutrient depletion occurs? Q3: How do different kinds of bedrock (basaltic versus sedimentary) and associated soil minerals influence the rate of nutrient depletion? Q5: When (after how many harvests) do nutrient losses cause biomass accrual rates to slow?

### Literature Review

<!--Probably going to copy and paste my proposal literature review here, for a good start.-->

### Methods

#### Overview

Initial parameters were established in NutsFor for the four sites based on their soil N content and mineralogy. A table showing the sources for these initial parameters can be found in  Appendix A, Table A1. A hierarchy of calibration was established for each NutsFor sub-system, this constructed system was followed until simulated outputs matched ecosystem measurements and known behaviors. Once calibrated, bole-only harvest and whole-tree-harvest were simulated  over the course of 500 years. Harvest events were simulated to occur after either 40 years of tree growth (i.e., a 40-year rotation) or 80 years of tree growth. All simulated stands were assumed to be 20 years old at the beginning of the simulation (January, 2005). The first harvest event was therefore induced in 2025 for the 40-year rotations and 2065 for the 80-year rotations, two years of zero-growth were simulated in-between each harvest event to mimic the time between harvest and replanting operations. Sites were selected based on N-saturation, high N sites were parameterized using the highest N sites from  ~/cite{PerakisSinkhorn2011} and ~/cite{Hynickaetal2016} (~20,000 kg N/ha soil at 1m depth), whereas low N soils were parameterized using the lowest N soils (~4000 kg N/ha). These sites represent the two extreme ends of the N saturation spectrum that exists in the OCR, they were specifically chosen  to highlight the role of the N-cycle in determining long term nutrient cycling patterns.  NutsFor used growth increment and target nutrient data generated by the growth-yield model CIPSANON, using a reference site index 180 Douglas-fir stand growing in the Oregon Coast Range ~citep{}. 

#### Site Description

Basaltic Bedrock

Forest soils that develop on basaltic bedrock tend to form iron oxide rich Andisols, with kaolinite, halloysite, and gibbsite as commonly forming secondary minerals (Glasmann and Simonson, 1985; Southard et al., 2017). These minerals have high sulfate and phosphate adsorption capacities, limiting the mobility of these nutrients within the soil, and facilitating anion fixation (Johnson, 1984; Pigna and Violante 2003; Inskeep, 1989). Mineral fragments consist of olivine, pyroxenes and plagioclase (Franklin, 1990). This often produces soils that are relatively rich in base cations. High nitrate leaching can diminish exchangeable pools of base cations on soils derived from basaltic rock (Perakis et al., 2006). However, basaltic soils may nevertheless contain sufficient reserves of base cations in rock fragments that are released by mineral weathering to support plant uptake (Hynicka et al., 2016).  The highest N basalt soils had relatively low mineral weathering Ca fluxes (~0.7 kg Ca/ha/yr), while the low N basalt sites had the highest Ca flux (~7 kg Ca/ha/yr) (among soils of similar age?). This indicates that centuries of N-fixation and nitrification have depleted the easily-weatherable pools of base cations. 

Sedimentary Bedrock 

Parent material denoted as “sedimentary bedrock” in the OCR refers to sandstone and siltstone. This bedrock type lends itself to the formation of andic Inceptisols rich in quartz and iron oxides, with minor feldspar and lithic contribution to soil mineralogy (Bockheim and Langley‐ Turnbaugh, 1997; Anderson et al., 2002; Southard et al., 2017). Secondary clay mineralogy is dominated by gibbsite and vermiculite, with small contributions of smectite in areas of earthflow and physical disturbance (Bockheim and Langley‐Turnbaugh, 1997; Istok and Harward, 1982). Quartz becomes increasingly dominant in soil as sedimentary sites weather towards an Ultisol state, indicating the importance of site age/weathering conditions on the mineral pool (Lindeburg et al., 2013). Bulk chemistry of rock fragments in soil shows that sedimentary sites have less total base cations than basaltic ones (Hynicka et al., 2016), and thus a potentially higher potential for base cation nutrient depletion. Mineral weathering rates were unknown for these sites, and were instead set such that lysimeter-measured leaching fluxes matched those simulated, after accounting for soil solution acidity on exchangeable pool leaching. Site 7 was used as the low N sedimentary reference site and site 39 was used for the sedimentary high N site.  Site 7 exchangeable chemistry was measured in 2005 and 2015, low N sedimentary simulations thus had an additional point of constraint in that decadal shifts in adsorption chemistry were known. 

#### The NutsFor Model

<!--~~In modeling-based manuscripts, rather than have a long section explaining calibration, the model is first described in a subsection, and calibration is described next, caviats included.~~--> 

The Nutrient Cycling in Forested Ecosystems model (NutsFor) is a stand-level biogeochemical cycling model developed by van der Heijden et al, 2017, describing the speciation of 16 chemical species. A hybrid of several models, NutsFor incorporates all major nutrient cycling processes inhertied from the Nutrient Cycling Model (NuCM)(uptake, translocation, leaching, mineral weathering, organic matter dynamics, deposition fluxes). NutsFor simulates the cycling of nutrients based on the user-entered optimal stand-growth (and thus uptake) rate, mineral weathering rates based on a user specified mineral pool, nutrient release rates from organic pools, and litterfall return rates (specified by the user, dynamic with foliar growth). The model also simulates the exchange site chemistry of Na, K, NH4, Ca, Mg, Al and H, and the adsorption of sulfate, phosphate, and chloride anions through either Langmuir or Freundlich isotherms. All anion adsorption is non-competitive and insensitive to pH change. Elemental transport through soil layers is simulated through the NutsFor hydrological sub-module, WatFor ~\citep{}. The mineral weathering engine is inherited from the PROFILE mineral weathering model ~citep{}. While the model was specifically developed to answer questions pertaining to Ca and Mg cycling and distribution in trees growing in Brueil, France,  NutsFor was modified for the purposes of this research to include explicit harvest scenarios, bark and branch biomass compartments, organic residues, and a function to limit tree access to exchangeable cations. 

#### Calibration

<!--Start off describing what calibration is-->

The use of calibration in process modelling in often criticized for allowing the modeler to produce any result desired [@]. This can certainly be true, any model with more than a three controls for a single process has an infinite number of ways though which it can be calibrated to obtain a single observed result [@]. To avoid this sort of calibration, a set of rules was established based on an initial analysis of NutsFor's processes and known site data, or lack thereof, to justify any needed calibration of model parameters.  The workflows from the NutsFor User Manual  were used to calibrate each model subsystem based on a hierarchy of ecosystem control. A more detailed, step-wise description of the calibration process is given in the appendix. N-Cycle calibration was specifically included due to the dominance of N saturation and transformation processes in determining base cation nutrient mobility [@].  For sedimentary sites, soil solution concentrations of major nutrient cations and anions were measured from the 2005-2006 period, basaltic sites were not. Sedimentary sites had available exchangeable chemistry data for all cations and extractable phosphate data from 2005, whereas basalt sites had available exchangeable chemistry data from 2015 ~citep{}. 

Sedimentary mineral weathering fluxes were unknown due to a lack of knowledge of the sedimentary mineral end-members, weatherable mineral area was calibrated until lysimeter fluxes matched observed leaching fluxes ~citep{}.  Basaltic sites had known mineral weathering fluxes for Ca ~citep{}, the weatherable mineral area parameter was calibrated until these fluxes matched observed ones. Unlike sedimentary sites, leaching fluxes were unconstrained for basalt sites. Instead, tree uptake, mineral weathering, and exchangeable nutrient changes were monitored for long-term stability within the simulation. Still, the loss rate of nutrients in the basalt sites could not be easily constrained against regional data. The analyzed behavior of the basalt sites is thus more qualitative compared to the sedimentary sites, offering a more heuristic analysis of basalt sites. 

In extension to calibration, the results of NutsFor simulations were observed and validated against a wide breadth of data noted in Table A2. This validation step ensures that simulated trends are within realistic constraints to observed ones. 

#### Experimental Design

Sedimentary and....





<!--Maybe an extended methods proccess for the Appendix?-->

1

The sites in this study represent the low (~4000 kg N/ha) and high ends (~20,000 kg N/ha) of soil N saturation in the OCR. 

Each sub-model of NutsFor was independently calibrated based on no more than 2 chosen parameters for every 1 observed output. After a set of two parameters were calibrated for one output, they were not changed in the succeeding sub-model calibration steps.  



### Results

*Calibration and Site Behavior* 

*Nutrient Fluxes*

*Simulated Biomass Accrual*

### Discussion

*High N Sites*

*Low N Sites*

Note:

Ca limitation may not only lead to shortages in biomass accrual, as reported here, but may lead to lower wood quality. Ca depletion thus has more nuanced implications for forest health and for the timber industry. On one hand, minor Ca depletion may lead to negligible grow impacts, but can negatively affect wood sinuosity, strength, and thus the value and integrity of Douglas-fir wood from the OCR ~citep{}. Where Ca leads to lower total biomass accrual, the ability of forests to regulate atmospheric carbon becomes limited. 

### Conclusion

### Appendix

Methods A: Calibration by Step

1). Hydrology



All sites were assumed to have the same rainfall volume, rainfall concentration, evaporation, and drainage characteristics. Regional evaporation data from ~/citep{}  was used as a constraint on simulated evapotranspiration. Cloverdale and Newport data was specifically used as reference evaporation regions around the coast range, while evapotranspiration patterns were examined against other datasets in the pacific northwest ~/citep{jassalEvapotranspirationWaterUse2009}. Extrapolated soil water drainage (~1500mm) at 1 m depth was calculated for the sites at 2500 mm rainfall. Drainage was used as an additional constraint on hydrology. All nutrient leaching fluxes were scaled to the extrapolated drainage, assuming the same concentration as measured in the original lysimeters. Rainfall volume was set as an average approximate value for the region, ambient air temperature values were derived from PRISM for the 2005-2007 time frame and repeated over the simulation time period ~/cite{}. 



2).  Throughfall and Deposition

Data describing  characteristics of throughfall leaching behavior for young Douglas-fir in the OCR was scare, regional data from the Integrated Forest Study (IFS) was used for a similarly aged Douglas-fir stand in Washington ~/citep{}. Dry deposition was not included in the model due to unknown recent patterns in dry deposition.  Wet deposition from the ALSEA OR02 site (coordinates), for the years of 2005-2007, was used to set rainfall concentrations in the model ~/citep{}. Some studies show that throughfall leaching of foliar nutrients may be a significant source of cations in highly weathered coastal forests ~citep{}. 

3). Soil Organic Matter

Decomposition parameters were adjusted after initial carbon pools in the O-horizon and SOM pools were set. Decomposition rates were adjusted until a). O-horizon C-stock increased over a 10-year time frame, consistent with data from ~/cite{} b). SOM C pools remained stable (neither increasing nor decreasing), and c). DOC leaching fluxes matched those observed in lysimeter measurements. As basalt sites had no lysimeters in place, the carbon calibration for the low N sedimentary site was adopted by the low N basalt site, and the high N basalt received the same C-pool parameterization as the high N sedimentary site. 

Concentrations of organic acid (dissolved or solid) were not measured, however it was assumed that R- played a significant role in soil solution buffering due to the relatively high C stock of the sites ~/citep{}. This assumption is not unreasonable given the charge balance deficient present in the soil solution, when R- is unaccounted for (data no shown, YET). Additionally, NutsFor does not take into consideration the solid phase of organic acids, the dissolved phase of organic acid R- was therefore used as a necessary stand-in for all forms of organic acids in order to balance dissolved base concentrations in the soil solution. 

4).  N-Cycle Calibration

Calibration of the N cycle followed the rule that the high N sites (sedimentary or basaltic) should have the same N cycle parameters, whereas the low N sites should have the same parameters. This is because one of the key assertions of this research is that the N-cycle is what has hierarchy over mineral weathering, soil acidification, and CEC depletion.  Ammonium sorption parameters were set by assuming that each layer's CEC was occupied by 0.00005 cmol/kg (<!--report soil N contributed by CEC-->) for the low N sites and 0.00015cmol/kg for the high N sites <!--Maybe email the profs on this-->, this assumption was made as Hynicka's CEC data did not include ammonium sorption, and it is assumed that N uptake and nitrification largely restrict the ammonium pool, leading to a low amount of ammonium that can potentially adsorb onto CEC surfaces. 

The decomposition dynamics between high and low N sites are different, very high N sites tend to have lower decomposition rates and greater N release ~citep{}. This behavior was mimicked by setting N-release factors to be lower in the low N sites, and setting them higher in the high N sites. The high N sites also had decomposition rates  limited to mimic observed behavior in each layer. Although there is data to suggest the magnitude of the N release factors, calibration was completed heuristically, N-release factors where chosen based on calibration of the soil solution concentrations of ammonium and nitrate. 

5). Anion Calibration

For all anions (excluding nitrate), soil adsorption models were set based on the Langmuir isotherm (Sulfate, Chloride) and Freundlich isotherm (Phosphate).  Adsorption parameters were calibrated until soil solution concentrations matched those observed. All sites were given the same adsorption parameters, although high N sites were known to contain more SOM-S and SOM-P.  Soil solution chloride concentrations could not be adequately calibrated, possibly due to a disconnection between non-specific chloride adsorption and soil acidity within the model ~/citep{}. Furthermore, sea-salt spray may have lead to huge discrepancies in measured Cl concentrations along coast range sites ~citep{}, it was safer to assume constant Cl- input rather  than manually adjust Cl- deposition to match lysimeter leaching of Cl- for each site. This was assumed because we also assumed that our four sites were within an average rainfall zone, neither directly on the coast nor beyond the elevated region separating the coast from the valley. We also had only one source of deposition data  for all sites, the NADP station was further inland than most of the sites, and so sea-salt deposition may be significantly lower in the simulated sites than in real sites ~citep{}. Thus, rainfall deposition was the same in all sites, although the dataset which lysimeter estimates were derived represented a wide range of forests with respect to distance from the coastline ~citep{}. It is unlikely that this perturbed calibration in regards to ANC or exchangeable chemistry, as sea-salt spray would be balanced with respect to cation-anion concentrations (Na-Cl) and would only cause the enhanced mobility of Na and Cl-.

Dissolved organic acid concentrations were unknown, however a calculation of cation-anion balances from the sedimentary sites revealed an anion deficient. This is similar to ~cite{}, who found that anion deficits were common in coast range soils, and most likely attributable to organic acids. Furthermore, it is suggested by ~cite{} that a majority of anions in high-organic forest soils can be organic in nature. Using these relationships, we made up any anion-deficits using R- concentrations. This allowed us to balance ANC and pH calculations in the model. This was done by changing the organic acid charge density parameter. 

6). Cation Calibration

As sedimentary sites had complementary soil solution concentration data, Gapon coefficients were readily calculated from 0-50cm. Exchangeable cation data was not present for 50-100cm soil layers. Linear regression techniques were used to predict exchangeable cation concentrations to 100cm depth using 0-50cm data. This method comes with some error, as it tended to lead to high exchangeable acidity (Al) at the bottom layers and thus enhanced cation leaching. To remedy this, the calculated selectivity coefficients for Al were adjusted at depth to allow for cation stabilization to behave more realistically. 

Sedimentary sites had unconstrained Ca mineral weathering fluxes due to unknown weathering end-members ~/citep{}. Mineral weathering and subsequent cation concentrations were calibrated using the weatherable mineral area parameter, until observed leaching fluxes matched simulated leaching fluxes for Ca and other cations. Other estimates of mineral weathering for OCR soils derived from sedimentary bedrock tended to perturb ANC and soil solution pH, and were thus untenable for calibration ~/citep{}. 

Generally, potassium leaching was greatly enhanced in the model, this may be due to an absence of K+ stabilization via 2:1 clay interactions ~citep{}, or due to how selectivity coefficients were extrapolated to the bottom most layers of the soil. 

Basalt cation calibration began by using the same initial concentrations observed for sedimentary sites. Basalt site Ca weathering fluxes were able to be approximated from strontium isotope data ~/citep{}. Once weathering was calibrated, the sites were accepted "as is" given that exchangeable cation losses were not unrealistically severe and that tree nutrient content and growth rates matched those calculated by CIPSANON ~citep{}. 

7). Final Calibration

8). Alternative Calibration



Assumptions

-Top 3 layers would have the most weathering proportional to the bottom layers (justifies them being orders of magnitude higher than bottom layers)

-Sulfate that enters the system is largely from rainfall (thus similar to sedimentary sites), the slightly older, coastal, and weathered nature of our target soils would imply low sulfate containing minerals (like pyrite) which weather quickly; Mineral sources of sulfate already weathered (Andic soils, a little older than pyrite rich soils)

-Ammonium CEC was at a constant amount per layer (however this translate to a different cumulative N content each layer as CEC per layer is different): 

-Dissolved organic acids can be used as a anion source in lieu of the absence of solid organic acids in the SOM pool, which are not included in this model. This leads to greater carbon mobility (mobile R- in DOC). 

-Averaged CEC and lysimeter data captured adequate summary of soil chemical behavior

-Sulfate pool should be the same across sites, it is the K and n values which should differ 

-Solid soil organic acids can be represented by dissolved soil organic acids, as long as organic leaching and C build up are not compromised. 

-NCSS data is representative of soil moisture and some mineralogy of the sites

-Our sites start off with different mineral areas due to different weathering histories, although there can certainly be limitations to this

-Organic pool dynamics in high N and low N sites were similar by their N content (i.e., regardless of their).,,