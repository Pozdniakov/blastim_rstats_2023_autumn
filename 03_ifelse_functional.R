number <- 1

if (number > 0) {
  "Положительное число"
}

number <- -1

if (number > 0) {
  "Положительное число"
} else {"Отрицательное число или ноль"}

if (number > 0) {
  "Положительное число"
} else if (number < 0) {
  "Отрицательное число"
} else {
  "ноль"
}

number <- -2:2

if (number > 0) {
  "Положительное число"
} else if (number < 0) {
  "Отрицательное число"
} else {
  "ноль"
}

ifelse(number > 0, "Положительное число", "Отрицательное число или ноль")

ifelse(number > 0, number, 0)

#ifelse(number > 0, TRUE, FALSE) #избыточная конструкция

ifelse(number > 0,
       "Положительное число",
       ifelse(number < 0,
              "Отрицательное число",
              "Ноль"))
#install.packages("dplyr")
#library(dplyr)
dplyr::case_when(
  number > 0 ~ "Положительное число",
  number < 0 ~ "Отрицательное число",
  number == 0 ~ "Ноль"
)

heroes <- read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
         na.strings = c("NA", "", "-99", "-"))

heroes$weight_group <- dplyr::case_when(
  heroes$Weight > 200 ~ "overweight", #if
  heroes$Weight > 120 ~ "risk of overweight", #else if
  heroes$Weight < 50 ~ "underweight", #else if
  is.na(heroes$Weight) ~ NA_character_, #else if
  .default = "typical weight" #else
)
