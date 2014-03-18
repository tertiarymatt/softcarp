library(ggplot2)
library(plyr)

gDat <- dget("./data/gapminder")
str(gDat)

#matrix version of data, for use with apply

tDat <- with(gDat, 
             cbind(cambodia=lifeExp[country=="Cambodia"], 
                         canada=lifeExp[country=="Canada"], 
                         rwanada=lifeExp[country=="Rwanda"]))
rownames(tDat) <- with(gDat, year[country=="Canada"])

tDat

round(apply(tDat, 1, mean), 2)
round(apply(tDat, 1, median), 2)
which.min(tDat[1,])
round(apply(tDat, 1, which.min), 2)
colnames(tDat)[(apply(tDat, 1, which.min))]

rownames(tDat)[(apply(tDat, 2, which.min))]

apply(tDat, 2, summary)
apply(tDat, 2, quantile)
apply(tDat, 2, quantile, probs=c(0.25, 0.75))

apply(tDat, 2, range)

#moving to aggregate
aggregate(lifeExp~ continent, gDat, FUN=mean)
aggregate(lifeExp~ continent + year, gDat, FUN=mean)
lifeExpByYandC <- aggregate(lifeExp~ continent * year, gDat, FUN=mean)

# make a figger
ggplot(lifeExpByYandC, 
       aes(x=year, y=lifeExp, color=continent)) + 
  geom_line()

# plyr
library(plyr)

ggplot(subset(gDat, country=="Zimbabwe"),
       aes(x = year, y= lifeExp)) + 
  geom_point(size=5) + geom_smooth(se=F, method="lm")

lm(lifeExp~ year, data=gDat, subset=country=="Zimbabwe")

yearmin <- min(gDat$year)

jFit<-lm(lifeExp~ I(year-yearmin), data=gDat, subset=country=="Zimbabwe")

coef(jFit)

jFun <- function(x) {
  jFit<-lm(lifeExp~ I(year-yearmin), data=x)
  jCoef <- coef(jFit); names(jCoef) <- c("intercept", "slope")
  return(round(jCoef, 4))
}

jFun(subset(gDat, country=="Canada"))

gCoef <- ddply(gDat, ~country*continent, jFun)
str(gCoef)

#Producing output
write.table(gCoef, "./data/gCoef.tab", sep="\t", quote=T, row.names=T)

# can also use dput to write the R object
dput(gCoef, "./data/gCoef")
