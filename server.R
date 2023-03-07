library(plotly)
library(bslib)
library(stringr)
library(dplyr)
library(tidyverse)
library(openintro)
library(ggplot2)
library(shiny)
library(markdown)


all_data <- read.csv("final_dataframe.csv", stringsAsFactors = FALSE)

server <- function(input, output) {
  
  output$chart_1_plot <- renderPlotly({
    
    chart_world_data <- all_data %>%
      select(age, finalWorth, gender) %>%
      filter(gender == "F" | gender == "M")
    
    chart_world_data <- chart_world_data %>%
      na.omit(chart_world_data)
    
    chart_world_data <- chart_world_data %>%
      filter(gender %in% input$gender_selection) %>%
      filter(age > input$age_selection[1] & age < input$age_selection[2])
    
    chart_1_plot <- ggplot(data = chart_world_data) +
      # geom_line(mapping = aes(x = age, 
      #                         y = finalWorth, 
      #                         color = gender)) +
      geom_point(aes(x = age,
                     y = finalWorth, 
                    color = gender,
                    text = paste("Age:", age, "<br>Final Worth:", finalWorth, "<br>Gender:", gender))) +
                   scale_x_continuous(breaks = seq(20, 100, 5)) +
                   scale_y_continuous(breaks = seq(0, 220, 25)) +
                   labs(title = "Distribution of Age vs Net Worth by Gender", x = "Age", y = "Net Worth (in billions)", color = "Gender") +
                   scale_color_hue(labels = c("Women", "Men"))
                 
      return(ggplotly(chart_1_plot, tooltip = c("text")))
  })
  
  
  output$chart_2_plot <- renderPlotly({
    
  })
  
  
  output$chart_3_plot <- renderPlotly({
    
  })
}
