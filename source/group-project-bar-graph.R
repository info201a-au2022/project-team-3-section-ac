library(dplyr)
library(ggplot2)
library(tidyverse)
library(scales)

heart_disease <- read.csv("../data/heart_disease_mortality_rates_2000_2019",
  header = TRUE, stringsAsFactors = FALSE
)

heart_disease_filtered <- heart_disease %>%
  drop_na(Data_Value) %>%
  filter(Year == "2019") %>%
  filter(Stratification1 == "Ages 65+ years") %>%
  filter(Stratification2 != "Overall") %>%
  filter(Stratification3 == "Overall") %>%
  filter(LocationAbbr == "WA") %>%
  filter(Data_Value_Unit != "%") %>%
  select(
    LocationID,
    Year,
    LocationAbbr,
    LocationDesc,
    Data_Value,
    Data_Value_Type,
    Stratification1,
    Stratification2,
    Stratification3
  )

median_death_rate_each_race <- heart_disease_filtered %>%
  group_by(Stratification2) %>%
  summarize(median_death_rate = round(median(Data_Value)))

bargraph <- ggplot(data = median_death_rate_each_race) +
  geom_col(mapping = aes(
    x = Stratification2,
    y = median_death_rate,
    fill = Stratification2
  )) +
  labs(
    x = "Race",
    y = "Median Deaths Per 100,000",
    fill = NULL,
    title = str_wrap(
      "Median Number of Deaths Due To Cardiovascular Disease Per 100,000 In 
      People Ages 65+ By Race In Washington, 2019",
      width = 60
    )
  ) +
  scale_x_discrete(labels = label_wrap(10)) +
  scale_y_continuous(labels = comma)
