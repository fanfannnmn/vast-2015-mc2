#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(rsconnect)
library(lubridate)
library(dplyr)
library(ggplot2)
library(shinyWidgets)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel(""),

    ## create tab structure
    tabsetPanel(
      
      ## create first tab side bar     
      tabPanel("Message Frequency by Sender", fluid = TRUE,
             sidebarLayout(
               sidebarPanel(
                 radioButtons("data",
                              "Choose work day:",
                              c("Friday" = "fri_combined",
                                "Saturday" = "sat_combined",
                                "Sunday" = "sun_combined")),
                 
                 sliderTextInput("time_slot",
                                 "Select hours:",
                                 choices = c(8:23),
                                 grid = TRUE),
                 
                 checkboxGroupInput("location",
                                    "Choose locations:",
                                    c("Coaster Alley", "Entry Corridor", 
                                      "Kiddie Land", "Tundra Land", "Wet Land"),
                                    selected = c("Coaster Alley", "Entry Corridor", 
                                                 "Kiddie Land", "Tundra Land", "Wet Land"))
               ),
               
               ## first tab plot
               mainPanel(
                 plotOutput("p1")
                 )
      )
    ),
    
    ## create second plot slide bar
    tabPanel("Message Frequency by Location", fluid = TRUE,
             sidebarLayout(
               sidebarPanel(
                 radioButtons("dataset",
                              "Choose work day:",
                              c("Friday" = "fri_combined",
                                "Saturday" = "sat_combined",
                                "Sunday" = "sun_combined"))
               ),
               
               ## second tab plot
               mainPanel(
                 plotOutput("p2")
               )
             )
      
    ),
    
    ## create third plot slide bar
    tabPanel("Message Frequency by Hour", fluid = TRUE,
             sidebarLayout(
               sidebarPanel(
                 checkboxGroupInput("weekday",
                                    "Choose work day:",
                                    c("Friday", "Saturday", "Sunday"),
                                    selected = c("Friday", "Saturday", "Sunday"))
               ),
               
               ## third tab plot
               mainPanel(
                 plotlyOutput("p3")
               )
             ))
    
    )
))
