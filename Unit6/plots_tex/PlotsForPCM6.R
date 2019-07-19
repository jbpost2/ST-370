########################################
##File with creation of plots and things 
##for Unit 6 370 redesign
########################################

#####################################
#PCM6a

#####################################
#PCM6b
#data set
logMutations <- c(2.13, 1.59, 1.14, 1.77, 1.36, 1.46, 1.19, 1.42, 1.73, 1.57, 1.49, 2.52, 1.83, 1.35, 1.52)
group <- c(rep("Control", 7), rep("Treatment", 8))
mutations <- round(10^(logMutations))
fungiData <- data.frame(mutations, group, logMutations)
fungiData

tapply(X = mutations, INDEX = group, FUN = summary)
library(tidyverse)
fungiSummary <- fungiData %>% group_by(group) %>% summarise(Min = min(mutations), Q1 = quantile(mutations, 0.25), Median = quantile(mutations, 0.5), Mean = mean(mutations), Q3 = quantile(mutations, 0.75), Max = max(mutations))
fungiSummary

ggplot(data = fungiData, aes(x = mutations)) + geom_density(fill = "grey") + facet_grid(. ~ group)

ggplot(data = fungiData, aes(y = mutations)) + geom_boxplot(aes(group = group))

qqnorm(fungiData$mutations)
qqline(y = fungiData$mutations)      

#log transform EDA
logfungiSummary <- fungiData %>% group_by(group) %>% summarise(Min = min(logMutations), Q1 = quantile(logMutations, 0.25), Median = quantile(logMutations, 0.5), Mean = mean(logMutations), Q3 = quantile(logMutations, 0.75), Max = max(logMutations))
logfungiSummary

ggplot(data = fungiData, aes(x = logMutations)) + geom_density(fill = "grey") + facet_grid(. ~ group)

ggplot(data = fungiData, aes(y = logMutations)) + geom_boxplot(aes(group = group))

qqnorm(fungiData$logMutations)
qqline(y = fungiData$logMutations)  


test <- t.test(logMutations~group, data = fungiData)
test2 <- t.test(logMutations~group, data = fungiData, var.equal = TRUE)
test2

S1 <- sd(filter(fungiData, group == "Treatment")$logMutations)
n1 <- 8
S2 <- sd(filter(fungiData, group == "Control")$logMutations)
n2 <- 7

Sp <- sqrt(((n1-1)*S1^2+(n2-1)*S2^2)/(n1+n2-2))
Vbar1 <- 1.679
Vbar2 <- 1.52
(Vbar1-Vbar2)/(Sp*sqrt((1/n1+1/n2)))

(Vbar1-Vbar2)/sqrt((S1^2/n1+S2^2/n2))

#PCM6c
#null distribution with RR
x <- seq(from = -5, to = 5, length = 5000)
plot(x, dt(x,df = 13), main = "Null Distribution with Rejection Region", xlab = "tobs", ylab = "PDF", type = "l", lwd = 2)
x2 <- seq(from = qt(df = 13, 0.95), to = 5, length = 5000)
polygon(c(x2, rev(x2)), c(dt(x2, df = 13), rep(0, length(x2))), col = "Grey")
text(x = qt(df=13, 0.95), y = -0.002, round(qt(df=13, 0.95), 3), cex = 1.5)
abline(v = 0.8488, col = "Blue", lwd = 3)

#pvalue
x <- seq(from = -5, to = 5, length = 5000)
plot(x, dt(x,df = 13), main = "Null Distribution with P-value", xlab = "tobs", ylab = "PDF", type = "l", lwd = 2)
x2 <- seq(from = 0.8488, to = 5, length = 5000)
polygon(c(x2, rev(x2)), c(dt(x2, df = 13), rep(0, length(x2))), col = "Purple")

1-pt(0.8488, df =13)
text(x = 0.8488, y = -0.002, 0.8488, cex = 1.5)


#null and alternative distribution
#null distribution with RR
x <- seq(from = -4, to = 4, length = 5000)
plot(x, dnorm(x), main = "Null Distribution with Rejection Region", xlab = "zobs", ylab = "PDF", type = "l", lwd = 2)
x2 <- seq(from = qnorm(0.95), to = 4, length = 5000)
polygon(c(x2, rev(x2)), c(dnorm(x2), rep(0, length(x2))), col = "Grey")


x <- seq(from = -4, to = 4, length = 5000)
plot(x, dnorm(x), main = "Null Distribution with Rejection Region", xlab = expression(bar(y)), ylab = "PDF", type = "l", lwd = 2, xaxt = "n")
axis(side = 1, at = c(-3, -2, -1, 0, 1, 2, 3), labels = c(expression(mu[0]-3*sigma / sqrt(n)), expression(mu[0]-2*sigma / sqrt(n)),expression(mu[0]-1*sigma / sqrt(n)),expression(mu[0]),expression(mu[0]+sigma / sqrt(n)),expression(mu[0]+2*sigma / sqrt(n)),expression(mu[0]+3*sigma / sqrt(n))))
x2 <- seq(from = qnorm(0.95), to = 4, length = 5000)
polygon(c(x2, rev(x2)), c(dnorm(x2), rep(0, length(x2))), col = "Grey")
