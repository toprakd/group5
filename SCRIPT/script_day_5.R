
library(tidyverse)
# install.packages("tidyverse")
library(here)


# Exploring the data
exam_nontidy <- read_delim(here("DATA", "exam_nontidy.txt"))


head(exam_nontidy)
tail(exam_nontidy,15)
summary(exam_nontidy)
str(exam_nontidy)
glimpse(exam_nontidy)
skimr::skim(exam_nontidy)


exam_nontidy <- 
  exam_nontidy %>% 
  rename(insulin_microiu_ml = `insulin microiu ml`,
         diabetes_5_year = `5y diabetes`,
         cholesterol = choleste)