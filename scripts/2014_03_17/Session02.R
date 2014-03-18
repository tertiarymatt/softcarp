#Fiddlin' with subset.  

lowlife <- subset(gDat, subset=lifeExp < 32)
lowlife
summary(lowlife$continent)

plot(lifeExp ~ year, data=gDat)

plot(lifeExp ~ year, data=gDat, subset=country=="Rwanda")

mean(gDat$lifeExp, subset=country=="Rwanda")

with(gDat, mean(lifeExp))
with(subset(gDat, subset=country=="Cambodia"), cor(gDat$lifeExp, gDat$gdpPercap))
