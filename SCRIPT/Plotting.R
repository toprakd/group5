library(tidyverse)
# install.packages("tidyverse")
library(here)


#read data ----
exam_tidy<- read_delim(here("DATA", "exam_data_tidy_modified2024-09-11.txt"))

# Correlated measurements? Does the level of glucose and insulin depend on each other? ----
# --> Yes, looks like it

ggplot(data = tidy_data) +
  aes(
    x = glucose_mg_dl,
    y = insulin_microiu_ml
  ) +
  geom_point()+
  geom_smooth(method = "lm")

# Does the level of glucose and insulin depend on each other, when stratifying by outcome (`diabetes_5y`)? ----
# --> Yes, seems to be a positive correlation in neg. and pos. diabetes, but the correlation looks stronger in neg. diabetes
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

#Create plot to examine the correlation between glucose and blood pressure: ----
# --> There does not seem to be strong correlation between glucose and blood pressure.
ggplot(data = tidy_data) +
  aes(
    x = glucose_mg_dl,
    y = dbp_mm_hg
  ) +
  geom_point() +
  geom_smooth(method = "lm")



# Create plot to examine the relation between the `BMI` and `triceps_mm` values.----
# --> There was a strong relationship between `BMI` and `triceps_mm` in our data


ggplot(data = tidy_data) +
  aes(
    x = bmi,
    y = triceps_mm
  ) +
  geom_point() +
  geom_smooth(method = "lm")




# Create plot to examine the blood pressure distribution in different BMI categories:----
library(tidyverse)

# creating BMI categories and their order
tidy_data <- tidy_data %>%
  mutate(
    bmi_category = case_when(
      bmi < 25 ~ "healthy_weight",
      bmi >= 25 & bmi < 30 ~ "over_weight",
      bmi >= 30 ~ "obesity"
    ),
    # order of levels
    bmi_category = factor(bmi_category, levels = c("healthy_weight", "over_weight", "obesity"))
  )

# Plotting 
ggplot(data = tidy_data) +
  aes(
    x = bmi_category,
    y = dbp_mm_hg
  ) +
  geom_boxplot()


# --> Blood pressure distributions tend to increase with higher obesity levels based on BMI categories. In patients with unknown BMI values, the pattern closely resembles that of the obesity group.
