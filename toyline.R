a <- 2
b <- -3
sigSq <- 0.5
x <- runif(40)
y <- a+b*x + rnorm(40, sd = sqrt(sigSq))

avgX <- mean(x)
write(avgX, "Average X.txt")

plot(x,y)
abline(a,b, col="red")
dev.print(png, "toylineplot.png", width=800, height=400)
dev.print(pdf, "toylinelot.pdf")

fit  <- lm(y~x)
summary(fit)
