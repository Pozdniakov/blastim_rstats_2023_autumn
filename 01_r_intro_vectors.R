
# R as calc ---------------------------------------------------------------


2 + 2 # 2 plus 2
3 * 10
2 ^ 10
2 ** 10 # you can use degree as both ^ and **
4 - 1
1 - 3
7 / 3
7 %/% 3
7 %% 3
((2 + 2) - 10) * 2
16 ^ 0.5

sqrt(16)
log(8)
?log
log(x = 81, base = 3)
log(8, 3)
log(8, 2)
log(2 ^ 12, 2)
log(100)
sin(10)
abs(-10)
# ?round
round(23215.755, digits = -1)
floor(23215.755)
ceiling(23215.755)

`+`(10, 5)
10 + 5

# Variables ---------------------------------------------------------------

a = 2 ^ 10
b <- 3 ^ 5

d <- sqrt(a - b)
rm(d)

# Операторы сравнения -----------------------------------------------------

a == b
a != b

a > b
a < b

a > a
a >= a
a == a

a <= a


# Типы данных -------------------------------------------------------------

3 + 4i

is.integer(a)
is.integer(20L)

s <- "hi, 'everyone'!"
t <- 'hi, "everyone"!'
s == t
typeof(s)
comparison <- a > b
TRUE
"TRUE"
t1 <- TRUE
f1 <- FALSE
!t1
!!t1

t1 & f1
f1 & t1
t1 & t1
f1 & f1

t1 | f1
f1 | t1
t1 | t1
f1 | f1
age <- 50
age >= 18 & age < 80
age < 18 | age >= 80


# Vector ------------------------------------------------------------------

?log

c(4, 8, 15, 16, 23, 42)

с(1, 4)

c("Hey", "Hey", "Ho")
paste("Hey", "Hey", "Ho", sep = "__")
paste("Hey", "Hey", "Ho", sep = "")
paste0("Hey", "Hey", "Ho")

c(TRUE, FALSE)
1:10
10:1
3:-5

seq(10, 100, by = 10)
seq(1, 13, length.out = 4)
seq(1, 13, length.out = 7)
seq_len(30)
1:30
seq_len(0)
length(1:30)
length(seq_len(0))
1:0
seq_along(c("Hey", "Hey", "Ho"))

rep(1, 5)
rep(1:3, 3)
rep(1:3, c(10, 2, 30))

v1 <- c("Hey", "Hey", "Ho")
v2 <- c("Let's", "go")
c(v1, v2)
c(c(4, 8, 15, 16, 23, 42), 1:5)

sum(c(4, 8, 15, 16, 23, 42))
mean(c(4, 8, 15, 16, 23, 42))
c(1:100)
c(1:19, 20:1)
rep("Hey", 20)
c(FALSE, 2)
TRUE
Yes
c("YES", TRUE)

2 + TRUE
c(TRUE, 3, "hi")
c(c(TRUE, 3), "hi")
is.character("hi")
as.character(1:3)
as.numeric(c(TRUE, FALSE, FALSE))
as.numeric(c("1", "2", "tri"))
sum(c(TRUE, FALSE, TRUE))
mean(c(TRUE, FALSE, TRUE))

v3 <- c(c(4, 8, 15, 16, 23, 42), 1:5)
sum(v3 > 10)

m <- 1:4
n <- 4:1
m + n

m + n

m * n
m ^ n
n ^ (n + m) - n / m
sqrt(1:10)
log(1:10, base = 2:11)
abs(-5:5)

k <- 0:1
m + k
m + c(0, 1, 0, 1)

p <- c(0, 10, 100)
m * p
p
p <- 1:4
p
2 ^ 40
1 / (2 ^ 40)

options(scipen = 999)
2 ^ 40

1:20 * 0:1
(1:10) ^ 2
rep(2, 10) ^ (0:9)
2 ^ (0:9)
10 ^ (0:9)
2 ^ (0:20)
1 / 2 ^ (0:20)
sum(1 / 2 ^ (0:20))

n <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)
n[1]
n[2]
n[10]
n[length(n)]
head(n, 1)
tail(n)
tail(n, 1)
n[3] <- 20
n
n[4:7]
n[10:1]
rev(n)
n_reversed <- rev(n)
n[4:6] <- 0
n
n[-1]
#`[`(n, -1)
n
n[c(-4, -6, -9)]
#n[-4, -6, -9]
n[c(TRUE, FALSE, TRUE, FALSE, TRUE,
    FALSE, TRUE, FALSE, TRUE, FALSE)]
n[c(TRUE, FALSE)]

my_named_vector <- c(first = 1, second = 2, third = 3)
my_named_vector[2]
my_named_vector["first"]
my_named_vector[c("first", "third", "first")]

names(my_named_vector)
letters
LETTERS
pi
exp(1)
?month.name
month.name
month.abb
letters[1:3]
names(my_named_vector) <- letters[1:3]
my_named_vector
n
mean(n)
n > mean(n)
n[n > mean(n)]

seq(2, 20, by = 2)

  r <- 1:20
r[c(FALSE, TRUE)]

(1:20)[c(F, T)] #

x <- 1:20
x[x %% 2 == 0]

seq(0, 18, by = 2) + 2

seq(1, 10, 1) * 2

1:10 * 2

c(2, 2 * 2:10)

c(2, 4, 6, 8, 10, 12, 14, 16, 18, 20)
