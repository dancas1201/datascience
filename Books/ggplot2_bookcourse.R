install.packages("qplot")

library(ggplot2)
library(qplot)

###############

#Capitulo 2: Introduccion a qplot()

###############

#Para graficar en qplot siempre se especifica la variable x & y primero, luego la palabra data=
#y si no se especif??ca un geom hara el que mejor sugiera.
qplot(carat, price, data = diamonds)
qplot(log(carat), log(price), data = diamonds)
qplot(carat, x*y*z, data = diamonds)

#Variables categoricas se pueden graficar con colour o shape
qplot(carat, price, data = diamonds, colour = color)
qplot(carat, price, data = diamonds, shape = cut)

#Modificando aesthetics con alpha carat
qplot(carat, price, data = diamonds, shape = cut, alpha = I(1/10))
qplot(carat, price, data = diamonds, colour = color, alpha = I(1/5))
qplot(carat, price, data = diamonds, alpha = I(1/200))

#Agregar un smooth a un scatterplot
qplot(carat, price, data = diamonds, colour = color, alpha = I(1/4), geom = c("point", "smooth"))
#El parametro span no funciona con datasets de mas de 1000 obs

#Es posible graficar boxplot o jittered points
qplot(color, price/carat, data = diamonds, alpha = I(1/5), geom = "jitter")
#Para los jittered points es posible poder ajustar variables categ??ricas con "size","colour" y "shape"
qplot(color, price/carat, data = diamonds, geom = "boxplot")
qplot(cut, price, data = diamonds, alpha = I(1/10), geom = "boxplot")
#Para los jittered points es posible poder ajustar variables categ??ricas con "size","colour" y "shape", por ejemplo:
qplot(color, price/carat, data = diamonds, colour = color, geom = "boxplot")

#qplot Histograms & Density Plots
qplot(carat, data = diamonds, geom = "histogram")
qplot(carat, data = diamonds, geom = "density")
#Smoothness: adjust para density plots y binwidth para histogram plots
qplot(carat, data = diamonds, geom = "histogram", binwidth = 1, xlim = c(0,3))
qplot(carat, data = diamonds, geom = "histogram", binwidth = 0.1, xlim = c(0,3))
qplot(carat, data = diamonds, geom = "histogram", binwidth = 0.01, xlim = c(0,3))
#Usando adjust para density y agregando colour para "color" en density y "fill" para histogram
qplot(carat, data = diamonds, geom = "density", adjust = 1, xlim = c(0,3), colour = color)
qplot(carat, data = diamonds, geom = "histogram", fill = color, alpha = I(0.7))

#Barcharts
#No se necesita tabular antes de realizar un barchart, autom??ticamente qplot lo hace directo del dataset
#Notese como para el barchart no se especifica una variable y, solo la variable x, a menos que el conteo sea del
#cruce con otra variable se especifica en "scale_y_continous()"
qplot(color, data = diamonds, geom = "bar")
qplot(color, data = diamonds, geom = "bar", weight = carat) + scale_y_continuous("carat")

#Time Series with line and pathplots
qplot(date, unemploy / pop, data = economics, geom = "line")
qplot(date, unemploy / pop, data = economics, geom = c("line", "point"))
qplot(date, uempmed, data = economics, geom = "line")
qplot(unemploy / pop, uempmed, data = economics, geom = c("point", "path"))
year <- function(x) as.POSIXlt(x)$year + 1900
qplot(unemploy / pop, uempmed, data = economics, geom = "path", colour = year(date))
qplot(unemploy / pop, uempmed, data = economics, geom = c("path", "point"), colour = year(date))

#Ejemplo con facets: Se vera mas adelante
qplot(carat, data = diamonds, facets = color ~ ., geom = "histogram", binwidth = 0.1, xlim = c(0, 3))
