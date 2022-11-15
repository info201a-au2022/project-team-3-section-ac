library(dplyr)
library(ggplot2)
library(tidyverse)

heart_disease <- read.csv("https://data.cdc.gov/api/views/uc9k-vc2j/rows.csv", header = TRUE, stringsAsFactors = FALSE)
View(dataset)

heart_disease_filtered <- heart_disease %>% 
  filter(Stratification2 != "Overall") %>% 
  filter(LocationAbbr == "WA") %>%
  drop_na(Data_value) %>%
  filter(Data_Value_Unit != "%")

View(heart_disease_filtered)

select(LocationID,
       Year,
       LocationAbbr,
       LocationDesc,
       Data_Value,
       Data_Value_Type,
       Stratification1,
       Stratification2,
       Stratification3)

ggplot(data = heart_disease_filter) +
  geom_col(mapping = aes(x = Stratification2, fill = Stratification2))

#take out overalls
#take out any 65+
#sort by just counties in Washington, not doing counties anymore
#make bar graph

