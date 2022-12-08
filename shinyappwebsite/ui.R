library(shiny)
library(dplyr)
library(ggplot2)
library(tidyverse)
library(usmap)
library(plotly)
library(scales)

# intro page
intro <- tabPanel(
  "Introduction",
  titlePanel("Exploring Heart Disease and Stroke Trends"),
  includeMarkdown("../docs/shiny_introduction.md")
)

# input map choices
map_input <- sidebarPanel(
  uiOutput("selectState"),
  uiOutput("selectYear"),
  uiOutput("selectAge")
)

# state map plot
state_map <- mainPanel(plotlyOutput("map"))

# map page
map_page <- tabPanel(
  "Rates by County",
  titlePanel("How Heart Diseases Affects Counties"),
  sidebarLayout(
    map_input,
    state_map
  ),
  p("The different state maps and their respective
    counties show the different cardiovascular disease
    and stroke death rates for either people ages 35-64
    years or people ages 65+ in each county of a given
    state and a given year. It shows the overall
    population rate rather than individual races or
    gender to paint a full picture of the entire
    population. The purpose of the map is to visualize
    the counties that have the highest and lowest
    rates, and if there are any changes to the lowest
    and highest rates throughout the years. Looking at
    different county rates is important because one can
    analyze specific counties as to what feature
    differences they have that could influence the
    heart disease and stroke death rates that they
    have. One thing that has seemed to be consistent
    throughout the age populations is that rates for
    35-64 years are much lower than 65+, which reflects
    the fact that older people have a higher chance of
    dying of heart disease.")
)

# input choices for scatterplot
scatterplot_input <- sidebarPanel(
  uiOutput("selectState_scatterplot"),
  uiOutput("selectAge_scatterplot")
)

# scatterplot and brief reflection
scatterplot <- mainPanel(plotlyOutput("scatterplot"))

# scatterplot page
scatterplot_ui <- tabPanel(
  "Median Death Rate in Each State",
  titlePanel("How has the median heart disease rate per 100,000 changed over
    time in each state?"),
  sidebarLayout(
    scatterplot_input,
    scatterplot
  ),
  h2("Why is this graph important?"),
  p("This graph is important because while it doesn't show any dispairities 
    outright, it allows us to see the timespans where inequalities were possibly
    occuring. One of the main goals of this graph was to visualize the change
    in the death rates over time to see if, as a country and as states, we were
    doing a good job of mitigating the severity of cardiovascular disease or if 
    more work and reform is needed in our health systems. Another goal of this
    graph was to highlight spans of time where the death rates were irregular.
    By doing this, we acknowledge that there are external factors that likely 
    need to be investigated, such as new policies, the abolishment of policies,
    food shortages, and economic factors."),
  h2("Why did we use median?"),
  p("This graph uses the median death rate per 100,000 people to prevent our
    interpretations from being skewed by outliers. Several counties, such as
    Los Angeles, have extremely high death rates and as a result increase the
    mean death rate of their state significantly."),
  h2("What are some findings from the data?"),
  p("From this visualization, we can see that most of the states have a
    consistent upwards trend in the death rates of 35-64 year olds since 2000.
    This is largely concerning because heart disease becomes more common the
    older one ages. There is an obvious need for preventative measures in some
    way for this group of people who, originally, were not at as much risk.")
)

# barchart
barchart_input <- sidebarPanel(
  uiOutput("selectState_barchart"),
  uiOutput("selectYear_barchart"),
  p("This is a chart of the median rate per 100,000 people ages 65+
    of cardiovasuclar deaths difference races across all for each
    state and year. We chose this graph to see if any races were disaportionally
    subject to cardiovascular disease. We chose median to get rid of
    outliers.")
)

state_barchart <- mainPanel(plotlyOutput("barchart"))

# The full barchart page
barchart_page <- tabPanel(
  "Median Death Rates by Race",
  titlePanel("Median Cardiovascular Disease Death Rates of Various Races"),
  sidebarLayout(
    barchart_input,
    state_barchart
  )
)

# Summary Takeaways
summary_page <- tabPanel(
  "Summary Takeaways",
  includeMarkdown("../docs/summary_takeaway.md")
)

# Full Report
report_page <- tabPanel(
  "Full Report",
  includeMarkdown("../docs/p01-proposal.md")
)

ui <- navbarPage(
  theme = shinythemes::shinytheme("united"),
  "Project Heart Disease",
  intro,
  map_page,
  scatterplot_ui,
  barchart_page,
  summary_page,
  report_page
)
