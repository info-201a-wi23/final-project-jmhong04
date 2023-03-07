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
library(shinythemes)

# Theme
# my_theme <- bs_theme(bg = "black", #background
                     # fg = "white", #foreground color
                    #  primary = "#FCC780") # primary color
                     
                     
# PAGE ONE - INTRODUCTION
intro_tab <- tabPanel(
  "Introduction",
  sidebarPanel(
    img(src = "https://images.pexels.com/photos/259132/pexels-photo-259132.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", width = 400, height = 300),
    p(""),
    img(src = "https://images.unsplash.com/photo-1659019730080-eb6adcdd996c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80", width = 400, height = 250),
    p(""),
    img(src = "https://images.pexels.com/photos/6252325/pexels-photo-6252325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", width = 400, height = 250)),
  mainPanel(
    includeMarkdown("introduction.md")))

      
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
 #  theme = my_theme,
  # Home page title
  "Home Page",
  intro_tab,
  chart_1_tab,
  chart_2_tab,
  chart_3_tab,
  conclusion_tab
)
