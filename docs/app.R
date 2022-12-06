library("shiny")
library("dplyr")
library("usmap")
library("ggplot2")
library("plotly")

source("heartdisease_ui.R")
source("heartdisease_server.R")

shinyApp(ui = ui, server = server)