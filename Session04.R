library(ggplot2)
gdat <-dget("gapminder")
str(gdat)

#establish base of plot
p <- ggplot(data=gdat, aes(x = gdpPercap, y=lifeExp))

#establish geometry of base plot
p + geom_point()

#Log x axis, nilla, to make nice scale.
p + geom_point() + scale_x_log10()

#permanently add log scale to base figure
p <- p + scale_x_log10()

#mapping aesthetics to points
p + geom_point(aes(color=continent))

#setting transparency
p + geom_point(alpha=1/3)

#added a smoothed loess function, suppress CI, facet by continent
p + geom_point(alpha=1/3) + facet_wrap(~ continent) + geom_smooth(se=F)

#added a smoothed loess function, suppress CI, use linear
p + geom_point(alpha=1/3) + geom_smooth(se=F, method="lm")

# New stuff

#strip plot, using transparency to show density
ggplot(gdat, aes(x=continent, y=lifeExp))+ geom_point(alpha=1/10)

#spread that shit out!
ggplot(gdat, aes(x=continent, y=lifeExp))+ geom_jitter()

#spread it out on a box
ggplot(gdat, aes(x=continent, y=lifeExp))+ geom_boxplot() + geom_jitter(position=position_jitter(width=0.1), alpha =1/4)
