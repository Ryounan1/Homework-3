setwd("/cloud/project")
# Setting the working Directory 

Data<- read.csv("TextMessages.csv", header= TRUE)
#I have put in the CSV file and making the system read the file as Data

is.factor(long_data$Participant)
#it is not recognized as a categorical variable when we run the code

as.factor(long_data$Participant)
# making the data for participant a factor 
Data$Participant<-as.factor(Data$Participant)

is.factor(Data$Participant)
# The data for particiapnt is now recognized as a factor 

install.packages("ggplot2")
library(ggplot2)
# installed and loaded the ggplot package and dependencies 

barchart<- ggplot(long_data, aes(Participant,value))
# gives the graph with nothing on it just has the Y and X axis labled 

barchart+ stat_summary(fun.y = mean, geom = "bar", fill= "blue", colour= "Black")
# This is where the bars are shown on the bar chart 

#intalling packages that I need 
install.packages("reshape")

#loading in the packages 
library(reshape)

#this part pulls up the the different categories there is in the data set 
colnames(Data)

# Update to the data; change from wide data to long data
long_data <- melt(Data, id.vars= c("Participant","Group", "variable"), variable.name = 
                    "Time", value.name="Value")

# this is the bar chart that is produced I have labled everything and i have 
# color coded it
ggplot(long_data, aes(x = Participant, y = value,fill = variable)) + 
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = c("Six_months" = "black", "Baseline" = "red")) +
  labs(title = "Text_Messages", x = "Participant", y = "value") +
  theme_minimal()


# Check if 'value' is a factor before conversion
is.factor(long_data$value)
#convert 'value' to a factor
long_data$value<- as.factor(long_data$value)
#checking if 'value is a factor after convesion
is.factor(long_data$value)

## Check if 'Group' is a factor before conversion
is.factor(long_data$Group)
# Convert 'Group' to a factor
long_data$Group<-as.factor(long_data$Group)
# Check if 'Group' is a factor after conversion
is.factor(long_data$Group)
