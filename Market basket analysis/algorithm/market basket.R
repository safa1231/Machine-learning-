library(arules)
library(arulesViz)

url <- "https://raw.githubusercontent.com/safa1231/Machine-learning-/main/Market%20basket%20analysis/dataset/groceries.csv"

# Download the file to a temporary local file
temp_file <- tempfile(fileext = ".csv")
download.file(url, temp_file)
#read transaction data

groceries <- read.transactions(temp_file, format = "basket", sep = ",")

summary(groceries)
#inspect the composition of the first 5 baskets

inspect(groceries[1:5])
#plot the most purchased items
itemFrequencyPlot(groceries, topN = 5, main = "Top 5 Items")
#plot items with min support(frequency)of 10%
itemFrequencyPlot(groceries, support = 0.1, main = "items with support of 10% or more ")
#Visualizing transaction data (plotting the sparse matrix)
image(groceries[1:5])
#The resulting diagram depicts a matrix with five rows and 169 columns, indicating the five transactions and the 169 possible items we requested
image(sample(groceries, 100))
#plot the first 100 transactions 
ru1=apriori(groceries)
ru1
# if we attempt to use the default settings of support = 0.1 and confidence = 0.8, we end up with a set of zero rules
#if we want to look for itemsets with min support= 10% and min confidence
 groceryrules <- apriori(groceries, parameter = list(support =
 0.01, confidence = 0.5, minlen = 2))
 groceryrules
inspect(groceryrules)
#Sorting rules by lift
inspect(sort(groceryrules, by = "lift")[1:5])
#looking for rules/itemsets including root vegetables
# Looking for rules/itemsets including "berries"
berriesrules <- subset(groceryrules, items %pin% "berries")
inspect(berriesrules)
