library(ggplot2)

gDat <- dget("data/gapminder")
str(gDat)

tinyDat <- subset(gDat,
                  country %in% c("Cambodia", "Rwanda", "Poland") &
                    year > 1995)
str(tinyDat)

tinyDat <- droplevels(tinyDat)
str(tinyDat)

ggplot(tinyDat, aes(x = year, y = lifeExp, group = country)) +
  geom_line(aes(color = country))

## country will be the group by default and can thus be omitted
ggplot(tinyDat, aes(x = year, y = lifeExp)) +
  geom_line(aes(color = country))

## legend order is exact opposite of data order
## drives me crazy AND I want to change level order for demo below
aggregate(lifeExp ~ country, tinyDat, mean)

tinyDat$country <- with(tinyDat, reorder(country, -1 * lifeExp))
str(tinyDat)

ggplot(tinyDat, aes(x = year, y = lifeExp)) + geom_line(aes(color = country))

## writing to file
## write.table() ... read.table()
levels(tinyDat$country) # "Poland"   "Cambodia" "Rwanda"
write.table(tinyDat, file = "./data/tinyDat.txt", quote = FALSE,
            row.names = FALSE, sep = "\t")
rm(tinyDat)
tinyDat
tinyDat <- read.delim("./data/tinyDat.txt")
levels(tinyDat$country)

tinyDat$country <- with(tinyDat, reorder(country, -1 * lifeExp))

## saveRDS() ... readRDS()
levels(tinyDat$country)
saveRDS(tinyDat, "./data/tinyDat.rds")
rm(tinyDat)
## go away for 6 months
## regain interest in project
tinyDat <- readRDS("./data/tinyDat.rds")
levels(tinyDat$country)

## dput() ... dget()
levels(tinyDat$country)
dput(tinyDat, "./data/tinyDat-DPUT.txt")
rm(tinyDat)
tinyDat <- dget("./data/tinyDat-DPUT.txt")
levels(tinyDat$country)