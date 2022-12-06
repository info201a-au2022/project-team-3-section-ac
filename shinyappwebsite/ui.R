#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# daria's pt start
library(shiny)


map_input <- sidebarPanel(uiOutput("selectState"),
                          uiOutput("selectYear"))

state_map <- 
  mainPanel(plotlyOutput("map"))

map_page <- tabPanel(
  "Map", 
  titlePanel("How Heart Diseases Affects Counties"),
  sidebarLayout(
    map_input,
    state_map
  )
)


shinyUI(navbarPage(
  title = "Project Heart Disease",
  map_page
))
# daria's pt end 