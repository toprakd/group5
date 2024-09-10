library(tidyverse)
library(here)
tidy_data <- read.delim(here("DATA/exam_data_tidy2024-09-09.txt"))



#  Arrange ID column of your dataset in order of increasing number or alphabetically
tidy_data <- tidy_data %>%
  arrange(ID)