# ------------------------------------------------------------------------------
# 2. R alapok
# Programozás I.
# 1. óra
# 2017-02-14

## ----Package installálás, behívás---------------------------------------------

# Package-ek installálása
install.packages("ggplot2")
devtools::install_github("karthik/wesanderson")

# Package-ek behívása
require(ggplot2)
# Package-ek behívása visszajelzés nélkül
library(ggplot2)
require(ggplot2, quietly = TRUE)

## ----Változók-----------------------------------------------------------------
# Érték hozzárendelése változóhoz
x <- 5
x
x <- 6
x
y <- 4
x + y
assign("z", 3)
y * z

# case sensitivity
Y <- 2
print(paste0("y = ", as.character(y), " and Y = ", as.character(Y)))

# változó törlése
rm(Y)
print(paste0("y = ", as.character(y), " and Y = ", as.character(Y)))

## ----Adattípusok--------------------------------------------------------------
class(x)

# Numerikus típusú adatok
is.numeric(x)
is.integer(x)
x <- 6L
is.integer(x)

# Karakter típusú adatok
x1 <- "valami"
x2 <- factor("valami")
x1
x2

# Dátum típusú adatok
date1 <- as.Date("2017-02-14")
date1
class(date1)
date2 <- as.POSIXct("2012-06-28 17:42")
date2
class(date2)

# Logikai  típusú adatok
b <- TRUE
is.logical(b)
b * 5
a <- FALSE
a * 5

# számok vagy karakterek összehasonlítása
2 == 3
2 != 3
2 > 3
"valami" == "semmi"
"valami" > "semmi"

## ----Adatstruktúrák I.--------------------------------------------------------
### Vektorok
## Vektorok definiálása
# a vektorok állhatnak numerikus, logikai, karakter, faktor stb. elemekből
v1 <- c(1, 2, 3)
v2 <- c("lamantin", "szurikáta", "lajhár")
v1
v2

v1 <- 1:3
v1

# rep
v3 <- rep(1:3, 3)
v3
v4 <- rep(1:3, each = 3)
v4

# seq
v5 <- seq(from = 1, to = 10, by = 2)
v5

## Vektor műveletek
v1 * 2
v3 - v4
v1^3

# Összehasonlítás
v3 < v4
any(v3 < v4)
all(v3 < v4)

# Vektorhossz
length(v1)
nchar(v2)

# Indexelés
v5[1]
v5[1:3]
v5[c(1, 5)]
v2[c(1, 3)]

v5
# elem felülírása
v5[1] <- 100
v5
# elem hozzáadása
v5 <- c(v5[1:2], 200, v5[3:length(v5)])
v5

# Névadás a vektorelemeknek
named_v <- c(a = 1, b = 2, c = 3)
named_v
named_v <- 1:3
names(named_v) <- c("a", "b", "c")
named_v

## Faktor vektorok
v2_factor <- as.factor(v2)
v2_factor

# ordinális skála
isk <-
  factor(
    x = c(
      "Legfeljebb 8 általános",
      "Szakközép, szakiskola",
      "Gimnázium, középiskola érettségivel",
      "Főiskola, egyetem"
    ),
    levels = c(
      "Legfeljebb 8 általános",
      "Szakközép, szakiskola",
      "Gimnázium, középiskola érettségivel",
      "Főiskola, egyetem"
    ),
    ordered = TRUE
  )
isk

### Mátrixok
## Mátrix definiálása
m1 <- matrix(c(1, 4, 6, 8), nrow = 2, ncol = 2)
m1
m2 <- matrix(1:4, ncol = 2)
m2

# mátrix dimenziói
nrow(m2)
ncol(m2)
dim(m2)
attributes(m2)

## Mátrix műveletek
m1 + m2
m1 == m2
# skalár szorzás
m1 * m2
# mátrix szorzás
m1 %*% m2

# mátrix sor- és oszlopnevek
colnames(m1) <- c("bal", "jobb")
rownames(m1) <- c("első", "második")
m1
t(m1)

## Mátrix indexelés
m1[1, 1]
m1[1, ]
m1[, 1]
m1[1, 1] <- 400
m1

## Mátrix szűrés
m1[, 1] > 10
m1[, m1[, 1] > 10]
m1 > 10
m1[m1 > 10]
m1[m1[1, ] %% 2 == 0, ]
m1[m1[1, ] %% 2 == 1, ]

# which
which(m1 > 10)
m1[, which(m1 > 10)]

## ----Függvények---------------------------------------------------------------
mean(v5)

# dokumentáció elérése
?mean
help(mean)
# keresés leírásokban, kilistázza a package-ekre
??mean
# a jelentés alapján keresünk
apropos("mea")

## ----Adatstruktúrák II.-------------------------------------------------------
### Data frame-ek
## Data frame definiálása
x <- 3:1
y <- c(4, 8, 20) 
z <- c("axolotl", "kék bálna", "tintahal")
df1 <- data.frame(x, y, z)
df1

df1 <- data.frame(Első = x, Második = y, Állatok = z)
df1

# data frame dimenziói
nrow(df1)
ncol(df1)
dim(df1)

# data frame nevei
names(df1)
colnames(df1)
rownames(df1)
rownames(df1) <- c("a", "b", "c")
df1

## Data frame indexelés
df1$Állatok
df1[, 3]

df1$Állatok[1]
df1[1, 3]

df1[1:2, 3]
df1[c(1, 3), 3]
df1[, c("Első", "Állatok")]

# head, tail
df2 <- data.frame(egyes = 1:10, 
                  kettes = c("One", "Two", "Three", 
                             "Four", "Five", "Six", 
                             "Seven", "Eight", "Nine", 
                             "Ten"))
head(df2)
tail(df2)

# drop
df1[1:2, 3]
class(df1[1:2, 3])
df1[1:2, 3, drop = FALSE]
class(df1[1:2, 3, drop = FALSE])

## Data frame szűrés
df1[df1$Első == 1, ]
subset(df1, df1$Első == 1)

## Data frame-ek összekapcsolása
# cbind, rbind
# az összekapcsolt adatok data frame, vektor vagy lista adatstruktúrájúak
v1 <- c(100, 300, 100)
cbind(df1, v1)
l2 <- list(4, 68, "axolotl")
rbind(df1, l2)
class(df1$Állatok)

### Listák
## Lista definiálása
l1 <- list(1, 2, 3)
l1
list(c(1, 2, 3))
list(c(1, 2, 3), 3:7)
l2 <- list(df1, 1:ncol(df1), l1)

length(l2)
names(l2) <- c("data_frame", "vector", "list")
names(l2)

## Lista indexelése
l2[[1]]
l2[["data_frame"]]
l2[[1]]$Állatok

# új elem hozzáadása
l2[[4]] <- 2
l2[["new_element"]] <- 5:10
names(l2)

## ----Hiányos adat-------------------------------------------------------------
## NA
z <- c(1, 2, NA, 8, 3, NA, 3)
z
is.na(z)
which(is.na(z))
mean(z)
mean(z, na.rm = T)

## NULL
z <- c("narancs", NULL, "banán")
z
y <- NULL
is.null(y)
is.null(7)

