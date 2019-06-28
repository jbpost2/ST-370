########################################
##File with creation of plots and things 
##for Unit 5 370 redesign
########################################

#####################################
#PCM5a

#####################################
#PCM5b
n <- 11
y <- rnorm(n, mean = 10, sd = 3)
sorty <- sort(y)
quants <- round((1:n-0.5)/n, 3) 
zvals <- qnorm(quants)

round(data.frame(sorted = round(sorty, 1) , observedQuant = quants, theoreticalQuant = zvals), 3)

png(filename = "QQPlotN(10,9).png", width = 800, height = 480)
qqplot(x = zvals, y = sorty, xlab = "Theoretical Normal Quantiles", ylab = "Sorted Observed Values", main = "Observed Data from a N(10, 9)", ylim = c(2,14))
qqline(y = sorty)
dev.off()

png(filename = "QQPlotGridNormal.png", width = 800, height = 480)
par(mfrow = c(2, 2))

n <- 100
mean <- 100
sd <- 10
y <- rnorm(n, mean = mean, sd = sd)
qqnorm(y = y, xlab = "Theoretical Normal Quantiles", ylab = "Sorted Observed Values", main = paste("Observed Data (n = ", n, ") from a N(", mean, ", ", sd^2, ")", sep = ""))
qqline(y = y)

n <- 30
mean <- -5
sd <- 10
y <- rnorm(n, mean = mean, sd = sd)
qqnorm(y = y, xlab = "Theoretical Normal Quantiles", ylab = "Sorted Observed Values", main = paste("Observed Data (n = ", n, ") from a N(", mean, ", ", sd^2, ")", sep = ""))
qqline(y = y)

n <- 1000
mean <- 0
sd <- 1
y <- rnorm(n, mean = mean, sd = sd)
qqnorm(y = y, xlab = "Theoretical Normal Quantiles", ylab = "Sorted Observed Values", main = paste("Observed Data (n = ", n, ") from a N(", mean, ", ", sd^2, ")", sep = ""))
qqline(y = y)

n <- 30
mean <- 2
sd <- 5
y <- rnorm(n, mean = mean, sd = sd)
qqnorm(y = y, xlab = "Theoretical Normal Quantiles", ylab = "Sorted Observed Values", main = paste("Observed Data (n = ", n, ") from a N(", mean, ", ", sd^2, ")", sep = ""))
qqline(y = y)
dev.off()


png(filename = "QQPlotGridOther.png", width = 800, height = 480)
par(mfrow = c(2, 2))

n <- 100
rate <- 10
y <- rexp(n, rate = rate)
qqnorm(y = y, xlab = "Theoretical Normal Quantiles", ylab = "Sorted Observed Values", main = paste("Observed Data (n = ", n, ") from a Exp(", rate, ")", sep = ""))
qqline(y = y)

n <- 10
rate <- 10
y <- rexp(n, rate = rate)
qqnorm(y = y, xlab = "Theoretical Normal Quantiles", ylab = "Sorted Observed Values", main = paste("Observed Data (n = ", n, ") from a Exp(", rate, ")", sep = ""))
qqline(y = y)

n <- 100
mean <- 30
y <- rpois(n, lambda = mean)
qqnorm(y = y, xlab = "Theoretical Normal Quantiles", ylab = "Sorted Observed Values", main = paste("Observed Data (n = ", n, ") from a Poi(", mean, ")", sep = ""))
qqline(y = y)

n <- 100
mean <- 3
y <- rpois(n, lambda = mean)
qqnorm(y = y, xlab = "Theoretical Normal Quantiles", ylab = "Sorted Observed Values", main = paste("Observed Data (n = ", n, ") from a Poi(", mean, ")", sep = ""))
qqline(y = y)
dev.off()



png(filename = "CLTUnif.png", width = 500, height = 480)
par(mfrow = c(2, 1))
y <- seq(0, 1, length = 100)
n <- 8
N <- 100000
plot(x = y, y = dunif(y), type = "l", ylim = c(0, 1.1), main = "Population Distribution", ylab = "PDF")
means <- replicate(n = N, mean(runif(n)))
hist(means, main = paste("Approximate Distribution of Sample Mean\n with n = ", n), xlab = "sample mean values", freq = FALSE)
x <- seq(from = 0, to = 1, length = 1000)
lines(x =x, y = dnorm(x, mean = 0.5, sd = 1/sqrt(12*n)), lwd = 2, type = "l")
dev.off()


png(filename = "CLTGamma.png", width = 500, height = 480)
par(mfrow = c(2, 1))
y <- seq(0, 10, length = 1000)
n <- 15
N <- 100000
shape = 8
rate = 2
plot(x = y, y = dgamma(y, shape = shape, rate = rate), type = "l", main = "Population Distribution", ylab = "PDF")
means <- replicate(n = N, mean(rgamma(n, shape = shape, rate = rate)))
hist(means, main = paste("Approximate Distribution of Sample Mean\n with n = ", n), xlab = "sample mean values", freq = FALSE)
x <- seq(from = 0, to = 10, length = 1000)
lines(x =x, y = dnorm(x, mean = shape/rate, sd = sqrt(shape/(rate^2*n))), lwd = 2, type = "l")
dev.off()


png(filename = "CLTExp1.png", width = 500, height = 480)
par(mfrow = c(2, 1))
y <- seq(0, 5, length = 1000)
n <- 15
N <- 100000
shape <- 1
rate = 1
plot(x = y, y = dgamma(y, shape = shape, rate = rate), type = "l", main = "Population Distribution", ylab = "PDF")
means <- replicate(n = N, mean(rgamma(n, shape = shape, rate = rate)))
hist(means, main = paste("Approximate Distribution of Sample Mean\n with n = ", n), xlab = "sample mean values", freq = FALSE)
x <- seq(from = 0, to = 5, length = 1000)
lines(x =x, y = dnorm(x, mean = shape/rate, sd = sqrt(shape/(rate^2*n))), lwd = 2, type = "l")
dev.off()


png(filename = "CLTExp2.png", width = 500, height = 480)
par(mfrow = c(2, 1))
y <- seq(0, 5, length = 1000)
n <- 30
N <- 100000
shape <- 1
rate = 1
plot(x = y, y = dgamma(y, shape = shape, rate = rate), type = "l", main = "Population Distribution", ylab = "PDF")
means <- replicate(n = N, mean(rgamma(n, shape = shape, rate = rate)))
hist(means, main = paste("Approximate Distribution of Sample Mean\n with n = ", n), xlab = "sample mean values", freq = FALSE)
x <- seq(from = 0, to = 5, length = 1000)
lines(x =x, y = dnorm(x, mean = shape/rate, sd = sqrt(shape/(rate^2*n))), lwd = 2, type = "l")
dev.off()


png(filename = "CLTExp3.png", width = 500, height = 480)
par(mfrow = c(2, 1))
y <- seq(0, 5, length = 1000)
n <- 100
N <- 100000
shape <- 1
rate = 1
plot(x = y, y = dgamma(y, shape = shape, rate = rate), type = "l", main = "Population Distribution", ylab = "PDF")
means <- replicate(n = N, mean(rgamma(n, shape = shape, rate = rate)))
hist(means, main = paste("Approximate Distribution of Sample Mean\n with n = ", n), xlab = "sample mean values", freq = FALSE)
x <- seq(from = 0, to = 5, length = 1000)
lines(x =x, y = dnorm(x, mean = shape/rate, sd = sqrt(shape/(rate^2*n))), lwd = 2, type = "l")
dev.off()



#####################################
#PCM5b

t <- seq(from = -5, to =5, length = 5000)
plot(t, dnorm(t), type = "l", ylab = "PDF", xlab = "t values", lwd = 2)
color <- c("Blue", "Green", "Purple", "Yellow", "Red")
df <- c(1,2,5,10,30)
for(i in 1:5){
  lines(t, dt(t, df = df[i]), type = "l", col = color[i], lwd = 2)
}
legend(x = "topright", legend = c(df, "Infinity"), fill = c(color, "Black"), col = c(color, "Black"), lwd = 2, title = "Degrees of Freedom")


#####################################
#PCM5c

#generation of electricity use data
n <- 300
#variable rate will be slightly lower but not practically significant
set.seed(101)
variable <- round(rgamma(n, shape = 10, rate = 1/20))
standard <- variable + round(rnorm(300, mean = 5, sd = 15))

electricity <- data.frame(variable, standard, difference = variable - standard)
View(electricity)

summary2 <- function(x){
  val <- c(summary(x), sd(x))
  names(val)[7] <- "SD"
  return(val)
}
summary2(electricity$variable)
round(apply(FUN = summary2, electricity, MARGIN = 2),1)

electricity2 <- data.frame(kWh = c(electricity$variable, electricity$standard), Group = c(rep("Variable", 300), rep("Standard", 300)))
library(ggplot2)
ggplot(data = electricity2, aes(x = Group, y = kWh)) + geom_boxplot()
ggplot(data = electricity, aes(y = difference)) + geom_boxplot()

ggplot(data = electricity2, aes(x = kWh)) + geom_histogram() + facet_grid(.~Group)
ggplot(data = electricity, aes(x = difference)) + geom_histogram() 

qqnorm(electricity$difference)

mean(electricity$difference) - qt(df = 299, 0.975)*sd(electricity$difference)/sqrt(300)
mean(electricity$difference) + qt(df = 299, 0.975)*sd(electricity$difference)/sqrt(300)

plot(t, dt(df = 299, t), lwd = 2, type = "l", main = "t multiplier")
t2 <- seq(from = -5, to = qt(df=299, 0.975), length = 5000)
polygon(c(t2, rev(t2)), c(dt(df = 299, t2), rep(0, length(t2))), col = "Grey")
abline(v = qt(df = 299, 0.975), col = "Blue", lwd = 2)
text(x = qt(df = 299, 0.975)+0.75, y = 0.07, round(qt(df=299, 0.975), 3), cex = 2)
text(x=0, y = 0.15, "95% of Area", cex = 1.5)

plot(t, dt(df = 20, t), lwd = 2, type = "l", main = "t multiplier with alpha = 0.1")
abline(v = qt(df = 20, c(0.05, 0.95)), col = "Blue", lwd = 2)
t2 <- seq(from = qt(df=20, 0.05), to = qt(df=20, 0.95), length = 5000)
polygon(c(t2, rev(t2)), c(dt(df = 20, t2), rep(0, length(t2))), col = "Grey")
text(x=0, y = 0.15, "90% of Area", cex = 1.5)
text(x=3.5, y = 0.05, "5% of Area", cex = 1.5)
text(x=-3.5, y = 0.05, "5% of Area", cex = 1.5)
