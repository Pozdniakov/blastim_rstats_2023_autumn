library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                       na = c("NA", "", "-99", "-"))
heroes
heroes$`Eye color`
as.data.frame(heroes)

tribble(~a, ~b,
         1,  3,
         2,  4)

tibble(a = 1:2,
       b = 3:4)

sum(sqrt(abs(sin(1:22))))

sin(1:22)

1:22 %>%
  sin() %>%
  abs() %>%
  log(10, base = .)

1:22 %>%
  sin() %>%
  abs() %>%
  log(x = ., base = .)

# %>% from {magrittr}

1:22 |>
  sin() |>
  abs() |>
  log(x = 10, base = _)

heroes %>%
  select(1,5)

heroes %>%
  select(name, Race, Publisher, `Hair color`)

select(heroes, 1, 2)

selected_cols_heroes <-
  heroes %>%
    select(1, 2)

heroes %>%
  select(name:Publisher)

heroes %>%
  select(name:`Eye color`, Publisher:Weight)

# heroes %>%
#   select(c(name:`Eye color`, Publisher:Weight))

heroes %>%
  select(!...1)
heroes %>%
  select(!(Gender:Height))

heroes %>%
  select(name:last_col())
heroes %>%
  select(everything())

heroes %>%
  select(name, Publisher, everything())

heroes %>%
  select(ends_with("color"))

heroes %>%
  select(starts_with("Eye"))

heroes %>%
  select(contains("eigh") |  ends_with("color"))

heroes %>%
  select(where(is.numeric))
heroes %>%
  select(where(is.character))

heroes %>%
  select(where(function(x)  !any(is.na(x)) ))

heroes %>%
  select(id = ...1)

heroes %>%
  rename(id = ...1)

heroes

names(heroes)
tolower(names(heroes))
toupper(names(heroes))

heroes %>%
  rename_with(toupper)

heroes %>%
  rename_with(make.names)

heroes %>%
  relocate(Publisher)
heroes %>%
  select(Publisher, everything())

heroes %>%
  relocate(Publisher, .after = name)

heroes %>%
  relocate(Publisher, .before = name)

heroes %>%
  relocate(Publisher, where(is.numeric), .after = name)

heroes$Height

heroes %>%
  select(Height)

mtcars[,"gear"]
mtcars[,"gear", drop = FALSE]

heroes %>%
  select(Height)

heroes %>%
  select(Height) %>%
  pull()

heroes %>%
  pull(Height)

heroes %>%
  pull(Height, name)

heroes %>%
  slice(189:200)

heroes %>%
  tail()

heroes %>%
  filter(Publisher == "DC Comics") %>%
  slice(10:15)

heroes %>%
  filter(Publisher == "DC Comics") %>%
  filter(Gender == "Female")

heroes %>%
  filter(Publisher == "DC Comics" & Gender == "Female")

heroes %>%
  filter(Publisher == "DC Comics", Gender == "Female")

heroes %>%
  slice_min(Weight, n = 3)

heroes %>%
  slice_max(Weight, n = 10, with_ties = FALSE)

heroes %>%
  slice_sample(n = 10)

heroes %>%
  slice_sample(prop = .01)

heroes %>%
  slice_sample(prop = 1)

heroes %>%
  tidyr::drop_na()

heroes %>%
  drop_na(Weight)

heroes %>%
  drop_na(Weight, Height)

heroes %>%
  drop_na(ends_with("eight"))

heroes %>%
  arrange(Weight)

heroes %>%
  arrange(desc(Weight))

heroes %>%
  arrange(Gender, Weight)

heroes %>%
  mutate(imt = Weight/(Height/100) ^ 2)

heroes %>%
  mutate(imt = Weight/(Height/100) ^ 2) %>%
  select(name, imt) %>%
  arrange(desc(imt))

heroes %>%
  mutate(imt = Weight/(Height/100) ^ 2,
         imt_group = case_when(
           imt >= 30 ~ "overweight", #if
           imt >= 25 ~ "risk of overweight", #else if
           imt < 18.5 ~ "underweight", #else if
           is.na(imt) ~ NA_character_, #else if
           .default = "typical weight" #else
         ))

x <- 10
x = 10

heroes %>%
  transmute(name, Publisher, Gender,
            imt = Weight/(Height/100) ^ 2,
            imt_group = case_when(
              imt >= 30 ~ "overweight", #if
              imt >= 25 ~ "risk of overweight", #else if
              imt < 18.5 ~ "underweight", #else if
              is.na(imt) ~ NA_character_, #else if
              .default = "typical weight" #else
         ))

heroes %>%
  mutate(imt = Weight/(Height/100) ^ 2,
         .after = name)

heroes %>%
  mutate(imt = Weight/(Height/100) ^ 2,
         .before = name)

heroes %>%
  mutate(weight_mean = mean(Weight, na.rm = TRUE),
         weight_deviation = Weight - weight_mean)

heroes %>%
  mutate(weight_mean = mean(Weight, na.rm = TRUE),
         weight_deviation = Weight - weight_mean,
         .keep = "none")

# dplyr::if_else()
# data.table::fifelse

heroes %>%
  mutate(weight_mean = mean(Weight, na.rm = TRUE))

heroes %>%
  summarise(weight_mean = mean(Weight, na.rm = TRUE),
            weight_max = max(Weight, na.rm = TRUE),
            .by = Gender)

heroes %>%
  group_by(Gender) %>%
  summarise(weight_mean = mean(Weight, na.rm = TRUE),
            weight_max = max(Weight, na.rm = TRUE))

range(1:20)
heroes %>%
  group_by(Gender) %>%
  summarise(range(Weight, na.rm = TRUE))

heroes %>%
  group_by(Gender) %>%
  reframe(range(Weight, na.rm = TRUE))

heroes %>%
  group_by(Gender) %>%
  summarise(first = first(Weight),
            fifth = nth(Weight, 5),
            last = last(Weight))

heroes %>%
  group_by(Gender, Alignment, Height > 180) %>%
  summarise(first = first(Weight),
            fifth = nth(Weight, 5),
            last = last(Weight),
            n = n())

heroes %>%
  group_by(Gender) %>%
  summarise(n = n())

heroes %>%
  count(Gender, sort = TRUE)

heroes %>%
  count(`Eye color`, sort = TRUE)

heroes %>%
  count(Race, sort = TRUE) %>%

heroes %>%
  group_by(Race) %>%
  filter(n() >= 10) %>%
  select(name, Race) %>%
  drop_na()

heroes %>%
  group_by(Race) %>%
  filter(n() == 1) %>%
  select(name, Race) %>%
  drop_na()

heroes %>%
  group_by(Race) %>%
  filter(n() < 9) %>%
  select(name, Race) %>%
  drop_na()

heroes %>%
  group_by(Race) %>%
  summarise(weight_mean = mean(Weight, na.rm = TRUE))

heroes %>%
  group_by(Gender) %>%
  mutate(weight_gender_mean = mean(Weight, na.rm = TRUE),
         weight_gender_deviation = Weight - weight_gender_mean) %>%
  ungroup()

heroes %>%
  group_by(Gender) %>%
  summarise(weight_mean = mean(Weight, na.rm = TRUE),
            n = n()) %>%
  ungroup()

marvel <- heroes %>%
  filter(Publisher == "Marvel Comics") %>%
  group_by(Gender) %>%
  summarise(weight_mean = mean(Weight, na.rm = TRUE),
            n = n())

dc <- heroes %>%
  filter(Publisher == "DC Comics") %>%
  group_by(Gender) %>%
  summarise(weight_mean = mean(Weight, na.rm = TRUE),
            n = n())


others <- heroes %>%
  filter(Publisher != "Marvel Comics") %>%
  filter(Publisher != "DC Comics") %>%
  group_by(Gender) %>%
  summarise(weight_mean = mean(Weight, na.rm = TRUE),
            n = n())

# heroes %>%
#   filter(Publisher != "Marvel Comics" & Publisher != "DC Comics") %>%
#   group_by(Gender) %>%
#   summarise(weight_mean = mean(Weight, na.rm = TRUE),
#             n = n())


marvel
dc
others

bind_rows(marvel, dc, others)
bind_cols(marvel, dc, others)

list_of_df <- list(marvel_comics = marvel,
                   DC_comics = dc,
                   other_publishers = others)
list_of_df
bind_rows(list_of_df, .id = "publisher") %>%
  group_by(publisher) %>%
  summarise(max_weight = max(weight_mean, na.rm = TRUE))

band_members
band_instruments

left_join(band_members, band_instruments)

band_members %>%
  left_join(band_instruments)
band_members %>%
  right_join(band_instruments)
band_members %>%
  full_join(band_instruments)
band_members %>%
  inner_join(band_instruments)

band_members %>%
  semi_join(band_instruments)

# band_members %>%
#   filter(name %in% band_instruments$name)

band_members %>%
  anti_join(band_instruments)

# band_members %>%
#   filter(!name %in% band_instruments$name)

band_instruments %>%
  anti_join(band_members)

band_instruments2

heroes %>%
  distinct()

band_members %>%
  full_join(band_instruments, by = "name")

band_members %>%
  full_join(band_instruments2, by = c("name" = "artist"))

powers <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/super_hero_powers.csv")

1:10
cumsum(1:10)

cumall(c(TRUE, TRUE, FALSE, TRUE))
