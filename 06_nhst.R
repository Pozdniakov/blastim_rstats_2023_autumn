library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("NA", "", "-99", "-"))

t.test(Height ~ Gender, data = heroes)

dbinom(5, size = 10, prob = .5)

dbinom(6, size = 10, prob = .5)

plot(0:10, dbinom(0:10, size = 10, prob = .55))

dnorm(0, mean = 0, sd = 1)
dnorm(0)
dnorm(1)
dnorm(-1)
dnorm(2)

v <- seq(-3, 3, by = .01)
v
plot(v, dnorm(v))

iq <- 50:150
plot(iq, dnorm(iq, mean = 100, sd = 15))
plot(iq, pnorm(iq, mean = 100, sd = 15))
pnorm(100, mean = 100, sd = 15)
pnorm(130, mean = 100, sd = 15)
options(scipen = 999)
pnorm(0, mean = 100, sd = 15) * 8000000000
pnorm(80, mean = 100, sd = 15)
1 - pnorm(80, mean = 100, sd = 15)
pnorm(130, mean = 100, sd = 15) - pnorm(100, mean = 100, sd = 15)

#qnorm

rnorm(30, mean = 100, sd = 15)

set.seed(42)
rnorm(30, mean = 100, sd = 15)

set.seed(42)
samp <- rnorm(100, mean = 100, sd = 15)
samp
hist(samp)

mean(samp)

mean(rnorm(100000, mean = 100, sd = 15))

sqrt(sum((samp - mean(samp))^ 2)/(length(samp) - 1))
sd(samp)

sample_means <- replicate(1000000, mean(rnorm(100, mean = 100, sd = 15)))

hist(sample_means)
mean(sample_means)
sd(sample_means)
15/sqrt(100)
sd(sample_means)

sd(samp)/sqrt(length(samp))

psych::describe(samp)

hist(sample_means, breaks = 100)

hist(rlnorm(10000), breaks = 100)
hist(log(rlnorm(10000)), breaks = 100)

mean(rlnorm(100))
sd(rlnorm(100))
sample_lnorm_means <- replicate(100000, mean(rlnorm(10)))
mean(sample_lnorm_means)

sd(sample_lnorm_means)
hist(sample_lnorm_means, breaks = 100)
