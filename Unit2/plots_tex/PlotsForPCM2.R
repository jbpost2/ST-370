########################################
##File with creation of plots and things 
##for Unit 2 370 redesign
########################################

#####################################
#PCM2a
library(fivethirtyeight)
library(tidyverse)

#using oxford comma data set
subComma <- select(comma_survey, age, education, care_oxford_comma) %>% filter(!is.na(age) & !is.na(education) & !is.na(care_oxford_comma))
View(subComma)
#obtain new columns/summaries for college degree vs no degree, and care a lot vs other
subComma <- subComma %>% mutate(degree = ifelse(education %in% c("Bachelor degree", "Graduate degree"), "College Degree", "No College Degree"), Care = ifelse(care_oxford_comma == "A lot", "A lot", "Not a lot"))
table(subComma$degree, subComma$Care)
p1hat <- 181/(181+439)
p2hat <- 97/(97+309)
p1hat - p2hat
sqrt((p1hat*(1-p1hat)/(181+439)) + (p2hat*(1-p2hat)/(97+309)))

#bar plots
ggplot(subComma, aes(x = degree)) + geom_bar()
ggsave("F:\\ServiceStuff\\ST370\\Unit2\\barPlotDegree.png")
ggplot(subComma, aes(x = Care)) + geom_bar()
ggsave("F:\\ServiceStuff\\ST370\\Unit2\\barPlotCare.png")
ggplot(subComma, aes(x = Care)) + geom_bar(aes(fill = degree))
ggsave("F:\\ServiceStuff\\ST370\\Unit2\\barPlotCareDegree.png")
ggplot(subComma, aes(x = degree)) + geom_bar(aes(fill = Care))
ggsave("F:\\ServiceStuff\\ST370\\Unit2\\barPlotDegreeCare.png")
ggplot(subComma, aes(x = degree)) + geom_bar(aes(fill = Care), position = "dodge")
ggsave("F:\\ServiceStuff\\ST370\\Unit2\\barPlotCareDegreeSideBySide.png")
ggplot(subComma, aes(x = degree)) + geom_bar(aes(fill = Care), position = "fill")
ggsave("F:\\ServiceStuff\\ST370\\Unit2\\barPlotCareDegreeFill.png")
ggplot(comma_survey %>% na.omit(), aes(x = education)) + geom_bar(aes(fill = care_oxford_comma), position = "dodge") + scale_fill_discrete(name = "Level of Caring") + coord_flip()
ggsave("F:\\ServiceStuff\\ST370\\Unit2\\barPlotManyCats.png")



#####################################
#PCM2b

########################################3
###simulation of phat

#true p, n
p <- 0.25
n <- 100
set.seed(1)
one <- rbinom(n, prob = p, size =1)
sum(one)/n
two <- rbinom(n, prob = p, size =1)
sum(two)/n

phats <- rbinom(10000, prob = p, size = n)/n
png(filename = "SampDistPhat.png")
hist(phats, main = paste("Sampling Distribution with n = ", n, " and True p = ", p, sep = ""), xlab = "Sample Proportions", ylab = "Frequency", breaks = 100)
dev.off()

yprobs <- dbinom(0:n, size = n, prob = p )
png(filename = "SampDistPhatDensity.png")
h <- hist(phats, breaks = 100, plot = FALSE)
hist(phats, main = "Sampling Distribution", xlab = "Sample Proportions", ylab = "Probabilities", breaks = 100, freq = TRUE, yaxt = "n")
axis(side = 2, at = seq(from = 0, to = max(h$counts), by = max(h$counts)/4), labels = round(seq(from = 0, to = max(yprobs), by = max(yprobs)/4), 2))
dev.off()

mean(phats <= 0.5)


########################################3
###simulation of p1hat-p2hat

#true p, n
p1 <- p2 <- 0.25
n <- 100
set.seed(3)

phatDiffs <- rbinom(10000, prob = p1, size = n)/n - rbinom(10000, prob = p2, size = n)/n
png(filename = "SampDistDiffPhat.png")
hist(phatDiffs, main = paste("Sampling Distribution with n = ", n, " and \n True proportions both = ", p1, sep = ""), xlab = "Difference in Sample Proportions", ylab = "Frequency", breaks = 100)
dev.off()


#true p, n
p1 <- 0.25
p2 <- 0.20
n <- 100
set.seed(3)

phatDiffs <- rbinom(10000, prob = p1, size = n)/n - rbinom(10000, prob = p2, size = n)/n
png(filename = "SampDistDiffPhat2.png")
hist(phatDiffs, main = paste("Sampling Distribution with n = ", n, " and \n proportions of ", p1, " and ", p2, sep = ""), xlab = "Difference in Sample Proportions", ylab = "Frequency", breaks = 100)
dev.off()


#Plot of ber RV
p <- 0.25
yprobs <- dbinom(0:1, size = 1, prob = p)
png(filename = "BerDensity.png")
plot(x = 0:1, y = yprobs, lwd = 3, type = "h", xlab = "y values", ylab = "P(Y = y)", main = "Bernoulli PMF", ylim = c(0, 1), xlim = c(-0.1, 1.1))
abline(h = 0, lwd = 2)
dev.off()


#binomial plots
n <- 25
p <- 0.1
yprobs <- dbinom(0:n, size = n, prob = p)
png(filename = "Bin25-0.1.png")
plot(x = 0:n, y = yprobs, lwd = 3, type = "h", xlab = "y values", ylab = "P(Y = y)", main = paste("Binomial PMF with n = ", n, " and p = ", p, sep =""))
abline(h = 0, lwd = 2)
dev.off()

n <- 25
p <- 0.2
yprobs <- dbinom(0:n, size = n, prob = p)
png(filename = "Bin25-0.2.png")
plot(x = 0:n, y = yprobs, lwd = 3, type = "h", xlab = "y values", ylab = "P(Y = y)", main = paste("Binomial PMF with n = ", n, " and p = ", p, sep =""))
abline(h = 0, lwd = 2)
dev.off()

n <- 25
p <- 0.4
yprobs <- dbinom(0:n, size = n, prob = p)
png(filename = "Bin25-0.4.png")
plot(x = 0:n, y = yprobs, lwd = 3, type = "h", xlab = "y values", ylab = "P(Y = y)", main = paste("Binomial PMF with n = ", n, " and p = ", p, sep =""))
abline(h = 0, lwd = 2)
dev.off()

n <- 100
p <- 0.2
yprobs <- dbinom(0:n, size = n, prob = p)
png(filename = "Bin100-0.2.png")
plot(x = 0:n, y = yprobs, lwd = 3, type = "h", xlab = "y values", ylab = "P(Y = y)", main = paste("Binomial PMF with n = ", n, " and p = ", p, sep =""))
abline(h = 0, lwd = 2)
dev.off()


##Color probs
n <- 25
p <- 0.2
yprobs <- dbinom(0:n, size = n, prob = p)
png(filename = "Bin25-0.2Prob.png")
plot(x = 0:n, y = yprobs, lwd = 3, type = "h", xlab = "y values", ylab = "P(Y = y)", main = paste("Binomial PMF with n = ", n, " and p = ", p, sep =""), col = c(rep("black", 9), rep("blue", 17)))
text(x = 17, y = 0.1, "Blue corresponds to \n desired probability", cex = 2.5)
abline(h = 0, lwd = 2)
dev.off()

1 - pbinom(8, size = 25, prob = 0.2)



n <- 25
p <- 0.2
yprobs <- dbinom(0:n, size = n, prob = p)
png(filename = "Bin25-0.2Prob2.png")
plot(x = 0:n, y = yprobs, lwd = 3, type = "h", xlab = "y values", ylab = "P(Y = y)", main = paste("Binomial PMF with n = ", n, " and p = ", p, sep =""), col = c(rep("black", 10), rep("blue", 16)))
text(x = 17, y = 0.1, "Blue corresponds to \n desired probability", cex = 2.5)
abline(h = 0, lwd = 2)
dev.off()

1 - pbinom(9, size = 25, prob = 0.2)



n <- 25
p <- 0.2
yprobs <- dbinom(0:n, size = n, prob = p)
png(filename = "Bin25-0.2Prob3.png")
plot(x = 0:n, y = yprobs, lwd = 3, type = "h", xlab = "y values", ylab = "P(Y = y)", main = paste("Binomial PMF with n = ", n, " and p = ", p, sep =""), col = c(rep("blue", 5), rep("black", 21)))
text(x = 17, y = 0.1, "Blue corresponds to \n desired probability", cex = 2.5)
abline(h = 0, lwd = 2)
dev.off()

pbinom(4, size = 25, prob = 0.2)


######Normal dist probs
png(filename = "BinNorm.png")
mean <- 0.2
var <- 0.0016
n <- 100
p <- 0.2
yprobs <- dbinom(0:n, size = n, prob = p)
plot(x = (0:n)/n, y = yprobs, lwd = 2, type = "h", xlab = "y values", ylab = "P(Y = y)", main = paste("Binomial PMF with n = ", n, " and p = ", p, sep =""), xlim = c(0,.4))
abline(h = 0, lwd = 1)
curve(dnorm(x, mean = mean, sd = sqrt(var))/n, from = 0.05, to =0.35, main = "Approximate Distribution of the Sample Proportion", ylab = "PDF", xlab = "phat values", add = TRUE, lwd = 2)
dev.off()


######Normal dist probs
png(filename = "NormProb.png")
mean <- 0.2
var <- 0.0016
curve(dnorm(x, mean = mean, sd = sqrt(var)), from = 0.05, to =0.35, main = "Approximate Distribution of the Sample Proportion", ylab = "PDF", xlab = "phat values")
polygon(x = c(seq(0.05, 0.15, length = 100), rev(seq(0.05,0.15, length = 100))), y = c(rep(0,100), dnorm(rev(seq(0.05, 0.15, length = 100)), mean = mean, sd = sqrt(var))), col = "blue")
text(x = 0.275, y = 06, "Blue corresponds to \n desired probability", cex = 1.5)
dev.off()

png(filename = "StdNormProb.png")
mean <- 0
var <- 1
curve(dnorm(x, mean = mean, sd = sqrt(var)), from = -3, to = 3, main = "Approximate Distribution of the Standardized Sample Proportion", ylab = "PDF", xlab = "z values")
polygon(x = c(seq(-3, -1.25, length = 100), rev(seq(-3, -1.25, length = 100))), y = c(rep(0,100), dnorm(rev(seq(-3, -1.25, length = 100)), mean = mean, sd = sqrt(var))), col = "blue")
text(x = 1.25, y = 0.3, "Blue corresponds to \n desired probability", cex = 1.5)
dev.off()

pnorm(-1.25)
#exact prob
pbinom(14, size = 100, prob = 0.2)

###############################################
#CI calc
181/620 - 97/406
sqrt((181/620)*(1-181/620)/620 + (97/406)*(1-97/406)/406)
181/620 - 97/406 - 1.96*sqrt((181/620)*(1-181/620)/620 + (97/406)*(1-97/406)/406)
181/620 - 97/406 + 1.96*sqrt((181/620)*(1-181/620)/620 + (97/406)*(1-97/406)/406)



#Normal distribution graphs for CI derivation
png(filename = "NormCI.png", width = 720, height = 480)
curve(dnorm(x), from = -3, to = 3, lwd = 2, xlab = "z values", ylab = "PDF", n = 200)
abline(v = c(-1.96, 1.96), lwd = 2, col = "blue")
text(x = 0, y = 0.1, "95% of values", col = "blue", cex = 2)
dev.off()

#Normal distribution graphs for CI derivation
png(filename = "NormCI2.png", width = 720, height = 480)
curve(dnorm(x), from = -3, to = 3, lwd = 2, xlab = expression(paste(hat(p), " values")), ylab = "PDF", n = 200, xaxt = "n")
abline(v = c(-1.96, 1.96), lwd = 2, col = "blue")
text(x = 0, y = 0.1, "95% of values", col = "blue", cex = 2)
axis(side = 1, at = c(-3, -2, -1, 0, 1, 2, 3), labels = c("p-3SE", "p-2SE", "p-SE", "p", "p+SE", "p+2SE", "p+3SE"))
dev.off()


#Application examples
speedData <- data.frame(Favor = c("Yes", "No"), Count = c(276, 204))
ggplot(speedData, aes(x = Favor, y = Count)) + geom_bar(stat = "identity")
ggsave("E:\\ServiceStuff\\ST370\\Unit2\\barPlotSpeed.png")
(276/480)-2.58*sqrt((276/480)*(1-276/480)/480)
(276/480)+2.58*sqrt((276/480)*(1-276/480)/480)

speedData2 <- data.frame(Favor = c("Yes", "No", "Yes", "No"), Location = c("Urban", "Urban", "Rural", "Rural"), Count = c(175, 115, 101, 89))

ggplot(speedData2, aes(x = Location, y = Count, fill = Favor)) + geom_bar(stat = "identity")
ggsave("E:\\ServiceStuff\\ST370\\Unit2\\barPlotSpeed2.png")

175/290 - 101/190
p1 <- 175/290
p2 <- 101/190
sqrt(p1*(1-p1)/290+p2*(1-p2)/190)
0.072-2.58*sqrt(p1*(1-p1)/290+p2*(1-p2)/190)
0.072+2.58*sqrt(p1*(1-p1)/290+p2*(1-p2)/190)
