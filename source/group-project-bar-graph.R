library(dplyr)
library(ggplot2)
library(tidyverse)

heart_disease <- read.csv("https://data.cdc.gov/api/views/uc9k-vc2j/rows.csv", header = TRUE, stringsAsFactors = FALSE)
View(heart_disease)

<<<<<<< HEAD
# I'm not sure if there's a certain order you want these filtered. - Luna
# code for filtering
heart_disease_filtered <- heart_disease %>%
  filter(Year == "2019") %>%
  filter(Stratification2 != "Overall") %>%
  filter(LocationAbbr == "WA") %>%
=======
#I'm not sure if there's a certain order you want these filtered. - Luna
#code for filtering
heart_disease_filtered <- heart_disease %>% 
>>>>>>> 53d34820243894e29ccc77b13a4603020e617721
  drop_na(Data_Value) %>%
  filter(Year == "2019") %>%
  filter(Stratification1 == "Ages 65+ years") %>%
  filter(Stratification2 != "Overall") %>%
  filter(Stratification3 == "Overall") %>%
  filter(LocationAbbr == "WA") %>%
  filter(Data_Value_Unit != "%") %>%
<<<<<<< HEAD
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

View(heart_disease_filtered)
# code for making bar graph
bargraph <- ggplot(data = heart_disease_filtered) +
  geom_col(mapping = aes(x = Stratification2, y = Data_Value, fill = Stratification2))
=======
  select(LocationID,
        Year,
        LocationAbbr,
        LocationDesc,
        Data_Value,
        Data_Value_Type,
        Stratification1,
        Stratification2,
        Stratification3) %>%
  rename(Race = Stratification2) %>%
  rename(death_rate_per_100000 = Data_Value)

View(heart_disease_filtered)
#code for making bar graph
ggplot(data = heart_disease_filtered) +
  geom_col(mapping = aes(x = Race, y = death_rate_per_100000, fill = Race))
  
>>>>>>> 53d34820243894e29ccc77b13a4603020e617721

# take out overalls from race
# take out all ages except 65+
# sort by just counties in Washington, not doing counties anymore
# make bar graph
