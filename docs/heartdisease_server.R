library("shiny")
library("dplyr")
library("ggplot2")
library("tidyverse")
library("usmap")

filename <- "../data/heart_disease_mortality_rates_2000_2019"
df <- read.csv(filename, header = TRUE, stringsAsFactors = FALSE)

# Map filtered dataframe
df_years <- df %>% 
  filter(Data_Value_Unit != "%") %>% 
  filter(Stratification1 == "Ages 65+ years") %>%
  rename(fips = LocationID)

# Scatterplot filtered dataframe
filtered <- df %>%
  filter(Stratification1 == "Ages 65+ years") %>%
  filter(Stratification2 == "Overall") %>%
  filter(Stratification3 == "Overall") %>%
  drop_na(Data_Value) %>%
  filter(Data_Value_Unit != "%")


server <- function(input, output) {
  # Map page
  output$selectState <- renderUI({
    selectInput(
      inputId = "state",
      label = "Select a State",
      choices = distinct(df, LocationAbbr), 
      selected = "WA"
    )
  })
  
  output$selectYear <- renderUI({
    selectInput(
      inputId = "year",
      label = "Select a year", 
      choices = distinct(df_years, Year),
      selected = "2019"
    )
  })
  
  output$map <- renderPlotly({
    map_data <- df_years %>%
      filter(LocationAbbr %in% input$state) %>%
      filter(Year %in% input$year) %>% 
      filter(Stratification2 == "Overall") %>%
      filter(Stratification3 == "Overall") 
    
    map_plot <- plot_usmap(
      regions = "counties", include = input$state, data = map_data,
      values = "Data_Value", color = "white"
    ) +
      scale_fill_continuous(
        name = "Rates per 100,000 people",
        label = scales::comma
      ) +
      labs(title = paste(
        "Heart disease/stroke mortality",
        "rates per 100,000 people"
      )) +
      theme(
        legend.position = "right",
        panel.background = element_rect(color = "white", fill = "lightblue")
      )
    
    map_plot
  })
  
  # Scatterplot page
  output$scatterplotState <- renderPlot({
    filtered <- filtered %>%
      filter(LocationAbbr %in% input$scatterplotState) %>%
      group_by(Year) %>%
      summarise(median_death_rate = round(median(Data_Value)))
    
    scatterplot <- ggplot(data = filtered) +
      aes(x = Year, y = median_death_rate) +
      geom_point(size = 3) +
      labs(x = "Year", y = "Median Deaths Per 100,000") +
      ggtitle(paste(
        "The Median Death Rates of 65+ Year Olds Due To",
        "Cardiovascular Disease per 100,000 in", input$scatterplotState,
        "from 2000 to 2019"
      ))
    scatterplot
  })
}
