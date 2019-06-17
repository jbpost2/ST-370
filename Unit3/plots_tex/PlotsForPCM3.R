########################################
##File with creation of plots and things 
##for Unit 3 370 redesign
########################################

#####################################
#PCM3a

#####################################
#PCM3b

#####################################
#PCM3c

#plots of sampling distribution for ionized example
png(filename = "HTIdeaPlot1.png", width = 800, height = 480)
mean <- 0
var <- 1
curve(dnorm(x, mean = mean, sd = sqrt(var)), from = -5, to = 5, main = "Approximate Distribution of Z", ylab = "PDF", xlab = "z values", lwd = 2)
abline(v = 4.17, lwd = 2, col = "Blue")
text(x = 4.1, y = 0.3, "Observed\n test stat", cex=2.5)
polygon(x = c(seq(-1.96, 1.96, length = 200), rev(seq(-1.96, 1.96, length = 200))), y = c(rep(0,200), dnorm(rev(seq(-1.96, 1.96, length = 200)), mean = mean, sd = sqrt(var))), col = "grey")
text(x = 0, y = 0.1, "95% of the time we \n oberve z here", cex = 1.95)
dev.off()


#plots of sampling distribution for ionized example
png(filename = "RRVis.png", width = 800, height = 480)
mean <- 0
var <- 1
curve(dnorm(x, mean = mean, sd = sqrt(var)), from = -5, to = 5, main = "Approximate Distribution of Z", ylab = "PDF", xlab = "z values", lwd = 1)
polygon(x = c(seq(-5, 1.645, length = 200), rev(seq(-5, 1.645, length = 200))), y = c(rep(0,200), dnorm(rev(seq(-5, 1.645, length = 200)), mean = mean, sd = sqrt(var))), col = "grey")
text(x = -0.05, y = 0.1, "95% of the time we \n oberve z here", cex = 1.95)
abline(v = 1.645, lwd = 2, col = "Blue")
text(x = 3, y = 0.025, "Rejection Region", cex=1.75, col = "blue")
dev.off()



#RR Example
png(filename = "RRVisExample.png", width = 800, height = 480)
mean <- 0
var <- 1
curve(dnorm(x, mean = mean, sd = sqrt(var)), from = -5, to = 5, main = "Approximate Distribution of Z", ylab = "PDF", xlab = "z values", lwd = 1)
polygon(x = c(seq(-5, -2.33, length = 200), rev(seq(-5, -2.33, length = 200))), y = c(rep(0,200), dnorm(rev(seq(-5, -2.33, length = 200)), mean = mean, sd = sqrt(var))), col = "grey")
text(x = 0.05, y = 0.1, "99% of the time we \n oberve z here", cex = 1.95)
abline(v = -2.33, lwd = 2, col = "Blue")
text(x = -4, y = 0.025, "Rejection Region", cex=1.75, col = "blue")
dev.off()


#plots p-value 
png(filename = "Pvalue.png", width = 800, height = 480)
mean <- 0
var <- 1
curve(dnorm(x, mean = mean, sd = sqrt(var)), from = -5, to = 5, main = "Approximate Distribution of Z", ylab = "PDF", xlab = "z values", lwd = 1)
abline(v = 4.17, lwd = 2, col = "Green")
text(x = 4.1, y = 0.3, "Observed\n test stat", cex=2.5)
dev.off()


#plots p-value vs RR
png(filename = "RRPvalue.png", width = 800, height = 480)
mean <- 0
var <- 1
curve(dnorm(x, mean = mean, sd = sqrt(var)), from = 0, to = 5, main = "Approximate Distribution of Z", ylab = "PDF", xlab = "z values", lwd = 1)
polygon(x = c(seq(-5, 1.645, length = 200), rev(seq(-5, 1.645, length = 200))), y = c(rep(0,200), dnorm(rev(seq(-5, 1.645, length = 200)), mean = mean, sd = sqrt(var))), col = "grey")
abline(v = 1.645, lwd = 2, col = "Blue")
abline(v = 2, lwd = 2, col = "Green")
polygon(x = c(seq(2, 5, length = 200), rev(seq(2, 5, length = 200))), y = c(rep(0,200), dnorm(rev(seq(2, 5, length = 200)), mean = mean, sd = sqrt(var))), col = "purple")
dev.off()



#plots p-value vs RR
png(filename = "PValueExample.png", width = 800, height = 480)
mean <- 0
var <- 1
curve(dnorm(x, mean = mean, sd = sqrt(var)), from = -5, to = 5, main = "Approximate Distribution of Z", ylab = "PDF", xlab = "z values", lwd = 1)
polygon(x = c(seq(-5, -1.34, length = 200), rev(seq(-5, -1.34, length = 200))), y = c(rep(0,200), dnorm(rev(seq(-5, -1.34, length = 200)), mean = mean, sd = sqrt(var))), col = "grey")
abline(v = -1.34, lwd = 2, col = "Green")
dev.off()
