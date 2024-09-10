library(tidyverse)
library(here)

#Read data ----
tidy_data <- read.delim(here("DATA/exam_data_tidy2024-09-09.txt"))

#  Read and join the additional dataset to your main dataset ----
join_data <- read.delim(here("DATA/exam_joindata.txt"))
join_data <- join_data %>%
  rename(ID = id)


#Merge steps ----
tidy_data <- tidy_data %>% 
  select(- cholesterol, - sibling)  %>% 
  mutate(glucose_mg_dl_categoric = ifelse(glucose_mg_dl >120, "High", "Low"),
         insulin_pmol_L = insulin_microiu_ml * 6.945,
         diabetes_5_year_binary= ifelse(diabetes_5_year== "neg",0,1),
         multiplication_age_and_pregnancy_num= preg_num*age) %>% 
  select(ID, hospital, age, everything()) %>% 
  arrange(ID) %>%
  full_join(join_data, join_by("ID")) 


tidy_data  %>% 
  group_by(hospital) %>% 
  summarise( min(preg_num), max(preg_num ), mean(preg_num),sd(preg_num ))

