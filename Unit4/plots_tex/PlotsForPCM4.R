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










