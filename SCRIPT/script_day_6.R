library(tidyverse)
library(here)

#Read data ----
tidy_data <- read.delim(here("DATA/exam_data_tidy2024-09-09.txt"))

#Remove unnecessary columns ----
tidy_data <- tidy_data %>% 
  select(- cholesterol, - sibling) 

#All the variable types was logical, and no changes was done after discussing it with Janne.

#Create  new columns ----
tidy_data <-
  tidy_data %>% 
  mutate(glucose_mg_dl_categoric = ifelse(glucose_mg_dl >120, "High", "Low"),
         insulin_pmol_L = insulin_microiu_ml * 6.945,
         diabetes_5_year_binary= ifelse(diabetes_5_year== "neg",0,1),
         multiplication_age_and_pregnancy_num= preg_num*age)


#Arrange order ----
tidy_data <-
  tidy_data %>% 
  select(ID, hospital, age, everything())

#  Arrange ID column by increasing order ----
tidy_data <- tidy_data %>%
  arrange(ID)