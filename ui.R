# https://shiny.rstudio.com/images/shiny-cheatsheet.pdf
# Import packages
library(shiny)
library(shinythemes)
library(jsonlite)

data <- fromJSON('https://restcountries.com/v2/all') #import data

htmlTemplate(
  "www/index.html",
  combobox = selectInput("combobox1", "Select a country", choices = data$name),
  country_name = textOutput("header_1"),
  country_flag = uiOutput("flag_out"),
  country_capital = verbatimTextOutput("capital_out"),
  country_population = verbatimTextOutput("population_out"),
  country_region= verbatimTextOutput("region_out"),
  country_subregion = verbatimTextOutput("subregion_out")
)



# 
# 
# ui <- fluidPage(theme = shinytheme("darkly"),
#                 navbarPage(
#                   "Test App",
#                   
#                   tabPanel("Navbar 1",
#                            
#                            sidebarPanel(
#                              selectInput("combobox1", "Select a country", choices = data$name)
#                              
#                            ), # sidebarPanel
#                            
#                            mainPanel(
#                              h2(textOutput("header_1")),
#                              
#                              uiOutput("flag_out"),
#                              
#                              h4("Capital"),
#                              verbatimTextOutput("capital_out"),
#                              
#                              h4("Population"),
#                              verbatimTextOutput("population_out"),
#                              
#                              h4("Region"),
#                              verbatimTextOutput("region_out"),
#                              
#                              h4("Sub-Region"),
#                              verbatimTextOutput("subregion_out")
#                              
#                            ) # mainPanel
#                            
#                   ), # Navbar 1, tabPanel
#                   tabPanel("Navbar 2", ""),
#                   
#                 ) # navbarPage
# ) # fluidPage
