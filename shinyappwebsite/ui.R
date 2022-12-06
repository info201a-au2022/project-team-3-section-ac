library("shiny")
library("dplyr")
library("usmap")
library("ggplot2")
library("plotly")
library("tidyverse")
library("scales")

intro <- tabPanel(
  "Introduction",
  titlePanel("Exploring Heart Disease and Stroke Trends"),
  includeMarkdown("../source/shiny_introduction.md")
)

map_input <- sidebarPanel(uiOutput("selectState"),
                          uiOutput("selectYear"))

state_map <- mainPanel(plotlyOutput("map"))

map_page <- tabPanel(
  "Map", 
  titlePanel("How Heart Diseases Affects Counties"),
  sidebarLayout(
    map_input,
    state_map
  )
)

scatterplot_ui <- tabPanel(
  "Median Death Rate in Each State",
  titlePanel("How has the median heart disease rate per 100,000 changed over
    time in each state?"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "scatterplotState",
        "Select a State",
        c(
          "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL", "GA", "HI",
          "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN",
          "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH",
          "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA",
          "WV", "WI", "WY"
        )
      )
    ),
    mainPanel(
      plotOutput(outputId = "scatterplotState")
    )
  )
)

# barchart
barchart_input <- sidebarPanel(uiOutput("selectState_barchart"),
                               uiOutput("selectYear_barchart"))

state_barchart <- mainPanel(plotlyOutput("barchart"))

barchart_page <- tabPanel(
  "Barchart",
  titlePanel("Median Cardiovascular Disease and Stroke Death Rates of Various Races"),
  sidebarLayout(
    barchart_input,
    state_barchart
  )
)

ui <- navbarPage(
  "Project Heart Disease",
  intro,
  map_page,
  scatterplot_ui,
  barchart_page
)