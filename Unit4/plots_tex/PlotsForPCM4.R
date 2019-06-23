########################################
##File with creation of plots and things 
##for Unit 4 370 redesign
########################################

#####################################
#PCMa
library(ggplot2)
library(tidyr)
library(reshape)
library(epitools)

dat = read.csv("G:/My Drive/ST 370/Unit4/data/aquarium.csv")


ggplot(dat, aes(y=Count, x=Age)) +  geom_bar( stat="identity") + theme_bw()

ggplot(dat, aes(y=Count, x=Ethnicity)) +  geom_bar( stat="identity", fill="deepskyblue2") + theme_bw()

ggplot(dat, aes(fill=Ethnicity, y=Count, x=Age)) +  geom_bar( stat="identity") + theme_bw()


#exponential plots
x <- seq(from = 0, to =25, by = 0.025)
plot(x, dexp(x, rate = 1/10), type = "l", lwd = 2, main = "Probability from Exponential PDF", xlab = "y", ylab = "f(y)")
x2 <- seq(from = 2, to = 25, by = 0.005)
polygon(c(x2,rev(x2)), c(dexp(x2, rate = 1/10),rep(0,length(x2))), col = "blue")









