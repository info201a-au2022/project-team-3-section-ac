library(dplyr)
library(ggplot2)
library(usmap)
library(tidyverse)

filename <- "../data/heart_disease_mortality_rates_2000_2019"
heart_disease <- read.csv(filename, header = TRUE, stringsAsFactors = FALSE)

wa_2019 <- heart_disease %>%
  drop_na(Data_Value) %>%
  select(
    LocationID,
    Year,
    LocationAbbr,
    LocationDesc,
    Data_Value,
    Stratification1,
    Stratification2,
    Stratification3
  ) %>%
  filter(LocationAbbr == "WA" & Year == 2019 & Stratification2 == "Overall" &
    Stratification3 == "Overall" &
    Stratification1 == "Ages 65+ years") %>%
  rename(fips = LocationID)

wa_2019_plot <- plot_usmap(
  regions = "counties", include = c("WA"), data = wa_2019,
  values = "Data_Value", color = "white"
  ) +
  scale_fill_continuous(
    name = "Rates per 100,000 people",
    label = scales::comma
  ) +
  labs(title = paste(
    "Washington's heart disease/stroke mortality",
    "rates per 100,000 people in 2019"
  )) +
  theme(
    legend.position = "right",
    panel.background = element_rect(color = "white", fill = "lightblue")
  )
