library(plotly)
library(bslib)
library(stringr)
library(dplyr)
library(tidyverse)
library(openintro)
library(ggplot2)
library(shiny)
library(markdown)

#Load Dataframe
all_data <- read.csv("final_dataframe.csv", stringsAsFactors = FALSE)
all_data$selfMade[str_detect(all_data$selfMade, "True")] <- "Self Made"
all_data$selfMade[str_detect(all_data$selfMade, "False")] <- "Not Self Made"

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
      #                          y = finalWorth, 
      #                          color = gender)) +
      geom_point(aes(x = age,
                     y = finalWorth, 
                    color = gender,
                    text = paste("Age:", age, "<br>Final Worth:", finalWorth, "<br>Gender:", gender)),
                 position = position_jitter(width = 0.5, height = 3.5)) +
                   scale_x_continuous(breaks = seq(20, 100, 5)) +
                   scale_y_continuous(breaks = seq(0, 220, 25)) +
                   labs(title = "Distribution of Age vs Net Worth by Gender", x = "Age", y = "Net Worth (in billions)", color = "Gender") +
                   scale_color_hue(labels = c("Women", "Men"))
                 
      return(ggplotly(chart_1_plot, tooltip = c("text")))
  })
  
  
    output$chart_2_plot <- renderPlotly({
      
      selfMade_data <- all_data %>%
        filter(selfMade == input$source_selection) %>%
        filter(philanthropyScore >= input$philanthropyScore_range[1] & philanthropyScore <= input$philanthropyScore_range[2])
      
      chart_2_plot <- 
        ggplot(selfMade_data, aes(x = philanthropyScore, fill = selfMade)) +
        geom_histogram(position = "stack", binwidth = 0.5, show.legend = FALSE) +
        labs(x = "Philanthropy Score",
             y = "Number of Billionaires",
             fill = "Source of Wealth",
             title = paste0("Philanthropy Score vs. Billionaires Who Are ", input$source_selection)) + 
        scale_fill_discrete() 
      return(chart_2_plot)
    
  })
  
  
  output$chart_3_plot <- renderPlotly({
    
  })
}
