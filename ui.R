#load libraries
library(dplyr)
library(ggplot2)
library(stringr)
library(markdown)



intro_tab <- tabPanel(
  # Title of tab
  "Introduction",
  fluidPage(
    # Include a Markdown file!
    includeMarkdown("Introduction.md")
    #p("This project analyzes trends in greenhouse gas emissions.")
  )
)

conclusion_tab <- tabPanel(
  "Conclusion",
  fluidPage(
    includeMarkdown()
  )
)

chart_1_plot <- mainPanel(
  # Make plot interactive
  plotlyOutput(outputId = "chart1")
)

chart_1_tab <- tabPanel(
  "Data Viz 1",
  sidebarLayout(
    sidebarPanel(
      select_widget,
      slider_widget,
      radio_widget),
    chart_1_plot
  )
)

chart_2_plot <- mainPanel(
  # Make plot interactive
  plotlyOutput(outputId = "chart2")
)

chart_2_tab <- tabPanel(
  "Data Viz 2",
  sidebarLayout(
    sidebarPanel(
      select_widget,
      slider_widget,
      radio_widget),
    chart_2_plot
  )
)
chart_3_plot <- mainPanel(
  # Make plot interactive
  plotlyOutput(outputId = "chart3")
)

chart_3_tab <- tabPanel(
  "Data Viz 3",
  sidebarLayout(
    sidebarPanel(
      select_widget,
      slider_widget,
      radio_widget),
    chart_3_plot
  )
)

ui <- navbarPage(
  # Select Theme
  theme = shinytheme("flatly"),
  # Home page title
  "Home Page",
  intro_tab,
  chart_1_tab,
  chart_2_tab,
  chart_3_tab,
  conclusion_tab
)
