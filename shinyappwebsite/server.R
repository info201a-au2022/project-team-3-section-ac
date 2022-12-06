library("shiny")
library("dplyr")
library("ggplot2")
library("tidyverse")
library("usmap")
library("plotly")
library("scales")

filename <- "../data/heart_disease_mortality_rates_2000_2019"
df <- read.csv(filename, header = TRUE, stringsAsFactors = FALSE)

# Map filtered dataframe
df_years <- df %>% 
  filter(Data_Value_Unit != "%") %>% 
  filter(Stratification1 == "Ages 65+ years") %>%
  rename(fips = LocationID) %>% 
  filter(Stratification2 == "Overall") %>%
  filter(Stratification3 == "Overall")

# Scatterplot filtered dataframe
filtered <- df %>%
  filter(Stratification1 == "Ages 65+ years") %>%
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
  
  # map plot work 
  
  map_plot <- reactive({
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
  
  # map plot 
  output$map <- renderPlotly({
    map_plot()
  })
  
  # Scatterplot page
  scatterplot <- reactive({
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
  
  output$scatterplotState <- renderPlot({
    scatterplot()
  })
  
  # barchart page
  output$selectState_barchart <- renderUI({
    selectInput(
      inputId = "state_barchart",
      label = "Select a State",
      choices = distinct(df, LocationAbbr), 
      selected = "WA"
    )
  })
  
  output$selectYear_barchart <- renderUI({
    selectInput(
      inputId = "year_barchart",
      label = "Select a year", 
      choices = distinct(df_years, Year),
      selected = "2019"
    )
  })
  
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
  
  output$barchart <- renderPlotly({
    barchart_plot()
  })
  
}
