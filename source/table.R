library(tidyverse)
library(dplyr)


filename <- "https://data.cdc.gov/api/views/uc9k-vc2j/rows.csv"
heart_disease_chart <- read.csv(filename, header = TRUE, stringsAsFactors = FALSE)
View(heart_disease_chart)

heart_disease_table <- heart_disease_chart %>% 
  drop_na(Data_Value) %>% 
  select(LocationID, Year, LocationAbbr, LocationDesc, Data_Value,
         Data_Value_Type, Stratification1, Stratification2, Stratification3) %>% 
  filter(Year == "2000-2010" | Year == "2010-2019",
         Stratification2 == "Overall" & Stratification3 == "Overall" &
         Stratification1 == "Ages 35-64 years") %>% 
  rename(fips = LocationID,
         State = LocationAbbr,
         County = LocationDesc,
         Age = Stratification1,
         Race = Stratification2,
         Sex = Stratification3)
heart_disease_table1 <- heart_disease_table %>% 
  group_by(State, Year) %>% 
  summarize(avg_state_stroke_perecent_change = mean(Data_Value))
View(heart_disease_table1)
View(heart_disease_table)
  
