library(tidyverse)
# install.packages("tidyverse")
library(here)
#install.packages("ggcorrplot")


# Read data & run Kruskal test ----
exam_tidy<- read_delim(here("DATA", "exam_data_tidy_modified2024-09-11.txt"))

exam_tidy %>% 
  kruskal.test(diabetes_5_year~pedigree, data = .) %>%
  broom::tidy()
# The effect of pedigree on diabetes outcome was not statistically significant

exam_tidy %>% 
  kruskal.test(diabetes_5_year~bmi, data = .) %>%
  broom::tidy()
# The effect of BMI on diabetes was statistically significant 

exam_tidy %>% 
  kruskal.test(diabetes_5_year~glucose_mg_dl, data = .) %>%
  broom::tidy()
# The effect of glucose_mg_dl on diabetes was statistically significant 


exam_tidy %>% 
  kruskal.test(diabetes_5_year~hospital, data = .) %>%
  broom::tidy()
# The effect of hospital on diabetes was not statistically significant 