# Вектор ------------------------------------------------------------------


eyes <-  c("green", "blue", "blue", "brown", "green", "blue")

eyes == "blue"
sum(eyes == "blue")

sum(eyes == "blue")/length(eyes == "blue")
mean(eyes == "blue")
paste0(mean(eyes == "blue") * 100, "%")
all(eyes == "blue")
any(eyes == "blue")

all(!eyes == "blue")
eyes == "blue"
!eyes == "blue"
which(eyes == "blue")
#seq_along(eyes == "blue")[eyes == "blue"]

eyes == "blue"|"green"
eyes[eyes == "blue"| eyes == "green"]
#eyes[eyes == c("green", "blue")]

eyes %in% c("green", "blue")
subjects <- c("Москва", "Москва", "Балашиха", "Новосибирск", "Тбилиси", "Реутов")
big_cities <- c("Москва", "Санкт-Петербург", "Новосибирск")

subjects[subjects %in% big_cities]

# NA ----------------------------------------------------------------------


missed <- NA
NA == "NA"
NA == 0
NA == FALSE
NA == ""
NA == NA

n <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)
n[3] <- 20
n
n[5] <- NA
n
mean(n)
n == NA

Joe <- NA
Mary <- NA
Joe == Mary

NA == 20
NA ^ 0
NA & FALSE
NA * 0
Inf * 0
1 / 0
length(n == NA)
empty_integer <- integer(0)
length(empty_integer)
length(NULL)
1/0
-1/0
max(1, 4, 10)
max(1, 4, 10, NA)
max(1, 4, 10, NA, Inf)
Inf == Inf
Inf == Inf + Inf
0 / 0
mean(integer(0))
is.na(NA)
is.na(n)
n
n[is.na(n)]
mean(n[!is.na(n)])
mean(n, na.rm = TRUE)
typeof(NA)
NA_character_
NA_complex_
NA_integer_
NA_real_
as.character(c(1, 2.5, NA))
is.na(NaN)
is.nan(NA)

# Матрицы -----------------------------------------------------------------

matrix(1:20, nrow = 5, ncol = 4)
matrix(1:20, nrow = 5)
A <- matrix(1:20, nrow = 5)
A[2, 3]
A[2:4, 1:3]
A[1:5, 1:3]
A[, 1:3]
A[2:4, 1:4]
A[2:4, ]

A > 10
A[A > 10]
A[2:4, 2:4] <- 100
A
attributes(A)
attributes(A) <- NULL
A
attr(A, "dim") <- c(2, 10)
A
attr(A, "dim") <- c(5, 2, 2)
A
A[4, 2, 2]
A[10]

matrix(1:81, nrow = 9)
matrix(rep(1:9, 9) * rep(1:9, rep(9, 9)), nrow = 9)
matrix(rep(1:9, 9) * rep(1:9, each = 9), nrow = 9)
outer(1:9, 1:9)
outer(1:9, 1:9, "*")
1:9 %o% 1:9

# Списки ------------------------------------------------------------------

c(42, "hi", TRUE)
simple_list <- list(42, "hi", TRUE)
complex_list <- list(100, letters, simple_list, A)
complex_list

str(complex_list)
named_list <- list(name = "Афоня",
                   age = 23,
                   student = FALSE)
named_list
named_list['name']
named_list$name
named_list[1]

# Сама коробка (вместе с содержимым)
named_list[1]
named_list["name"]

# Содержимое коробки
named_list[[1]]
named_list[["name"]]
named_list$name

attr(named_list, "class") <- "pers"
named_list
str(named_list)

list1 = list(numbers = 1:5, letters = letters, logic = TRUE)
list1
list2 = list(pupa = list1, lupa = list1)
list2
str(list2)
list2$pupa$letters[10]
list2[[1]][[2]][10]

# Датафреймы --------------------------------------------------------------

list(name = c("Афоня", "Ибрагим", "Оскар", "Наталья", "Клавдия"),
     age = c(23, 34, 32, 11, 89),
     student = c(FALSE, FALSE, TRUE, FALSE, TRUE))

df <- data.frame(name = c("Афоня", "Ибрагим", "Оскар", "Наталья", "Клавдия"),
                 age = c(23, 34, 32, 11, 89),
                 student = c(FALSE, FALSE, TRUE, FALSE, TRUE))

str(df)
df
df[1:2, 1:2]
df$name
df$lovesR <- TRUE
df
df[df$student,]
df[df$age >= 18 & df$age < 80,]
df[!(df$age >= 18 & df$age < 80),]
df[df$age < 18 | df$age >= 80, c("name", "age")]
df[1:2, "age"]
df[1:2, c("age", "name")]

as.matrix(df)
df[df$age > mean(df$age),]

data(mtcars)
mtcars

# Пакеты ------------------------------------------------------------------

install.packages("beepr")

library("beepr")
library(beepr)
beep(11)

beep()
beepr::beep()

install.packages("BiocManager")
BiocManager::install("flowCore")
library(flowCore)

install.packages("remotes")
remotes::install_github("dracor-org/rdracor")

library(rdracor)
get_play_metadata(play = "gogol-revizor",
                  corpus = "rus",
                  full_metadata = FALSE)
revizor <- get_net_cooccur_igraph(play = "gogol-revizor",
                                  corpus = "rus")
plot(revizor)

# Импорт данных -----------------------------------------------------------

read.csv("heroes_information.csv")

getwd()
setwd()
read.csv("/Users/ivan/Desktop/heroes_information.csv")
read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv")

?read.csv
heroes <- read.table("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                     header = TRUE,
                     sep = ",",
                     quote = "\"",
                     dec = ".",
                     na.strings = c("NA", "", "-99", "-"))

read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
         na.strings = c("NA", "", "-99", "-"))

library(readxl)
library(haven)
library(foreign)

library(vroom)
vroom::vroom("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv")
