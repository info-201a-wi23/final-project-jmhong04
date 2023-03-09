# load libraries
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
library(maps)
library(mapproj)

# Theme
my_theme <- bs_theme(
  version = 3,
  bootswatch = "journal",
  bg = "#ebe7d5",
  fg = "#000000",
  primary = "#558f5d"
)

# PAGE ONE - INTRODUCTION
intro_tab <- tabPanel(
  "Introduction",
  sidebarPanel(
    img(src = "https://images.pexels.com/photos/259132/pexels-photo-259132.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", width = "100%", height = "100%"),
    p(""),
    img(src = "https://img.freepik.com/free-vector/inheritance-concept-illustration_114360-12914.jpg?w=740&t=st=1678258111~exp=1678258711~hmac=8ae6b03f97f5f5ec60aaf1115a10bd47088f26fb7e99266dda099bc90491d835", width = "100%", height = "100%"),
    p(""),
    img(src = "https://img.freepik.com/free-vector/social-justice-money-flat-composition-with-unequal-opportunities-people-with-more-income-less-illustration_1284-61966.jpg?w=1060&t=st=1678256947~exp=1678257547~hmac=0be704d1a1d24d3af8f96f365ac5dd28a5454695a2740c8ebf8db86ad548490c", width = "100%", height = "100%"),
    p(""),
    img(src = "https://img.freepik.com/free-vector/business-inequality-concept-illustration_114360-8764.jpg?w=900&t=st=1678258207~exp=1678258807~hmac=f4c37d72d69287b8521f366600950eceb5fdac1c27a3655bc9d4ce3810a3823c", width = "100%", height = "100%"),
    width = 4
  ),
  mainPanel(
    includeMarkdown("introduction.md"),
    width = 8
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
  sep = ""
)

gender_checkbox_widget <- checkboxGroupInput(
  inputId = "gender_selection",
  label = "Gender",
  choices = c("F", "M"),
  selected = "F"
)

chart_1_tab <- tabPanel(
  "Age and Gender",
  sidebarLayout(
    sidebarPanel(
      age_slider_widget,
      gender_checkbox_widget
    ),
    chart_1
  ),
  h3("Description"),
  p("The purpose of this scatterplot is to show the net worth for women and men across different ages. It highlights whether age is in fact, correlated with net worth and whether this trend differs between men and women. It seeks to answer our question about the extent to which age and gender have an effect on one's ability to acquire wealth and whether there sare inequalities within these groups (research question #1). The scatterplot aspect of the visualization emphasizes outliers and shows the general trend. The slider and checkbox widget allows the user to view the trends of a smaller age range or specific gender more closely. The interactivity of the plot also allows the user to view the data points that are clustered towards the bottom of the graph.")
)

# PAGE THREE - CHART 2
# Widget 1: Selecting Source of Wealth/Privilege
wealth_checkbox_widget <- checkboxGroupInput(
  inputId = "source_selection",
  label = "Select Source of Wealth",
  choices = c("Self Made", "Not Self Made"),
  #choices = unique(selfMade_data$selfMade),
  selected = "Self Made")

# Widget 2: Selecting Philanthropy Score Range
phil_score_slider_widget <- sliderInput(
  inputId = "philanthropyScore_range",
  label = "Select Philanthropy Score Range:",
  min = 1,
  max = 5,
  value = c(1, 5),
  sep = "")

# Data Visualization / Plot
chart_2 <- mainPanel(
  plotlyOutput(outputId = "chart_2_plot")
)

chart_2_tab <- tabPanel(
  "Privilege and Philanthropy",
  sidebarLayout(
    sidebarPanel(
      wealth_checkbox_widget,
      phil_score_slider_widget),
    chart_2
  ),
  h3("Description"),
  p("This bar chart aims to demonstrate the correlation between billionaires’ source of wealth and privilege, specifically whether or not they are self-made, and their philanthropy score. The philanthropy scores were determined by the value of a billionaire’s donations throughout their life in ratio to the sum of their total donations and net worth. From a scale of 1 to 5, 1 is the least charitable while 5 is the most charitable. This graph helps us answer our question regarding whether an individual’s background (their level of privilege throughout their upbringing), or their individual journey in acquiring their wealth has an effect on their generosity and altruism (research question #2). The slider and checkbox widgets allows the user to compare self-made billionaires' philanthropy scores with that of their non-self-made billionaire counterparts' visually. Moreover, when viewing the data on self-made and non-self-made billionaires simultaneously in a stacked bar chart, the user can better understand the proportion between billionaires in each group and their philanthropy/altruism levels. Conclusions regarding the correlation between a billionaire's financial upbringing (their level of wealth and privilege growing up), and their charitability can correspondingly be made.")
)


# PAGE FOUR - CHART 3
# Color Widget
radio_color_widget <- radioButtons(
  inputId = "color_selection",
  label = "Select Color",
  choices = list("Purple", 
                 "Blue", 
                 "Yellow"),
  selected = "Purple"
)

chart_3 <- mainPanel(
  # Make plot interactive
  plotlyOutput(outputId = "state_map_plot"),
  print(" "),
  plotlyOutput(outputId = "world_map_plot")
)

chart_3_tab <- tabPanel(
  "Domestic and Global Distribution",
  sidebarLayout(
    sidebarPanel(
      radio_color_widget,
      em("The maps may take a few seconds to load.")),
    chart_3
  ),
  h3("Description"),
  p("These density maps use color gradients to show where the highest concentrations of billionaire are located domestically and globally. The world density map of billionaires shows the distribution of billionaires across different regions and countries. This map is helpful in highlighting the countries with the highest number of billionaires. We also used the density map to zoom in on the U.S. and show the distribution of billionaires across the country's various states (excluding Hawaii, Alaska, and U.S. territories). These maps helps answer our question regarding how one’s geographical origin relates to the chances of achieving a net worth in the billions (research question #3). Because the adjacent states with a similar number of billionaires can be hard to distinguish, the color selection widget allows the user to change the contrast between these states' colors. The interactivity of the plot is espescially helpful in the global map as it allows the user to view the distribution of billionaires in smaller regions.")
)


# PAGE 5 - CONCLUSION PAGE
conclusion_tab <- tabPanel(
  "Conclusion",
  fluidPage(
    includeMarkdown("conclusion.md")
  )
)

# COMPILE PAGE 1-5
ui <- navbarPage(
  # Select Theme
  theme = my_theme,
  # Home page title
  "2022 Billionaires",
  intro_tab,
  chart_1_tab,
  chart_2_tab,
  chart_3_tab,
  conclusion_tab
)
