library(dplyr)
library(ggplot2)
library(usmap)
library(tidyverse)

filename <- "https://data.cdc.gov/api/views/uc9k-vc2j/rows.csv"
heart_disease <- read.csv(filename, header = TRUE, stringsAsFactors = FALSE)
state_fips <- read.csv("https://gist.githubusercontent.com/dantonnoriega/bf1acd2290e15b91e6710b6fd3be0a53/raw/11d15233327c8080c9646c7e1f23052659db251d/us-state-ansi-fips.csv",
                       header = TRUE, stringsAsFactors = FALSE)
View(state_fips)
View(heart_disease)

heart_disease <- heart_disease %>% 
  drop_na(Data_Value)
heart_disease1 <- heart_disease %>% 
  filter(Year == 2019)
heart_disease2 <- heart_disease1 %>% 
  filter(Stratification2 == "Overall")

heart_disease3 <- heart_disease2 %>% 
  filter(Stratification3 == "Overall") %>% 
  rename(fips = LocationID)

heart_disease4 <- heart_disease3 %>% 
  group_by(LocationAbbr) %>% 
  summarize(total_data = mean(Data_Value)) %>% 
  rename(state = LocationAbbr)
View(heart_disease4)
View(heart_disease3)
View(statepop)
plot_usmap(data = heart_disease4, values = "total_data", color = "white") +
  scale_fill_continuous(name = "Average heart disease per 100,000 people in 2019", label = scales::comma) +
  theme(legend.position = "right")


plot_usmap(regions = "counties", data = heart_disease3, values = "Data_Value") + 
  scale_fill_continuous(name = "Heart Disease per 100,000 people", label = scales::comma) + 
  labs(title = "US Counties") + 
  theme(legend.position = "right", 
        panel.background = element_rect(color = "black", fill = "lightblue"))