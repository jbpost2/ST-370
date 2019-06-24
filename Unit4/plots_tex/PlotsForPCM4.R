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

dat = read.csv("Unit4/data/aquarium.csv")


ggplot(dat, aes(y=Count, x=Age)) +  geom_bar( stat="identity") + theme_bw()

ggplot(dat, aes(y=Count, x=Ethnicity)) +  geom_bar( stat="identity", fill="deepskyblue2") + theme_bw()

ggplot(dat, aes(fill=Ethnicity, y=Count, x=Age)) +  geom_bar( stat="identity") + theme_bw()


#exponential plots
x <- seq(from = 0, to =25, by = 0.025)
plot(x, dexp(x, rate = 1/10), type = "l", lwd = 2, main = "Probability from Exponential PDF", xlab = "y", ylab = "f(y)")
x2 <- seq(from = 2, to = 25, by = 0.005)
polygon(c(x2,rev(x2)), c(dexp(x2, rate = 1/10),rep(0,length(x2))), col = "blue")



#PCM4c
library(tidyverse)

dat <- read_csv("Unit4/data/aquarium.csv")

tbl <- data.frame(Age = dat$Age[1:5], Hispanic = dat$Count[6:10], NonHispanic = dat$Count[1:5], stringsAsFactors = FALSE)

tbl <- cbind(tbl, RowTotal = rowSums(tbl[,2:3]))
tbl <- rbind(tbl, ColTotal = c("ColTotal", colSums(tbl[,2:4])))

#find expected counts
exp <- round(outer(X = as.numeric(tbl$RowTotal[1:5]), Y = as.numeric(t(tbl[6,2:3])))/as.numeric(tbl[6,4]), 1)

tbl[1:5, 2] <- paste(tbl[1:5,2], " (", exp[,1], ")", sep ="")
tbl[1:5, 3] <- paste(tbl[1:5,3], " (", exp[,2], ")", sep ="")
knitr::kable(tbl)
##See RMD file for output of tbl

x <- seq(from = 0, to =25, length = 5000)
plot(x, dchisq(x, df = 4), type = "l", lwd = 2, main = "Null Distribution \n (Chi-Square with 4 Degrees of Freedom)", xlab = "chi-sq values", ylab = "PDF")

plot(x, dchisq(x, df = 4), type = "l", lwd = 2, main = "Rejection Region using a 0.05 Significance Level", xlab = "chi-sq values", ylab = "PDF")
x2 <- seq(from = qchisq(0.95, df = 4), to = 25, length = 5000)
polygon(c(x2,rev(x2)), c(dchisq(x2, df=4),rep(0,length(x2))), col = "blue")



##second example in PCMc
tbl2 <- data.frame(OS = c("Linux", "Windows", "Mac", "Other", "ColTotal"), Graduate = c(33, 16, 20, 4, 73), Undergraduate = c(21, 51, 45, 1, 118), RowTotal = c(54, 67, 65, 5, 191), stringsAsFactors = FALSE)

exp <- round(outer(X = as.numeric(tbl2$RowTotal[1:4]), Y = as.numeric(t(tbl2[5,2:3])))/as.numeric(tbl2[5,4]), 1)

tbl2[1:4, 2] <- paste(tbl2[1:4,2], " (", exp[,1], ")", sep ="")
tbl2[1:4, 3] <- paste(tbl2[1:4,3], " (", exp[,2], ")", sep ="")
knitr::kable(tbl2)

obs <- tbl2[1:4,2:3]
exp
sum((obs-exp)^2/exp)
1-pchisq(23.14,df = 3)

##RR
x <- seq(from = 0, to =25, length = 5000)
plot(x, dchisq(x, df = 3), type = "l", lwd = 2, main = "Rejection Region using a 0.05 Significance Level", xlab = "chi-sq values", ylab = "PDF")
x2 <- seq(from = qchisq(0.95, df = 3), to = 25, length = 5000)
polygon(c(x2,rev(x2)), c(dchisq(x2, df=3),rep(0,length(x2))), col = "blue")
abline(v = 23.14, lwd = 3, col = "Red")

