library(arules)
library(arulesViz)
groceries <- read.transactions("dataset/groceries.csv", sep = ",")
summary(groceries)