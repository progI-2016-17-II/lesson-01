# ------------------------------------------------------------------------------
# Feladatok
# Programozás I.
# 1. óra
# 2017-02-14

# ---Assignment 1 --------------------------------------------------------------

# c) install loldata package
if (!("devtools" %in% installed.packages())) {
  install.packages(devtools)
}

devtools::install_github("tadaadata/loldata")
require(loldata)

# d) assign gameofthrones data to got variable
got <- gameofthrones

# e) view data
View(got)

# f) view class of rating coloumn
class(got$rating)

# g) summary of rating coloumn
summary(got$rating)

# h) list first season got
got[which(got$season == 1),]

# i) list titles of first episodes
got$title[which(got$episode == 1)]

# j) class of first_aired column
class(got$first_aired)

# k) set first_aired column to Date type
got$first_aired <- as.Date(got$first_aired)

# l) check whether season 1 has higher mean rating
s1_rating <- mean(got$rating[which(got$season == 1)])
s6_rating <- mean(got$rating[which(got$season == 6)])
s1_rating > s6_rating

# m) class of overview column
class(got$overview)

# n) lengths of overview column
nchar(got$overview)

# o) longest overview with seeason and episode data
got[which.max(nchar(got$overview)), c("season", "episode", "overview")]


# ---Assignment 2 --------------------------------------------------------------

# b) assign worldrankings data to worldrank variable
rankdata <- worldrankings

# c) countries with missing data in column discrimination_index
rankdata$country[which(is.na(rankdata$discrimination_index))]


# d) check wether Hungary's discrimination index is missing
discr_na_countries <-
  rankdata$country[which(is.na(rankdata$discrimination_index))]
"Hungary" %in% discr_na_countries

# e) check Hungary's discrimination index
rankdata$discrimination_index[which(rankdata$country == "Hungary")]

# f) check Hungary's discrimination rank
which(rankdata$country[order(rankdata$discrimination_index)] == "Hungary")