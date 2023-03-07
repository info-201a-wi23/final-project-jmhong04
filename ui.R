#load libraries
library(plotly)
library(bslib)
library(stringr)
library(dplyr)
library(tidyverse)
library(openintro)
library(ggplot2)
library(shiny)
library(markdown)


# PAGE ONE - INTRODUCTION
intro_tab <- tabPanel(
  # Title of tab
  "Introduction",
  fluidPage(
    # Include a Markdown file!
    includeMarkdown("Introduction.md")
    #p("This project analyzes trends in greenhouse gas emissions.")
  )
)



# PAGE TWO - CHART 1
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

# PAGE THREE - CHART 2
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


# PAGE FOUR - CHART 3
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


# PAGE 5 - CONCLUSION PAGE
conclusion_tab <- tabPanel(
  "Conclusion",
  fluidPage(
    includeMarkdown()
  )
)

# COMPILE PAGE 1-5
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
