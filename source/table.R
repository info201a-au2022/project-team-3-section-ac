library(tidyverse)
library(dplyr)


filename <- "https://data.cdc.gov/api/views/uc9k-vc2j/rows.csv"
heart_disease_chart <- read.csv(filename, header = TRUE,
                                stringsAsFactors = FALSE)
View(heart_disease_chart)
wa <- heart_disease_chart %>%
  drop_na(Data_Value) %>%
  filter(LocationAbbr == "WA") %>%
  select(
    LocationID,
    Year,
    LocationAbbr,
    LocationDesc,
    Data_Value,
    Data_Value_Type,
    Data_Value_Unit,
    Stratification1,
    Stratification2,
    Stratification3
  ) %>%
  rename(
    fips = LocationID,
    State = LocationAbbr,
    County = LocationDesc,
    Age = Stratification1,
    Race = Stratification2,
    Sex = Stratification3,
    Total_Percent_Change = Data_Value
  )

wa_table <- wa %>%
  filter(Data_Value_Unit == "%" & Race == "Overall" & Sex == "Overall" &
    Age == "Ages 65+ years") %>%
  group_by(County) %>%
  summarize(avg_stroke_rate_change = round(mean(Total_Percent_Change)))
