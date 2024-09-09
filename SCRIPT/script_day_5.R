
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


#Separate variable subject into hospital and ID:
df <- separate(exam_nontidy, subject, sep ="-",
               into = c("hospital", "ID"))




#Separate variable pregnancy_num-age into pregnancy_num and age:
df1 <- separate(df, "pregnancy_num-age", sep ="-",
                into = c("preg_num", "age"))



#remove duplicates and pivot wider (for the measured variable and the .value coloumn)
exam_tidy <- df1 %>%
  distinct() %>% 
  pivot_wider(names_from = `measured variable`, 
              values_from = .value)



#saving the tidy data
fileName <- paste0("exam_data_tidy", Sys.Date(), ".txt")
write_delim(exam_tidy, 
            file = here("DATA", fileName), delim="\t")