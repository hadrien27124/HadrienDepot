# HadrienDepot

**Bonjour, voici le dépot de Hadrien SCHMITT**

####Depot graphique#####

library(dplyr)
data("starwars")
starwars

#format violon
boxplot("starwars")
ggplot(data=starwars, 
       mapping=aes(x= gender, y=height, fill = species ))+
  geom_violin(scale = "area")+ 
  theme_minimal()+
  # barre horizontal
  geom_hline(yintercept=175, color="orange", size=1) + 
  # barre vertical
  geom_vline(xintercept=2, color="orange", size=1)+
  annotate("segment", x = 1, xend = 4, y = 15, yend = 175, colour = "blue", size=3, alpha=0.8, arrow=arrow())
  
  
  
  