library(tidyverse)
# install.packages("tidyverse")
library(here)
#install.packages("ggcorrplot")


#read data ----
exam_tidy<- read_delim(here("DATA", "exam_data_tidy_modified2024-09-11.txt"))


exam_tidy %>% 
  wilcox.test(diabetes_5_year~pedigree, data = .) %>%
  broom::tidy()

exam_tidy %>% 
  kruskal.test(diabetes_5_year~pedigree, data = .) %>%
  broom::tidy()


exam_tidy %>% 
  kruskal.test(diabetes_5_year~bmi, data = .) %>%
  broom::tidy()


exam_tidy %>% 
  kruskal.test(diabetes_5_year~glucose_mg_dl, data = .) %>%
  broom::tidy()



exam_tidy %>% 
  kruskal.test(diabetes_5_year~hospital, data = .) %>%
  broom::tidy()