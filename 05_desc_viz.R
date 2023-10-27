library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("NA", "", "-99", "-"))
weight <- heroes %>%
  drop_na(Weight) %>%
  pull(Weight)

mean(weight)
median(weight)

mean(c(weight, new_super_hero = 100000))
median(c(weight, new_super_hero = 100000))

heroes %>%
  count(Publisher, sort = TRUE)

table(heroes$Publisher)

mean(weight, trim = .1)
mean(weight, trim = .5)

diff(range(weight))

options(scipen = 999)

v <- sum((weight - mean(weight)) ^ 2)/length(weight)
s <- sqrt(sum((weight - mean(weight)) ^ 2)/length(weight))
var(weight)
sd(weight)

sqrt(sum((weight - mean(weight)) ^ 2)/(length(weight) - 1))

(weight - mean(weight))/sd(weight)


z_score <- function(x) (x - mean(x))/sd(x)
z_score(weight)
iris %>%
  mutate(across(where(is.numeric), z_score))

scale(weight)

median(abs(weight - median(weight))) #* 1.4826
mad(weight)
IQR(weight)

install.packages("psych")
library(psych)
skew(weight)
kurtosi(weight)
summary(weight)

psych::describe(weight)

heroes %>%
  group_by(Gender) %>%
  reframe(describe(Weight))

install.packages("skimr")
skimr::skim(heroes)

heroes %>%
  group_by(Gender) %>%
  skimr::skim()

xxx <- read.csv("https://raw.githubusercontent.com/Pozdniakov/stats/master/data/d.csv")
xxx

mean(xxx$x)
mean(xxx$y)
sd(xxx$x)
sd(xxx$y)
summary(xxx)
skimr::skim(xxx)
describe(xxx)
cor(xxx$x, xxx$y)
plot(xxx)

plot(heroes$Height, heroes$Weight)

iris[, -5]

iris %>%
  select(!Species) %>%
  plot()

hist(weight)
hist(weight, breaks = 4)

boxplot(Weight ~ Gender, heroes)
?boxplot

library(ggplot2)

ggplot() +
  geom_point(data = heroes, aes(x = Height,
                                y = Weight,
                                size = Weight,
                                colour = Gender),
             shape = "\U1F3C1")

heroes %>%
  count(Gender)

ggplot() +
  geom_col(data = heroes %>% count(Gender), aes(x = Gender, y = n))

ggplot() +
  geom_bar(data = heroes, aes(x = Gender))

ggplot() +
  geom_point(data = heroes,
             aes(x = Gender, y = Height),
             position = "jitter")

ggplot() +
  geom_point(data = heroes,
             aes(x = Gender, y = Height),
             position = position_jitter(width = .25, height = 0),
             alpha = .2)

ggplot() +
  geom_bar(data = heroes,
           aes(x = Gender, fill = Alignment),
           position = "dodge")
ggplot() +
  geom_bar(data = heroes,
           aes(x = Gender, fill = Alignment),
           position = "fill")

ggplot() +
  geom_histogram(data = heroes,
                 aes(x = Weight, fill = Gender),
                 position = "identity", alpha = .4)

ggplot() +
  geom_histogram(data = heroes,
                 aes(x = Weight, fill = Gender),
                 position = "fill", alpha = .4)

ggplot() +
  geom_density(data = heroes,
                 aes(x = Weight, fill = Gender),
               alpha = .4,
               colour = NA, adjust = 1,
               position = "fill")

ggplot() +
  geom_bar(data = heroes, aes(x = "", fill = Gender)) +
  coord_polar(theta = "y")

ggplot() +
  geom_bar(data = heroes,
           aes(x = Gender, fill = Alignment),
           position = "fill") +
  coord_flip()

install.packages("hrbrthemes")


ggplot(data = heroes, aes(x = Height,
                          y = Weight)) +
  geom_point(aes(size = Weight,
                 colour = Alignment),
             alpha = .6) +
  geom_smooth(method = "lm", colour = "#AA2360") +
  scale_colour_brewer(palette = "Set1") +
  scale_y_log10() +
  facet_wrap(~Gender, nrow = 3) +
  labs(title = "whatever",
       subtitle = "whatever2") +
  hrbrthemes::theme_ipsum()

