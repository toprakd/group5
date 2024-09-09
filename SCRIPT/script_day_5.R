
library(tidyverse)
# install.packages("tidyverse")
library(here)


#read data
exam_nontidy <- read_delim(here("DATA", "exam_nontidy.txt"))

# Exploring the data
head(exam_nontidy)
tail(exam_nontidy,15)
summary(exam_nontidy)
str(exam_nontidy)
glimpse(exam_nontidy)
skimr::skim(exam_nontidy)



#Changing the names of coloumns
exam_nontidy <- 
  exam_nontidy %>% 
  rename(insulin_microiu_ml = `insulin microiu ml`,
         diabetes_5_year = `5y diabetes`,
         cholesterol = choleste)




#remove duplicates and pivot wider (for the measured variable and the .value coloumn)
exam_nontidy <- exam_nontidy %>%
  distinct() %>% 
  pivot_wider(names_from = `measured variable`, 
              values_from = .value)