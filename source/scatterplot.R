library(tidyverse)
library(dplyr)
library(ggplot2)

filename <- "../data/heart_disease_mortality_rates_2000_2019"
heart_disease <- read.csv(filename, header = TRUE, stringsAsFactors = FALSE)

wa_filtered <- heart_disease %>%
  filter(Stratification1 == "Ages 65+ years") %>%
  filter(Stratification2 == "Overall") %>%
  filter(Stratification3 == "Overall") %>%
  filter(LocationAbbr == "WA") %>%
  drop_na(Data_Value) %>%
  filter(Data_Value_Unit != "%") %>%
  select(
    LocationID,
    Year,
    LocationAbbr,
    LocationDesc,
    Data_Value,
    Stratification1,
    Stratification2,
    Stratification3
  )

wa_median_death_rate_2000_2019 <- wa_filtered %>%
  group_by(Year) %>%
  summarise(median_death_rate = round(median(Data_Value)))

scatterplot <- ggplot(data = wa_median_death_rate_2000_2019) +
  aes(x = Year, y = median_death_rate) +
  geom_point(size=3) +
  labs(x = "Year", y = "Median Deaths Per 100,000") +
  ylim(350,500) +
  ggtitle("The Median Death Rates of 65+ Year Olds Due To Cardiovascular Disease
                          per 100,000 in Washington from 2000 to 2019")
