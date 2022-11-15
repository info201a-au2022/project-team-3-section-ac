library(tidyverse)
library(dplyr)
library(ggplot2)

filename <- "https://data.cdc.gov/api/views/uc9k-vc2j/rows.csv"
heart_disease <- read.csv(filename, header = TRUE, stringsAsFactors = FALSE)

wa_filtered <- heart_disease %>%
  filter(Stratification1 == "Ages 65+ years") %>%
  filter(Stratification2 == "Overall") %>%
  filter(LocationAbbr == "WA") %>%
  filter(Year == 2019) %>%
  drop_na(Data_Value) %>%
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

wa_female <- wa_filtered %>%
  filter(Stratification3 == "Female") %>%
  summarize(deaths_per_100000 = sum(Data_Value)) %>%
  pull(deaths_per_100000)

wa_male <- wa_filtered %>%
  filter(Stratification3 == "Male") %>%
  summarize(deaths_per_100000 = sum(Data_Value)) %>%
  pull(deaths_per_100000)

percentage_female <- round(wa_female / (wa_female + wa_male) * 100, 0)
percentage_male <- round(wa_male / (wa_female + wa_male) * 100, 0)

df <- data.frame(
  sex = c("Female", "Male"),
  deaths_per_100000 = c(wa_female, wa_male),
  percentage_of_deaths = c(percentage_female, percentage_male)
)

piechart <- ggplot(df, aes(x = "", y = deaths_per_100000, fill = sex)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  geom_text(aes(label = paste0(percentage_of_deaths, "%")),
    position = position_stack(vjust = 0.5)
  ) +
  labs(
    x = NULL,
    y = "deaths per 100,000",
    fill = NULL,
    title = "Number of deaths in people ages 65+ due to cardiovascular disease in Washington, 2019"
  )
