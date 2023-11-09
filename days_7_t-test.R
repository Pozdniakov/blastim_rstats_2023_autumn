set.seed(42)
samp <- rnorm(100, mean = 100, sd = 15)
samp

m <- mean(samp)
z_emp <- (m - 100)/ (15/ sqrt(length(samp)))
z_emp

z <- seq(-3, 3, by = .01)
z
plot(z, dnorm(z))
abline(v = z_emp)
abline(v = -z_emp)

pnorm(z_emp, lower.tail = FALSE)
1 - pnorm(z_emp)

(1 - pnorm(z_emp)) * 2

z_emp <- (m - 100)/ (15/ sqrt(length(samp)))
z_emp
t_emp <- (m - 100)/ (sd(samp)/ sqrt(length(samp)))
t_emp

t <- seq(-3, 3, by = .01)
plot(t, dt(t, df = length(samp) - 1))
abline(v = t_emp)
abline(v = -t_emp)
(1 - pt(t_emp, df = length(samp) - 1)) * 2

t.test(samp, mu = 100)

library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("NA", "", "-99", "-"))

t.test(heroes$Weight, mu = 100, alternative = "greater")
t.test(heroes$Weight, mu = 100)
t.test(heroes$Height, mu = 185)

library(tidyverse)
diet <- readr::read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/stcp-Rdataset-Diet.csv")

diet1 <- diet %>%
  filter(Diet == 1)

t.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)

#t.test(diet1$pre.weight - diet1$weight6weeks, mu = 0)

diet1_long <- diet1 %>%
  pivot_longer(cols = contains("weight"),
               names_to = "when",
               values_to = "weight")

t.test(weight ~ when, data = diet1_long, paired = TRUE)
t.test(diet1_long$weight ~ diet1_long$when, paired = TRUE)

diet3 <- diet %>%
  filter(Diet == 3)

t.test(diet3$pre.weight, diet3$weight6weeks, paired = TRUE)
t.test(diet3$pre.weight, diet3$weight6weeks, paired = TRUE)


diet12 <- diet %>%
  filter(Diet %in% 1:2)

t.test(weight6weeks ~ Diet, data = diet12, paired = FALSE)
t.test(weight6weeks ~ Diet, data = diet12, paired = FALSE, var.equal = TRUE)

diet12 %>%
  group_by(Diet) %>%
  summarise(m  = mean(weight6weeks),
            sd = sd(weight6weeks))

t.test(rnorm(30), rnorm(30), var.equal = TRUE)
t_result <- t.test(rnorm(30), rnorm(30), var.equal = TRUE)
t_result
str(t_result)
t_result$p.value
many_p <- replicate(10000, t.test(rnorm(30), rnorm(30), var.equal = TRUE)$p.value)
hist(many_p)
mean(many_p < 0.05)

many_lp <- replicate(10000, t.test(rlnorm(30), rlnorm(30), var.equal = TRUE)$p.value)
hist(many_lp)
mean(many_lp < 0.05)

samp
shapiro.test(samp)

qqnorm(heroes$Weight)
qqnorm(samp)
qqnorm(rnorm(30))

qqnorm(heroes$Weight)
qqnorm(rnorm(495))

hist(rnorm(100))
hist(rnorm(30))

t.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)
wilcox.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)

t.test(weight6weeks ~ Diet, data = diet12, paired = FALSE)
t.test(weight6weeks ~ Diet, data = diet12, paired = FALSE, var.equal = TRUE)
wilcox.test(weight6weeks ~ Diet, data = diet12, paired = FALSE)

t.test(c(50, 20, 49, 80), c(3, 0, 1, 0), paired = TRUE)
wilcox.test(c(50, 20, 49, 80), c(3, 0, 1, 0), paired = TRUE)

vec <- 0:20
plot(vec, dpois(vec, 7))
sd(rep(0, 10))
?sd
