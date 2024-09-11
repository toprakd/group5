library(tidyverse)
# install.packages("tidyverse")
library(here)


#read data
exam_tidy<- read_delim(here("DATA", "exam_data_tidy_modified2024-09-11.txt"))

# Are there any correlated measurements? Does the level of glucose and insulin depend on each other? --> Yes

ggplot(data = tidy_data) +
  aes(
    x = glucose_mg_dl,
    y = insulin_microiu_ml
  ) +
  geom_point()+
  geom_smooth(method = "lm")

# Does the level of glucose and insulin depend on each other, when stratifying by outcome (`diabetes_5y`)? --> Yes, there is positive correlation on both, but looks like the correlation is stronger in negative diabetes
ggplot(data = tidy_data) +
  aes(
    x = glucose_mg_dl,
    y = insulin_microiu_ml
  ) +
  geom_point(
    aes(color = diabetes_5_year,
        shape = diabetes_5_year),
    size = 2 
  ) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    aes(color = diabetes_5_year)
  )
