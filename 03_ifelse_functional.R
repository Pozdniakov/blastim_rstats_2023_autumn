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

heroes$weight_group <- NULL

a <- 2 + 2

heroes <- read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
         na.strings = c("NA", "", "-99", "-"))

heroes$weight_group <- dplyr::case_when(
  heroes$Weight > 200 ~ "overweight", #if
  heroes$Weight > 120 ~ "risk of overweight", #else if
  heroes$Weight < 50 ~ "underweight", #else if
  is.na(heroes$Weight) ~ NA_character_, #else if
  .default = "typical weight" #else
)

heroes[, c("name", "weight_group", "Weight")]

# list[1]
# Error in list[1] : object of type 'builtin' is not subsettable


pow <- function(x, p) {
  power <- x ^ p
  return(power)
}

pow(3, 2)
pow(x = 3, p = 2)

pow <- function(x, p) {
  x ^ p
}

pow(3, 2)

pow <- function(x, p) x ^ p
pow(5, 10)

pow <- function(x, p = 2) x ^ p
pow(10)
pow(40)
pow(40, 3)

pow <- function(x, p) {
  x ^ p
}

pow(4, 4)

hours_2_seconds <- function(x) x * 60 * 60
hours_2_seconds(0)

w <- 90
h <- 1.7

w / h ^ 2

imt <- function(weight, height) {
  if(weight <= 0 | height <= 0) stop("рост и вес должны быть положительными")
  weight / height ^ 2
}

imt(w, h)
imt(100, 1.8)
imt(90, -9)

list(min, imt, `[`)

A <- matrix(1:12, 3, 4)
rowSums(A)
colSums(A)
rowMeans(A)
colMeans(A)
apply(A, 2, mean)

apply(A, 1, sum)

# a[2, 2] <- NA
# B[2, 2] <- NA

A[2, 2] <- NA
A
apply(A, 2, mean, na.rm = TRUE)

B <- matrix(c("Добро", "Пожаловать", "в",
         "солнечный", "Тбилиси", "и",
         "хорошего", "Вам", "настроения!"), nrow = 3)

nchar(c("Добро", "Пожаловать", "в",
        "солнечный", "Тбилиси", "и",
        "хорошего", "Вам", "настроения!"))
welcome <- c("Добро", "Пожаловать", "в",
  "солнечный", "Тбилиси", "и",
  "хорошего", "Вам", "настроения!")

count_symbols <- function(x) sum(nchar(x))
count_symbols(letters)

B

apply(B, 2, count_symbols)
apply(B, 2, function(something) sum(nchar(something)))
apply(B, 2, \(x) sum(nchar(x)))

some_list <- list(some = 1:10, l = letters)
length(some_list)
lapply(some_list, length)

sapply(some_list, length)
sapply(some_list, sum)

#install.packages("purrr")
library(purrr)
map(some_list, length)
map_int(some_list, length)
unlist(lapply(some_list, length))

log(1:10)
sapply(1:10, log)

#install.packages("data.table")
library(data.table)
heroes_dt <- fread("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
      na.strings = c("NA", "", "-99", "-"))
class(heroes)
class(heroes_dt)

heroes_dt[Race == "Human", mean(Height, na.rm = TRUE), by = Gender][order(-V1),]

library(tidyverse)

heroes_tbl <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
         na = c("NA", "", "-99", "-"))

heroes_tbl %>%
  filter(Race == "Human") %>%
  group_by(Gender) %>%
  summarise(weight = mean(Weight, na.rm = TRUE)) %>%
  arrange(desc(weight))

