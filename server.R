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
  
  
  output$state_map_plot <- renderPlotly({
    
    billionaire_amt_state <- all_data %>%
      filter(country == "United States") %>%
      group_by(state) %>%
      summarize(Billionaires = n())
    
    # billionaire_amt_state <- billionaire_amt_state %>%
    #   replace_na(list(state_number = "NA"))
    
    state_shape <- map_data("state")
    
    # State Map
    my_regions <- state_shape$region
    updated_regions <- str_to_title(my_regions)
    state_shape <- state_shape %>%
      mutate(updated_regions)
    
    billionaire_shape_state_data <- state_shape %>%
      left_join(billionaire_amt_state, by = c("updated_regions" = "state")) %>%
      replace_na(list(Billionaires = 0))
        
        if (input$color_selection == "Purple") {
          light <- "#a6a6df"
            dark <- "#642d8a"
        } else if (input$color_selection== "Yellow") {
          light <- "#ffff9d"
            dark <- "#FFBF00"
        } else {
          light <- "#c6e2ff"
            dark <- "#0025C8"
        }
        
        map_plot <- ggplot(data = billionaire_shape_state_data) +
          geom_polygon(aes(
            x = long,
            y = lat,
            group = group,
            fill = Billionaires,
            text = paste("State:", updated_regions)),
            color = "grey", size = 0.1
          ) +
          scale_fill_gradient(low = light, 
                              high = dark) +
          coord_map() +
          labs(title = "Billionaires in the US", fill = "Number of Billionaires", x = "Longitude", y = "Latitude")
        
        ggplotly(map_plot, tooltip = c("text"))
        
        return(map_plot)
  })
  
  output$world_map_plot <- renderPlotly({
    
    world_shape <- map_data("world")
    
  
    billionaire_amt_country <- all_data %>%
      group_by(country) %>%
      summarize(Billionaires = n())
    
    my_countries <- world_shape$region
    updated_countries <- str_replace(my_countries, "USA", "United States")
    world_shape <- world_shape %>%
      mutate(updated_countries)
    billionaire_shape_world_data <- world_shape %>%
      left_join(billionaire_amt_country, by = c("updated_countries" = "country")) %>%
      replace_na(list(Billionaires = 0))
    
    if (input$color_selection == "Purple") {
      light <- "#a6a6df"
        dark <- "#642d8a"
    } else if (input$color_selection== "Yellow") {
      light <- "#ffff9d"
        dark <- "#FFBF00"
    } else {
      light <- "#c6e2ff"
        dark <- "#000080"
    }
    
    world_map <- ggplot(data = billionaire_shape_world_data) +
      geom_polygon(aes(
        x = long,
        y = lat,
        group = group,
        fill = Billionaires,
        text = paste("Country:", updated_countries)),
        color = "grey", size = 0.1) +
      coord_map() +
      scale_fill_gradient(
        low = light,
        high = dark
      ) +
      labs(title = "Billionaires Around the World", fill = "Number of Billionaires", x = "Longitude", y = "Latitude")
    
    world_map + coord_map(xlim = c(-180, 180))
    
  })
}
    