library(dplyr)
library(ggplot2)
library(tidyverse)

heart_disease <- read.csv("https://data.cdc.gov/api/views/uc9k-vc2j/rows.csv",
  header = TRUE, stringsAsFactors = FALSE
)

# I'm not sure if there's a certain order you want these filtered. - Luna
# code for filtering
heart_disease_filtered <- heart_disease %>%
  filter(Year == "2019") %>%
  filter(Stratification2 != "Overall") %>%
  filter(LocationAbbr == "WA")

# I'm not sure if there's a certain order you want these filtered. - Luna
# code for filtering
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

bargraph <- ggplot(data = heart_disease_filtered) +
  geom_col(mapping = aes(x = Stratification2, y = Data_Value, fill = Stratification2)) +
  labs(
    x = "Race",
    y = "deaths per 100,000",
    fill = NULL,
    title = str_wrap(
      "Number of deaths in people ages 65+ due to cardiovascular disease by race in Washington, 2019",
      width = 60
    )
  ) +
  scale_x_discrete(guide = guide_axis(n.dodge = 2))

# take out overalls from race
# take out all ages except 65+
# sort by just counties in Washington, not doing counties anymore
# make bar graph
