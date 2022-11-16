library(tidyverse)
library(dplyr)

# Rates and Trends in Hypertension-related Cardiovascular Disease Mortality
# Among US Adults (35+) by County, Age Group, Race/Ethnicity, and
# Sex 2000-2019
filename <- "../data/heart_disease_mortality_rates_2000_2019"
heart_disease <- read.csv(filename, header = TRUE, stringsAsFactors = FALSE)

summary_info <- list()

# County with the most 65+ year old deaths per 100000 in Washington in the
# past 19 years, the number of deaths per 100000, and the year the deaths
# occurred
summary_info$county_most_65_above_deaths_per_100000_in_wa <- heart_disease %>%
  filter(Stratification2 == "Overall") %>%
  filter(Stratification3 == "Overall") %>%
  filter(Stratification1 == "Ages 65+ years") %>%
  filter(LocationAbbr == "WA") %>%
  drop_na(Data_Value) %>%
  filter(Data_Value_Unit != "%") %>%
  filter(Data_Value == max(Data_Value)) %>%
  select(LocationDesc, Data_Value, Year)

# County with the least 65+ year old deaths per 100000 in Washington in the past
# 19 years, the number of deaths per 100000, and the year the deaths occurred.
summary_info$county_least_65_above_deaths_per_100000_in_wa <- heart_disease %>%
  filter(Stratification2 == "Overall") %>%
  filter(Stratification3 == "Overall") %>%
  filter(Stratification1 == "Ages 65+ years") %>%
  filter(LocationAbbr == "WA") %>%
  drop_na(Data_Value) %>%
  filter(Data_Value_Unit != "%") %>%
  filter(Data_Value == min(Data_Value)) %>%
  select(LocationDesc, Data_Value, Year)

# County with the most 35-64 year old deaths per 100000 in Washington in the
# past 19 years, the number of deaths per 100000, and the year the deaths
# occurred
summary_info$county_most_35_to_64_deaths_per_100000_in_wa <- heart_disease %>%
  filter(Stratification2 == "Overall") %>%
  filter(Stratification3 == "Overall") %>%
  filter(Stratification1 == "Ages 35-64 years") %>%
  filter(LocationAbbr == "WA") %>%
  drop_na(Data_Value) %>%
  filter(Data_Value_Unit != "%") %>%
  filter(Data_Value == max(Data_Value)) %>%
  select(LocationDesc, Data_Value, Year)

# County with the least 35-64 year old deaths per 100000 in Washington in the
# past 19 years, the number of deaths per 100000, and the year the deaths
# occurred.
summary_info$county_least_35_to_64_deaths_per_100000_in_wa <- heart_disease %>%
  filter(Stratification2 == "Overall") %>%
  filter(Stratification3 == "Overall") %>%
  filter(Stratification1 == "Ages 35-64 years") %>%
  filter(LocationAbbr == "WA") %>%
  drop_na(Data_Value) %>%
  filter(Data_Value_Unit != "%") %>%
  filter(Data_Value == min(Data_Value)) %>%
  select(LocationDesc, Data_Value, Year)

# County with the highest total percent change in death rate for 35-64 year olds
# in Washington 2010-2019.
summary_info$county_most_percent_death_rate_chge_10_to_19 <- heart_disease %>%
  filter(Stratification1 == "Ages 35-64 years") %>%
  filter(LocationAbbr == "WA") %>%
  drop_na(Data_Value) %>%
  filter(Data_Value_Unit == "%") %>%
  filter(Data_Value == max(Data_Value)) %>%
  select(LocationDesc, Data_Value)

# County with the lowest total percent change in death rate for 35-64 year olds
# in Washington 2010-2019.
summary_info$county_least_percent_death_rate_chge_10_to_19 <- heart_disease %>%
  filter(Stratification1 == "Ages 35-64 years") %>%
  filter(LocationAbbr == "WA") %>%
  drop_na(Data_Value) %>%
  filter(Data_Value_Unit == "%") %>%
  filter(Data_Value == min(Data_Value)) %>%
  select(LocationDesc, Data_Value)

# Number of average deaths between male and females in Washington for every
# 100,000 in 2019.
summary_info$num_avg_deaths_in_wa_for_every_100000_in_2019 <- heart_disease %>%
  filter(LocationAbbr == "WA") %>%
  filter(Stratification1 == "Ages 65+ years") %>%
  drop_na(Data_Value) %>%
  filter(Data_Value_Unit != "%") %>%
  filter(Stratification2 == "Overall") %>%
  filter(Stratification3 == "Overall") %>%
  filter(Year == 2019) %>%
  summarize(avg_deaths = sum(Data_Value)) %>%
  pull(avg_deaths)
