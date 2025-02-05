############################################################################
############################################################################
###################  ANALYSES - INDICATEURS  ###############################
############################################################################
############################################################################

## Date : 05/02/24 
## Auteur : Hadrien SCHMITT

##########################################################################
########################### Fonction utiles ##############################
##########################################################################


library(tidyverse)
library(readxl)
#%>% 
#|> 
read_excel()
#select() avec start_with() par exemple
#filter()
#mutate()
#fct_recode()
#group_by_()
#summarise()
#left_join() right_join() inner_join() full_join()
#pivot_longer() pivot_wider()
# ...


##########################################################################
########################### Import #######################################
##########################################################################

Sites <- read_excel("TD_Tidyverse/Sites.xlsx")
Microorga <- read_excel("TD_Tidyverse/Microorganismes.xlsx")
Nematodes <- read_excel("TD_Tidyverse/Nematodes.xlsx")
Vers <- read_excel("TD_Tidyverse/Lombrics.xlsx")



##########################################################################
######################### Jointure de tables #############################
##########################################################################
########### CONSIGNE : Choisir deux communautés biologiques ###########


Sites %>%  
  inner_join(.,Microorga, join_by(ID)) -> SiteMicro %>% 
  inner_join(.,Nematodes, join_by(ID)) -> SiteMN

Sites %>%
  inner_join(.,Microorga,join_by(ID)) %>%
  inner_join(.,Nematodes,join_by(ID)) -> SiteMN

##########################################################################
################## Sélection de lignes et colonnes ##################
##########################################################################
########### CONSIGNE : Choisir un site ###########

SiteMN %>% 
  filter(SITE == "Thil") %>% 
  select(SITE:REPET_BLOC,ARGILE, contains("SABLE"), 
         ends_with("MIN"), PHYTO:CARNI)-> SiteMN_Thil 
  
view(SiteMN_Thil)

##########################################################################
####################### Créer des variables ##################
##########################################################################


SiteMN %>% 
  mutate(Ratio = SABLE_G/ SABLE_F) -> Site_var
view(Site_var)

##########################################################################
############################## Calculs par groupe ########################
##########################################################################
########### CONSIGNE : calculs sur plusieurs variables en même temps######

Site_var %>% 
  group_by(MODALITE_DESCR) %>% 
  summarise(mean_Pp = mean(Ratio), sd_Pp)



##########################################################################
####################### Graphique ########################
##########################################################################
########### CONSIGNE : un graphique en modifiant l'ordre et en recodant des modalités

Site_var <- Site_var %>%
  mutate(MODALITE_DESCR = fct_reorder(MODALITE_DESCR, Ratio))

# Graphique : distribution du ratio par modalité
ggplot(Site_var, aes(x = SITE, y = Ratio, fill = SITE)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Distribution du Ratio Sable gros / Sable fin par lieu de prélèvement",
       x = "Lieu de prélèvement",
       y = "Ratio SABLE_G / SABLE_F") +
  theme(legend.position = "none")


##########################################################################
######################## Pivots ##########################################
##########################################################################
SiteMN_long <- Site_var %>%
  pivot_longer(cols = c(SABLE_G, SABLE_F, ARGILE),
               names_to = "Type_Grain",
               values_to = "Proportion")
view(SiteMN_long)

##########################################################################
####################### Enchaîner tous les traitements ###################
##########################################################################

