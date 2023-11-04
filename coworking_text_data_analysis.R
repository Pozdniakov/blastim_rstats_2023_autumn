library(tidyverse)
c(1,2) %>% rep(10)
c(1,2) %>% rep(., 10)
c(1,2) %>% rep(, 10)
c(1,2) %>% rep(, , 10)

a <- 1/3
?options
options(digits = 10)
a
options(digits = 2)
a
options(digits = 7)
options(digits = 22)
a
options(digits = 7)
?format

format(a, width = 15, digits = 18)

b <- 2:10
map_chr(b, function(x) format(log(x),
                              digits = x))

paste("a", "b")
paste("a", "b", sep = "_")
paste(month.name, 1:12, sep = "___")
paste(letters, collapse = "-")
paste(month.name, 1:12, sep = "___", collapse = "-")
strsplit(c("2a2a4", "3ab"), "a")

?grep
?gsub

library(stringi)
stri_rand_strings(10, 4)

library(stringr)
str_length("sdffdf")
str_c(month.name, 1:12, sep = "___", collapse = "-")
month.name
?gsub()
str_extract(month.name, "ber")
str_detect(month.name, "ber")
str_remove(month.name, "ber")
str_replace(month.name, "ber", "cucumber")
str_replace(month.name, "ber", "")

text <- c("Завтра мы 1000 начинаем в 54:80, закончим примерно в 16/00")
text %>%
  str_split(" ") %>%
  unlist() %>%
  str_extract_all("[аоеиуыэюя]+")

text %>%
  str_split(" ") %>%
  unlist() %>%
  str_extract_all("[:alnum:]")

text %>%
  str_split(" ") %>%
  unlist() %>%
  str_extract_all("[^аоеиуыэюя]+")

text %>%
  str_split(" ") %>%
  unlist() %>%
  str_extract_all("[0-2][0-9][:\\/][0-5][0-9]")

text %>%
  str_split(" ") %>%
  unlist() %>%
  str_extract_all(fixed("/"))

library(xml2)

heroes_chr <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("NA", "", "-99", "-"),
                   col_types = list(Height = col_character()))

heroes_chr %>%
  mutate(Height_num = as.numeric(Height))

max_digits <- str_extract(c("34.567839", "23.12"), "\\.[0-9]*") %>%
  nchar() %>%
  max()
max_digits_n <- max_digits - 1


iris %>%
  group_by(Species) %>%
  summarise(average = mean(Sepal.Length),
            median = median(Sepal.Length),
            std = sd(Sepal.Length),
            cv = std/average * 100) %>%
  mutate(average_chr = format(average, nsmall = max_digits_n),
    std_chr = format(std, nsmall = 2, digits = 2),
         cv_chr = format(cv, nsmall = 2, digits = 2))
options(digits = 7)
as.numeric("34.567839")
nchar("34.567839")


# str_extract(c("34.567839", "23.12"), "\\.[0-9]*") %>%
#   nchar() %>%
#   max() %>%
#   `-`(1)
