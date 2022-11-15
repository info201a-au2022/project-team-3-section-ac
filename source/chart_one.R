library(dplyr)
library(ggplot2)
library(usmap)
library(tidyverse)

filename <- "https://data.cdc.gov/api/views/uc9k-vc2j/rows.csv"
heart_disease <- read.csv(filename, header = TRUE, stringsAsFactors = FALSE)

View(state_fips)
View(heart_disease)

heart_disease <- heart_disease %>% 
  drop_na(Data_Value) %>% 
  select(LocationID, 
         Year, 
         LocationAbbr, 
         LocationDesc, 
         Data_Value,
         Data_Value_Type, 
         Stratification1, 
         Stratification2, 
         Stratification3)

wa_2019 <- heart_disease %>% 
  drop_na(Data_Value) %>% 
  select(LocationID, 
         Year, 
         LocationAbbr, 
         LocationDesc, 
         Data_Value,
         Data_Value_Type, 
         Stratification1, 
         Stratification2, 
         Stratification3) %>% 
  filter(LocationAbbr == "WA" & Year == 2019 & Stratification2 == "Overall"
         & Stratification3 == "Overall" & Stratification1 == "Ages 65+ years") %>%
  rename(fips = LocationID)
View(wa_2019)

plot_usmap(regions = "counties", include = c("WA"), data = wa_2019,
           values = "Data_Value", color = "white") +
  scale_fill_continuous(name = "Average mortality per 100,000 people",
                        label = scales::comma) +
  labs(title = "Average heart disease/stroke mortality per 100,000 people in 2019") +
  theme(legend.position = "right", 
        panel.background = element_rect(color = "black", fill = "lightblue"))
  