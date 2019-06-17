########################################
##File with creation of plots and things 
##for Unit 1 370 redesign
########################################

#####################################
#PCMa
library(tidyverse)
library(graphics)
#center plots
curve(dgamma(x,shape=1,rate=4),main="Center of Population", from=0,to=1.2, xlab="Variable",ylab="Distribution", lwd=2
    )
abline(v=1/4,lwd=3,col="Blue")
abline(v=qgamma(0.5,shape=1,rate=4),lwd=3,col="Orange")
text(x=0.34, y=3,"Mean",col="Blue",lwd=3)
text(x=0.05,y=1,col="Orange","Median",lwd=3)

set.seed(10)
values <- rgamma(70,shape=1,rate=4)
hist(values, main="Center of Sample", xlab="Variable",ylab="Frequency",breaks=8)
abline(v=mean(values),lwd=3,col="Blue")
abline(v=median(values),lwd=3,col="Orange")
text(x=0.3, y=20,"Mean",col="Blue",lwd=3)
text(x=0.06,y=10,col="Orange","Median",lwd=3)

#spread plots (variance)
curve(dnorm(x,mean=3,sd=1),main="Spread Measures", from=-3,to=9, xlab="Variable",ylab="Distribution", lwd=2
, col="Blue")
curve(dnorm(x,mean=3,sd=2), lwd=2,add=TRUE, col="Orange")
text(x=6.3, y=0.12,"More Variable",col="Orange",lwd=3)
text(x=5,y=0.3,col="Blue","Less Variable",lwd=3)

values <- rgamma(70,shape=1,rate=4)
values2 <- rnorm(70, mean = 0.75, sd = 1/10)
h1 <- hist(values, plot = FALSE)
h2 <- hist(values2, plot = FALSE)
hist(values, main="Variation of Sample", xlab="Variable",ylab="Rel Freq",breaks=8, freq = FALSE, col=rgb(1,0,0,0.5), ylim = c(0, max(h1$density, h2$density)))
hist(values2, add = TRUE, freq = FALSE,col=rgb(0,0,1,0.5))
text(x = 1, y = 3, "Less Variable", lwd = 3, col = rgb(0,0,1))
text(x = 0.2, y = 3, "More Variable", lwd = 3, col = rgb(1,0,0))

#quantile plots
curve(dgamma(x,shape = 1, rate = 2),main="Q1 (0.25 Quantile or 25th %ile)", from=0,to=2, xlab="Variable",ylab="Distribution", lwd=2
			, col="Blue")
polygon(x = c(seq(0, qgamma(0.25, shape = 1, rate = 2), length = 100), rev(seq(0, qgamma(0.25, shape = 1, rate = 2), length = 100))), y = c(rep(0,100), dgamma(qgamma(rev(seq(0, 0.25, length = 100)), shape =1, rate = 2), shape =1, rate = 2)), col = "Grey")
text(x = 1, y = 0.85, paste("0.25 quantile is ", round(qgamma(0.25, shape = 1, rate = 2),2)), cex = 1.7)
arrows(x0=1, y0= 0.75, x1 = qgamma(0.25, shape = 1, rate = 2), y1 = 0, lwd = 3)

#sample version, shade 1st bar
summary(values)
h3 <- hist(values, freq = FALSE, main = "Sample Q1", breaks = seq(from = 0, to =1.55+0.075, by = 0.075))
hist(values, freq = FALSE, main = "Sample Q1", breaks = seq(from = 0, to =1.55+0.075, by = 0.075), col = c("Blue", rep("White",length(h3$counts)-1)))
text(x = 0.75, y = 2, paste("0.25 quantile is ", round(quantile(values, p = 0.25),3)), cex = 1.7)
arrows(x0=0.7, y0= 1.9, x1 = quantile(values, p = 0.25), y1 = 0, lwd = 3)


#mean and variance
x <- c(21, 24, 25, 25, 28, 34, 41)
var(x)
sd(x)
summary(x)
IQR(x)

hist(x, main = "Histogram of Parent Ages", xlab = "Parent Age")

barplot(t(c(2,5)), names.arg = c("No Vac", "Vac"), xlab = "Vaccine Status")

#mean and variance population example graphs
#install.packages("FAdist")
library(FAdist)
x <- seq(from = 14, to = 50, by = 0.05)
shape = 10
scale = 1.25
thres = 14
plot(x, dgamma3(x, shape, scale, thres), type = "l", lwd = 2, xlab = "Age", ylab = "PDF", main = "Approximate Population of Parent Ages")

#add in mean
abline(v = shape*scale + 14, lwd = 3, col = "Blue")
#add in median
abline(v = qgamma3(0.5, shape, scale, thres), lwd = 3, col = "Green")
xshade <- seq(from = 14, to = qgamma3(0.5, shape, scale, thres), by = 0.05)
polygon(x = c(xshade, rev(xshade)), y = c(dgamma3(xshade, shape, scale, thres), rep(0, length(xshade))), col = "Grey")

#try to create mean/median animation
library(animation)
#transparent colors
#note: always pass alpha on the 0-255 scale
makeTransparent<-function(someColor, alpha=100){
	newColor<-col2rgb(someColor)
	apply(newColor, 2, function(curcoldata){rgb(red=curcoldata[1], green=curcoldata[2],
																							blue=curcoldata[3],alpha=alpha, maxColorValue=255)})
}

#sequence for plotting
x <- seq(from=0, to = 1, length = 500)

#sequences for beta distribution
shape1.5 <-c(seq(from=1,to=4,length=75), seq(from=4.05, to = 5, length=10), seq(from=5,to=15,length=50))
shape2.5 <- c(rep(1,100),seq(from=1,to=15,length=35))
shape1 <- c(shape1.5,rev(shape2.5))
shape2 <- c(shape2.5,rev(shape1.5))

# clear history before recording
ani.record(reset = TRUE) 

#note that par("usr") gives min and max of graph (xmin, ymin, xmax, ymax)
for(i in 1:length(shape1)){
	#beta curve
	curve(dbeta(x,shape1=shape1[i], shape2=shape2[i]), ylab="Density", xlab="Variable", main = "Plot of Mean and Median", ylim=c(0,max(dbeta(x,shape1=shape1[i],shape2=shape2[i])+0.5)), lwd=2)
	#first obtain max of graph
	maxy <- par("usr")[4]

	#add arrow for mean
	arrows(x0 = shape1[i]/(shape1[i]+shape2[i]), y1 = 0, y0 = maxy/2, col = makeTransparent("Blue", alpha = 100), lwd = 3)
	text(expression(mu), x = shape1[i]/(shape1[i]+shape2[i]), y = maxy/2+maxy/16)

	#arrow for median
	arrows(x0 = qbeta(0.5, shape1=shape1[i], shape2=shape2[i]), y1 = 0, y0 = maxy/2, col = makeTransparent("Red", alpha = 100), lwd = 3)
	text("M", x = qbeta(0.5, shape1=shape1[i], shape2=shape2[i]), y = maxy/2+maxy/16)
	
	ani.record()
}

#preview it
oopts = ani.options(interval = 0.05)
ani.replay()
#save to video
saveVideo(ani.replay())


##################################3
##read in school data
library(readr)

##read in mcd data
mcData <- read_csv("McDonalds.csv")

#quant sum
hist(mcData$Cal_Fat, xlab="Calories from Fat", main = "Histogram")
summary(mcData$Cal_Fat)
var(mcData$Cal_Fat)
sd(mcData$Cal_Fat)
quantile(probs = 0.95,mcData$Cal_Fat)

#cat sum
table(mcData$Type)
reorder_size <- function(x) {
	factor(x, levels = names(sort(table(x))))
}
ggplot(mcData, aes(x = reorder_size(Type))) + geom_bar()+ xlab("Type")

countData <- mcData %>% count(Type)
mutate(countData, Prop = round(countData$n/sum(countData$n),2))

#breast cancer
breastData <- read_tsv("BreastCancer.dat")
hist(breastData$rectime, main = "Histogram of Recovery Time", xlab= "Recovery Time")
abline(v = mean(breastData$rectime), lwd = 3, col = "Blue")
text(x=1700, y = 70, paste("Mean", round(mean(breastData$rectime),2)), cex = 1.7)
abline(v = median(breastData$rectime), lwd = 3, col = "Purple")
text(x=600, y = 70, paste("Median", round(median(breastData$rectime),2)), cex = 1.7)

var(breastData$rectime)
sd(breastData$rectime)


#cat sum
table(breastData$meno)
ggplot(breastData, aes(x = reorder_size(meno))) + geom_bar()+ xlab("Menopause Status")

countData <- breastData %>% count(meno)
mutate(countData, Prop = round(countData$n/sum(countData$n),2))




###############################################
##PCMb
#read in pollution data
pollution <- read_csv("Unit1/data/pollution_us_2000_2016.csv")

png(filename = "O3Hist.png")
hist(pollution$O3Mean,freq = FALSE, ylim = c(0,40), main = "O3 Daily Means for Sites", xlab = "O3")
#reasonable gamma using (almost) MOM
alpha <- mean(pollution$O3Mean)^2/var(pollution$O3Mean)
lambda <- mean(pollution$O3Mean)/var(pollution$O3Mean) 
curve(dgamma(x, shape = alpha, rate = 0.9*lambda), add = TRUE)
dev.off()

png(filename = "O3FreqHist.png")
hist(pollution$O3Mean, main = "O3 Daily Means for Sites", xlab = "O3 Average")
dev.off()

#color probs
png(filename = "O3FreqHist.png")
h <- hist(pollution$O3Mean, main = "O3 Daily Means for Sites", xlab = "O3 Average")
col = c(rep("white", sum(h$breaks <= 0.04)), rep("red", sum(h$breaks > 0.04)))
hist(pollution$O3Mean, main = "O3 Daily Means for Sites", xlab = "O3 Average",col = col)
text(x = 0.07, y = 55000, paste0("Prob = ",round(sum(h$counts[h$breaks>0.04], na.rm = TRUE)/sum(h$counts, na.rm = TRUE), 3)), cex = 2)
dev.off()


png(filename = "O3PDF.png")
curve(dgamma(x, shape = alpha, rate = 0.9*lambda), from = 0, to =0.1, main = "PDF of Daily O3 Mean", ylab = "PDF", xlab = "O3 Values")
polygon(x = c(seq(0.04, 0.1, length = 100), rev(seq(0.04,0.1, length = 100))), y = c(rep(0,100), dgamma(rev(seq(0.04, 0.1, length = 100)), shape =alpha, rate = 0.9*lambda)), col = "red")
text(x = 0.07, y = 20, paste0("Prob = ",round(1-pgamma(0.04,shape=alpha, rate = 0.9*lambda), 3)), cex = 2)
dev.off()

#disjoint prob visual
png(filename = "O3Disjoint.png")
curve(dgamma(x, shape = alpha, rate = 0.9*lambda), from = 0, to =0.1, main = "PDF of Daily O3 Mean", ylab = "PDF", xlab = "O3 Values")
polygon(x = c(seq(0.04, 0.1, length = 100), rev(seq(0.04,0.1, length = 100))), y = c(rep(0,100), dgamma(rev(seq(0.04, 0.1, length = 100)), shape =alpha, rate = 0.9*lambda)), col = "red")
polygon(x = c(seq(0.02, 0.03, length = 100), rev(seq(0.02,0.03, length = 100))), y = c(rep(0,100), dgamma(rev(seq(0.02, 0.03, length = 100)), shape =alpha, rate = 0.9*lambda)), col = "Grey")
text(x = 0.07, y = 20, 
		 paste0("P(A or B) = ", 
		 			 round(1-pgamma(0.04,shape=alpha, rate = 0.9*lambda), 3), 
		 			 " + ", 
		 			 round(pgamma(0.03, shape = alpha, rate =0.9*lambda)-pgamma(0.02, shape = alpha, rate = 0.9*lambda), 3)
		 			 ,
		 			 "\n = ", 
		 			 round(1-pgamma(0.04,shape=alpha, rate = 0.9*lambda)+pgamma(0.03, shape = alpha, rate =0.9*lambda)-pgamma(0.02, shape = alpha, rate = 0.9*lambda),3)
		 			 ),
		 cex = 1.5)
dev.off()




#Additive rule prob visual
png(filename = "O3AddRule.png")
curve(dgamma(x, shape = alpha, rate = 0.9*lambda), from = 0, to =0.1, main = "PDF of Daily O3 Mean", ylab = "PDF", xlab = "O3 Values")
polygon(x = c(seq(0.03, 0.04, length = 100), rev(seq(0.03,0.04, length = 100))), y = c(rep(0,100), dgamma(rev(seq(0.03, 0.04, length = 100)), shape =alpha, rate = 0.9*lambda)), col = rgb(1,0,0,0.7))
polygon(x = c(seq(0.035, 0.045, length = 100), rev(seq(0.035,0.045, length = 100))), y = c(rep(0,100), dgamma(rev(seq(0.035, 0.045, length = 100)), shape =alpha, rate = 0.9*lambda)), col = rgb(0.5,0.5,0.5, 0.7))
text(x = 0.07, y = 20, 
		 paste0("P(A or B) = ", 
		 			 round(pgamma(0.04,shape=alpha, rate = 0.9*lambda)-pgamma(0.03,shape=alpha, rate = 0.9*lambda), 3), 
		 			 " + ", 
		 			 round(pgamma(0.045, shape = alpha, rate =0.9*lambda)-pgamma(0.035, shape = alpha, rate = 0.9*lambda), 3)
		 			 ,
		 			 "\n - ",
		 			 round(pgamma(0.04, shape = alpha, rate =0.9*lambda)-pgamma(0.035, shape = alpha, rate = 0.9*lambda), 3)
		 			 ,
		 			 " = ", 
		 			 round(pgamma(0.045,shape=alpha, rate = 0.9*lambda)-pgamma(0.03, shape = alpha, rate =0.9*lambda),3)
		 ),
		 cex = 1.5)
dev.off()



#complement probs
png(filename = "O3Complement.png")
curve(dgamma(x, shape = alpha, rate = 0.9*lambda), from = 0, to =0.1, main = "PDF of Daily O3 Mean", ylab = "PDF", xlab = "O3 Values")
polygon(x = c(seq(0.04, 0.1, length = 100), rev(seq(0.04,0.1, length = 100))), y = c(rep(0,100), dgamma(rev(seq(0.04, 0.1, length = 100)), shape =alpha, rate = 0.9*lambda)), col = "red")
text(x = 0.053, y = 20.35, bquote(P(A^c)), cex = 1.5)
text(x = 0.08, y = 20, paste0(" = 1-P(A) = ", round(pgamma(0.04,shape = alpha, rate = 0.9*lambda), 3)), cex = 1.5)
dev.off()


########################################3
###simulation of phat

#true p, n
p <- 0.75
n <- 20
set.seed(1)
one <- rbinom(n, prob = p, size =1)
sum(one)/n
two <- rbinom(n, prob = p, size =1)
sum(two)/n

phats <- rbinom(10000, prob = p, size = n)/n
png(filename = "SampDistPhat.png")
hist(phats, main = "Sampling Distribution", xlab = "Sample Proportions", ylab = "Frequency", breaks = 100)
dev.off()

yprobs <- dbinom(0:n, size = n, prob = p )
png(filename = "SampDistPhatDensity.png")
h <- hist(phats, breaks = 100, plot = FALSE)
hist(phats, main = "Sampling Distribution", xlab = "Sample Proportions", ylab = "Probabilities", breaks = 100, freq = TRUE, yaxt = "n")
axis(side = 2, at = seq(from = 0, to = max(h$counts), by = max(h$counts)/4), labels = round(seq(from = 0, to = max(yprobs), by = max(yprobs)/4), 2))
dev.off()

mean(phats <= 0.5)



#########Poisson probabilities
lambda <- 12
yprobs <- dpois(0:(lambda+2*lambda), lambda = lambda)
png(filename = "Poi12Prob.png")
plot(x = 0:(lambda+2*lambda), y = yprobs, lwd = 3, type = "h", xlab = "y values", ylab = "P(Y = y)", main = paste("Poisson PMF with mean = ", lambda, sep =""), col = c(rep("blue", 8), rep("black", 29)))
text(x = 26, y = 0.06, "Blue corresponds\n to desired\n probability", cex = 2)
dev.off()

ppois(7, lambda)


#########Exponential probabilities
lambda <- 12
#Additive rule prob visual
png(filename = "ExpProb.png")
curve(dexp(x, rate = lambda), from = 0, to = 0.6, main = "Exponential Distribution", ylab = "PDF", xlab = "f(y)", lwd = 2)
polygon(x = c(seq(0.25, 0.7, length = 100), rev(seq(0.25, 0.7, length = 100))), y = c(rep(0,100), dexp(rev(seq(0.25, 0.7, length = 100)), rate = lambda)), col = "Blue", lwd = 2)
text(x = 0.4, y = 6, "Blue corresponds to \n desired probability", cex = 2)
dev.off()
1-pexp(0.25, rate = 12)

###################################################
##PCM1c

#error bar graphic for quiz slide
breastData$meno[breastData$meno == "premenopausal"] <- "Premenopausal"
means <- aggregate(size~meno + hormon, data = breastData, FUN = mean)
sds <- aggregate(size~meno + hormon, data = breastData, FUN = sd)
colnames(sds)[3] <- "sd"
counts <- breastData %>% group_by(meno, hormon) %>% count()
barData <- inner_join(inner_join(means,sds), counts)
barData$se <- barData$sd/sqrt(barData$n)
colnames(barData)[2] <- "Hormone"
ggplot(barData, aes(x = meno, y = size, ymin = size - 2*se, ymax = size +2*se, col = Hormone))+geom_errorbar(width = 0.3 , position =position_dodge(0.1))+geom_point(position = position_dodge(0.1))+ggtitle("Mean Tumor Size with MOE bars")
ggsave(filename = "MOEbar.png")
	


##Standard error idea graphs
png(filename = "PopulationAge.png")
curve(dgamma(x, shape = 7, rate = 0.25), from = 0, to = 80,
			main = "Population of Age Values (Y's Distribution)",
			xlab = "Age Values", ylab = "PDF")
text(expression(paste("Mean = ", mu, " = 28")), x = 60, y = 0.03, cex = 1.5)
text(expression(paste("SD = ", sigma, " = 4", sqrt(7), " = 10.58")), x = 60, y = 0.02, cex = 1.5)
dev.off()

png(filename = "SampleAge.png")
age <- c(21, 24, 25, 25, 28, 34, 41)
hist(age,
		 main = "Sample Age Values",
		xlab = "Age Values", ylab = "Frequency", xlim = c(0, 80))
text(expression(paste("Mean = ", bar(y), "= 28.29")), x = 60, y = 3, cex = 1.5)
text(expression(paste("SD = s = 6.92")), x = 60, y = 2, cex = 1.5)
dev.off()

png(filename = "SampDistYbarAge.png")
curve(dgamma(x, shape = 49, rate = 7/4), from = 0, to = 80,
			main = expression(paste("Sampling Distribution of ", bar(Y))),
			xlab = "Age Values", ylab = "PDF")
text(expression(paste("Mean = ", mu, " = 28")), x = 60, y = 0.07, cex = 1.5)
text(expression(paste("SE = ", sigma, "/", sqrt(n), " = 4")), x = 60, y = 0.05, cex = 1.5)
dev.off()

2*sd(age)/sqrt(length(age))


##More with breast cancer data example
barData2 <- data.frame(barData[,1:2],round(barData[,3:6], 2))

ggplot(barData, aes(x = meno, y = size, ymin = size - se, ymax = size +se, col = Hormone))+geom_errorbar(width = 0.3 , position =position_dodge(0.1))+geom_point(position = position_dodge(0.1))+ggtitle("Mean Tumor Size with SE bars")
ggsave(filename = "SEbar.png")


#Proportion of dying patients
#new variable to determine if they made it past 1 year
breast2 <- filter(breastData, !(censrec == 0 & rectime <= 365))
breast2 <- breast2 %>% mutate(plusYear = ifelse(rectime > 365, 1, 0))
means <- aggregate(plusYear ~ meno + hormon, data = breast2, FUN = mean)
sds <- aggregate(plusYear ~ meno + hormon, data = breast2, FUN = sd)
colnames(sds)[3] <- "sd"
counts <- breast2 %>% group_by(meno, hormon) %>% count()
barData <- inner_join(inner_join(means,sds), counts)
barData$se <- barData$sd/sqrt(barData$n)

colnames(barData)[2] <- "Hormone"
ggplot(barData, aes(x = meno, y = plusYear, ymin = plusYear - 2*se, ymax = plusYear +2*se, col = Hormone))+geom_errorbar(width = 0.3 , position =position_dodge(0.1))+geom_point(position = position_dodge(0.1))+ggtitle("Proportion Surviving with MOE bars")
ggsave(filename = "MOEbarProp.png")

barData2 <- data.frame(barData[,1:2],round(barData[,3:6], 2))

ggplot(barData, aes(x = meno, y = plusYear, ymin = plusYear - se, ymax = plusYear +se, col = Hormone))+geom_errorbar(width = 0.3 , position =position_dodge(0.1))+geom_point(position = position_dodge(0.1))+ggtitle("Proportion Surviving with SE bars")
ggsave(filename = "SEbarProp.png")


####################################################
##Confidence level plot
mycolor <- function(endpoints, par) {
	if (par < endpoints[1]) 
		"Red"  # if the mean is below the left endpoint of the CI
	else if (par > endpoints[2]) 
		"Orange"  # if the mean is above the right endpoint of the CI
	else "Black"  # if the mean lies between the endpoints
}


#Load the plotrix package, which contains the plotCI function.
require(plotrix)
#create a bunch of fake intervals
set.seed(12121)
size <- 883
prob <- 0.42
CIData <- rbinom(100, size = size, prob = prob)
prop <- CIData/size 
CI <- data.frame(CIL = vector(length = 100), CIU = vector(length = 100))
CI$CIL <- prop - qnorm(0.975)*sqrt(prop*(1-prop)/size)
CI$CIU <- prop + qnorm(0.975)*sqrt(prop*(1-prop)/size)

png("CIVis.png", width = 720)
plotCI(x = 1:100, y = apply(FUN = mean, X = CI, MARGIN = 1), 
			 li = CI$CIL, ui = CI$CIU,
			 col = apply(FUN = mycolor, X = CI, MARGIN = 1, par = prob), 
			 lwd = 1,  ylab = "Props", xlab = "Sampled Data Set",
			 main = paste0("Visualization of 100 CIs (true p = ", prob, ")"))
#draw a line for true mean
abline(h = prob, lwd = 2) 
#add proportion to plot
text(x = 30, y = 0.34, paste("Proportion containing p = ", round((100 - sum((CI$CIL > 0.42) | (CI$CIU < 0.42)))/100,3)))
dev.off()
