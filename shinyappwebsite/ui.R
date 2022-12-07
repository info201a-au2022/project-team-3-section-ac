library("shiny")
library("ggplot2")
library("plotly")

# intro page
intro <- tabPanel(
  "Introduction",
  titlePanel("Exploring Heart Disease and Stroke Trends"),
  includeMarkdown("../docs/shiny_introduction.md")
)

# input map choices
map_input <- sidebarPanel(uiOutput("selectState"),
                          uiOutput("selectYear"),
                          uiOutput("selectAge"),
                          print("test"))

# state map plot
state_map <- mainPanel(plotlyOutput("map"))

# map page
map_page <- tabPanel(
  "Rates by County", 
  titlePanel("How Heart Diseases Affects Counties"),
  sidebarLayout(
    map_input,
    state_map
  )
)

# scatterplot panel
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
                               uiOutput("selectYear_barchart"),
                               p("This is a chart of the median rate per 100,000 people ages 65+
                                 of cardiovasuclar deaths difference races across all for each
                                 state and year. We chose this graph to see if any races were disaportionally 
                                 subject to cardiovascular disease. We chose median to get rid of 
                                 outliers."))

state_barchart <- mainPanel(plotlyOutput("barchart"))

# The full barchart page
barchart_page <- tabPanel(
  "Median Death Rates by Race",
  titlePanel("Median Cardiovascular Disease and Stroke Death Rates of Various Races"),
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