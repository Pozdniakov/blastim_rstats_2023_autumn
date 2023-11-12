library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("NA", "", "-99", "-"))

heroes %>%
  select(Gender, Publisher) %>%
  filter(Publisher %in% c("Marvel Comics", "DC Comics")) %>%
  drop_na()

gender_publisher <- heroes %>%
  select(Gender, Publisher) %>%
  filter(Publisher %in% c("Marvel Comics", "DC Comics")) %>%
  drop_na()

count(gender_publisher, Gender, Publisher)

table(gender_publisher)
class(table(gender_publisher))

summary(table(gender_publisher))
chisq.test(table(gender_publisher))
chisq.test(table(gender_publisher), correct = FALSE)

fisher.test(table(gender_publisher))

mosaicplot(table(gender_publisher))

gender_publisher$Gender[1:5]

plot(0:5, dbinom(0:5, size = 5, 0.5))
dbinom(0, size = 5, 0.5) + dbinom(5, size = 5, 0.5)

plants <- as.table(matrix(c(90, 10, 97, 3),
                          dimnames = list(microclubni = c(FALSE, TRUE),
                                          env = c("normal_env", "abnormal_env")
                                          ),
                          nrow = 2))
plants

summary(plants)
chisq.test(plants)
fisher.test(plants)
mosaicplot(plants, color = TRUE, shade = TRUE)

install.packages("Stat2Data")
library(Stat2Data)
data("Backpack")

back <- Backpack %>%
  mutate(backpack_kg = BackpackWeight * 0.453592,
         body_kg = BodyWeight * 0.453592,
         .after = BodyWeight)

back %>%
  select(body_kg, backpack_kg) %>%
  cov()

back %>%
  select(body_kg, backpack_kg) %>%
  var()

back %>%
  select(BodyWeight, BackpackWeight) %>%
  var()

back %>%
  select(body_kg, backpack_kg) %>%
  cor()

cor(back$BodyWeight, back$body_kg)

cor.test(back$backpack_kg, back$body_kg)
cor.test(back$backpack_kg, back$body_kg,
         method = "spearman")

ggplot(data = back) +
  geom_point(aes(x = body_kg, y = backpack_kg)) +
  theme_minimal()

back %>%
  select(body_kg, backpack_kg, Units, Year) %>%
  cor()

cor.test(back$backpack_kg, back$BackProblems)
t.test(back$backpack_kg ~ back$BackProblems, var.equal = TRUE)

back %>%
  select(body_kg, backpack_kg, Units, Year) %>%
  cor()

library(psych)

back %>%
  select(body_kg, backpack_kg, Units, Year) %>%
  corr.test(adjust = "bonferroni")

back %>%
  select(body_kg, backpack_kg, Units, Year) %>%
  corr.test()

back %>%
  select(body_kg, backpack_kg, Units, Year) %>%
  corr.test(adjust = "fdr")

model <- lm(backpack_kg ~ body_kg, data = back)
model$coefficients

ggplot(data = back) +
  geom_point(aes(x = body_kg, y = backpack_kg)) +
  geom_abline(slope = 0.03712974, intercept = 2.71125232) +
  theme_minimal()

summary(model)
predict(model, data.frame(body_kg = 100))

plot(model)


mean(model$residuals)

model <- lm(backpack_kg ~ body_kg, data = back)
summary(model)
model_mult <- lm(backpack_kg ~ body_kg + Units + Year + BackProblems, data = back)
summary(model_mult)
car::vif(model_mult)

diet <- readr::read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/stcp-Rdataset-Diet.csv")
diet

diet <- diet %>%
  mutate(weight.loss = weight6weeks - pre.weight,
         Dietf = factor(Diet, labels = LETTERS[1:3]),
         Person = factor(Person)) %>%
  drop_na()

lm(backpack_kg ~ BackProblems, data = back) %>%
  summary()
t.test(backpack_kg ~ BackProblems, data = back, var.equal = TRUE)

aov_model <- aov(weight.loss ~ Dietf, diet)
summary(aov_model)

aov(weight.loss ~ Dietf, diet) %>% summary()

lm(weight.loss ~ Dietf, diet) %>% summary()

pairwise.t.test(diet$weight.loss, diet$Dietf)
pairwise.t.test(diet$weight.loss, diet$Dietf, pool.sd = FALSE)
pairwise.t.test(diet$weight.loss, diet$Dietf, p.adjust.method = "none")

TukeyHSD(aov_model)

aov(weight.loss ~ Dietf, diet) %>% summary()
aov(weight.loss ~ gender, diet) %>% summary()
t.test(weight.loss ~ gender, diet, var.equal = TRUE)

#install.packages("ez")
library(ez)
ezANOVA(data = diet,
        dv = weight.loss,
        wid = Person,
        between = Dietf,
        detailed = TRUE,
        return_aov = TRUE)

diet_long <- diet %>%
  pivot_longer(cols = c("pre.weight", "weight6weeks"),
               names_to = "when",
               values_to = "weight")
diet_long %>%
  filter(Dietf == "A") %>%
  ezANOVA(dv = weight,
          wid = Person,
          within = when)

diet_long %>%
  ezANOVA(dv = weight,
          wid = Person,
          within = when,
          between = Dietf)

ezANOVA(data = diet,
        dv = weight.loss,
        wid = Person,
        between = .(Dietf, gender),
        detailed = TRUE)
