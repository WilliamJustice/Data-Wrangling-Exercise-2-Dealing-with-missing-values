library(dplyr)
library(tidyverse)

#0: Load the data in RStudio
titanic_clean<-titanic_original

#1: Port of embarkation
titanic_clean$embarked[titanic_clean$embarked == ""]<- "S"

#2:1 Age
mean_age<-mean(titanic_original$age, na.rm = TRUE)
 
titanic_clean$age[is.na(titanic_clean$age)]<- mean(titanic_clean$age, na.rm = TRUE)

#3: Lifeboat
titanic_clean$boat[titanic_clean$boat == ""]<- "NA"


#4 Cabin
# Does it make sense to fill missing cabin numbers with a value?
#   It would not make sense to fill in the large amount of missing cabin numbers. This has the potential to skew the data in an incorrect direction. There is simply not enough information to make an educated guess on a specific cabin number.
# What does the missing value here mean?
# The missing value here likely means that data is missing completely at random. No pattern can be explained from such a large amount of missing values.



# You have a hunch that the fact that the cabin number is missing might be a useful indicator of survival. Create a new column has_cabin_number which has 1 if there is a cabin number, and 0 otherwise.
titanic_clean <- titanic_clean %>%
  mutate(has_cabin_number = ifelse(cabin == "",0, 1))


write.csv(titanic_original, file = "titanic_original.csv")  
write.csv(titanic_clean, file = "titanic_clean.csv")
