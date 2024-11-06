setwd("/cloud/project")

install.packages("pastecs")
library(pastecs)



#Saving the csv file to object T.M.
read.csv("TextMessages.csv", header=TRUE) -> T.M.

colnames(T.M.)

is.factor(T.M.$Six_months)
as.factor(T.M.$Six_months)

T.M.$Six_months <- as.factor(T.M.$Six_months)

by(T.M.$Group, T.M.$Six_months, stat.desc)


install.packages("reshape")
library(reshape)
colnames(T.M.)

# Update to the data; change from wide data to long data
long_data <- melt(T.M., id.vars= c("Participant","Group"), variable.name = 
"Time", value.name="Value")