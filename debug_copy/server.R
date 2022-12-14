library(shiny)
library(dplyr)
library(ggplot2)
library(tidyverse)
library(usmap)
library(plotly)
library(scales)

filename <- "heart_disease_mortality_rates_2000_2019"
df <- read.csv(filename, header = TRUE, stringsAsFactors = FALSE)

# Map filtered dataframe
df_years <- df %>% 
  filter(Data_Value_Unit != "%") %>%
  rename(fips = LocationID) %>% 
  filter(Stratification2 == "Overall") %>%
  filter(Stratification3 == "Overall")

# Scatterplot filtered dataframe
filtered <- df %>%
  filter(Stratification2 == "Overall") %>%
  filter(Stratification3 == "Overall") %>%
  drop_na(Data_Value) %>%
  filter(Data_Value_Unit != "%")

#barchart filtered dataframe
df_barchart <- df %>%
  filter(Stratification1 == "Ages 65+ years") %>%
  filter(Stratification2 != "Overall") %>%
  filter(Stratification3 == "Overall") %>%
  drop_na(Data_Value) %>%
  filter(Data_Value_Unit != "%")

server <- function(input, output) {
  
  # Map state selector
  output$selectState <- renderUI({
    selectInput(
      inputId = "state",
      label = "Select a State",
      choices = unique(df_years[, "LocationAbbr"]), 
      selected = "WA"
    )
  })
  
  # Map year selector
  output$selectYear <- renderUI({
    selectInput(
      inputId = "year",
      label = "Select a year", 
      choices = unique(df_years[, "Year"]),
      selected = "2019"
    )
  })
  
  # Map age selector
  output$selectAge <- renderUI({
    radioButtons("age", label = "Select an age",
                 choices = c("Ages 35-64 years", "Ages 65+ years"), 
                 selected = "Ages 65+ years")
  })
  
  # map plot work 
  map_plot <- reactive({
    map_data <- df_years %>%
      filter(LocationAbbr %in% input$state) %>%
      filter(Year %in% input$year) %>%
      filter(Stratification1 %in% input$age)
    
    map_plot <- plot_usmap(
      regions = "counties", include = input$state, data = map_data,
      values = "Data_Value", color = "white"
    ) +
      scale_fill_continuous(
        name = "Rates per 100,000 people",
        label = scales::comma
      ) +
      labs(title = paste(
        input$state, "heart disease/stroke mortality",
        "rates per 100,000 people in", input$year
      )) +
      theme(
        legend.position = "right",
        panel.background = element_rect(color = "white", fill = "lightblue")
      )
    
    map_plot
  })
  
  # map plot 
  output$map <- renderPlotly({
    map_plot()
  })
  
  # Scatterplot page
  
  # Scatterplot state selector
  output$selectState_scatterplot <- renderUI({
    selectInput(
      inputId = "state_scatterplot",
      label = "Select a State",
      choices = distinct(df, LocationAbbr), 
      selected = "WA"
    )
  })
  
  # Scatterplot age selector
  output$selectAge_scatterplot <- renderUI({
    radioButtons("age_scatterplot", label = "Select an age",
                 choices = c("Ages 35-64 years", "Ages 65+ years"), 
                 selected = "Ages 65+ years")
  })
  
  # Creating the scatter/line plot
  scatterlineplot <- reactive({
    filtered <- filtered %>%
      filter(Stratification1 == input$age_scatterplot) %>%
      filter(LocationAbbr %in% input$state_scatterplot) %>%
      group_by(Year) %>%
      summarise(median_death_rate = round(median(Data_Value)))
    
    
    scatterlineplot <- ggplot(data = filtered) +
      aes(x = Year, y = median_death_rate, group = 1) +
      geom_point(size = 2) +
      geom_line() +
      labs(x = "Year", y = "Median Deaths Per 100,000") +
      ggtitle(paste(
        "The Median Death Rates of", input$age_scatterplot, "Due To",
        "Cardiovascular Disease per 100,000 in", input$state_scatterplot,
        "from 2000 to 2019"
      ))
    scatterlineplot
  })
  
  # Outputting the scatterplot
  output$scatterplot <- renderPlotly({
    scatterlineplot()
  })
  
  # barchart select state
  output$selectState_barchart <- renderUI({
    selectInput(
      inputId = "state_barchart",
      label = "Select a State",
      choices = unique(df_years[, "LocationAbbr"]), 
      selected = "WA"
    )
  })
  
  # barchart select year
  output$selectYear_barchart <- renderUI({
    selectInput(
      inputId = "year_barchart",
      label = "Select a year", 
      choices = unique(df_years[, "Year"]),
      selected = "2019"
    )
  })
  
  # #barchart plot work
  barchart_plot <- reactive({
    barchart_data <- df_barchart %>%
      filter(LocationAbbr %in% input$state_barchart) %>%
      filter(Year %in% input$year_barchart) %>%
      group_by(Stratification2) %>%
      summarize(median_death_rate = round(median(Data_Value)))

    barchart_plot <- ggplot(data = barchart_data) +
      geom_col(mapping = aes(
        x = Stratification2,
        y = median_death_rate,
        fill = Stratification2
      )) +
      labs(
        x = "Race",
        y = "Median Deaths Per 100,000",
        fill = NULL,
        title = str_wrap(
          "Median Number of Deaths Due To Cardiovascular Disease Per 100,000 In
      People Ages 65+ By Race",
          width = 60
        )
      ) +
      scale_x_discrete(labels = label_wrap(10)) +
      scale_y_continuous(labels = comma)
    barchart_plot
  })

  # barplot
  output$barchart <- renderPlotly({
    barchart_plot()
  })
  
  
  # barplot
  output$barchart <- renderPlotly({
    barchart_plot()
  })
  
  
}