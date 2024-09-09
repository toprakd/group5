
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



#remove duplicates and pivot wider (for the measured variable and the .value coloumn)
test <- exam_nontidy %>%
  distinct() %>% 
  pivot_wider(names_from = `measured variable`, 
              values_from = .value)