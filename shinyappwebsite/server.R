#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(usmap)
library(ggplot2)

# basic dataframe
df <- read.csv("../data/heart_disease_mortality_rates_2000_2019",
               header = TRUE, stringsAsFactors = FALSE)

df_years <- df %>% 
  filter(Data_Value_Unit != "%") %>% 
  filter(Stratification1 == "Ages 65+ years") %>%
  filter(Stratification2 == "Overall") %>%
  filter(Stratification3 == "Overall") %>%
  rename(fips = LocationID)


# outputs the map page
shinyServer(function(input, output) {
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
      filter(Year %in% input$year)

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
  
})
