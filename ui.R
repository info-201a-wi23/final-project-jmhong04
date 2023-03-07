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
  )
)


# PAGE TWO - CHART 1
chart_1 <- mainPanel(
  # Make plot interactive
  plotlyOutput(outputId = "chart_1_plot")
)

age_slider_widget <- sliderInput(
  inputId = "age_selection",
  label = "Age",
  min = 19,
  max = 100,
  value = c(20, 60),
  sep = "")

gender_checkbox_widget <- checkboxGroupInput(
  inputId = "gender_selection",
  label = "Gender",
  choices = c("F", "M"),
  selected = "F"
)

chart_1_tab <- tabPanel(
  "Data Viz 1",
  sidebarLayout(
    sidebarPanel(
      age_slider_widget,
      gender_checkbox_widget),
    chart_1
  )
)

# PAGE THREE - CHART 2
chart_2 <- mainPanel(
  # Make plot interactive
  plotlyOutput(outputId = "chart_2_plot")
)

chart_2_tab <- tabPanel(
  "Data Viz 2",
  sidebarLayout(
    sidebarPanel(),
    chart_2
  )
)


# PAGE FOUR - CHART 3
chart_3 <- mainPanel(
  # Make plot interactive
  plotlyOutput(outputId = "chart_3_plot")
)

chart_3_tab <- tabPanel(
  "Data Viz 3",
  sidebarLayout(
    sidebarPanel(),
    chart_3
  )
)


# PAGE 5 - CONCLUSION PAGE
conclusion_tab <- tabPanel(
  "Conclusion",
  fluidPage(
    #includeMarkdown()
  )
)

# COMPILE PAGE 1-5
ui <- navbarPage(
  # Select Theme
  #theme = shinytheme("flatly"),
  # Home page title
  "Home Page",
  intro_tab,
  chart_1_tab,
  chart_2_tab,
  chart_3_tab,
  conclusion_tab
)
