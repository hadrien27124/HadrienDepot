########des graphiques de base avec R######

iris
hist(iris$Sepal.Length)
plot(iris$Sepal.Length,iris$Sepal.Width)

boxplot(iris$Petal.Length~iris$Species)

plot(iris$Petal.Length~iris$Species)

plot(iris$Petal.Length,iris$Petal.Width)
points(iris$Petal.Length[iris$Species=="setosa"], iris$Petal.Width[iris$Species=="setosa"],col="red",pch=16)

par(mfrow=c(1,2))
boxplot(iris$Petal.Length~iris$Species)
stripchart(iris$Petal.Length~iris$Species)



##########ggplot2#######

library(ggplot2)
#boxplot
ggplot(data=iris, mapping=aes(x=Species,y=Sepal.Length, fill=Species))+
  geom_boxplot()+ #ajout du boxplot
  theme_dark() #gerer le fond


#histogram
ggplot(data=iris, mapping=aes(x=Sepal.Length, fill=Species))+
  geom_histogram(bins = 10)+ #bins = nombre de bar
  theme_dark() + #gerer le fond
  facet_grid(rows=vars(Species))

#histogram
ggplot(data=iris, 
       mapping=aes(x=Petal.Length, y=Petal.Width, colour=Species))+
  geom_point()+ #bins = nombre de bar
  theme_dark() +
  facet_grid(rows=vars(Species))#gerer le fond


#Graphique 
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

  
  
  