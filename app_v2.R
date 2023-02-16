# Load R packages
library(shiny)
library(shinythemes)
library(jsonlite)

data <- fromJSON('https://restcountries.com/v2/all')
# Define UI
ui <- fluidPage(theme = shinytheme("darkly"),
                navbarPage(
                  "Test App",

                  tabPanel("Navbar 1",
                           
                           sidebarPanel(
                             tags$h3("Input:"),
                             selectInput("combobox1", "Select a country", choices = data$name)
                             
                           ), # sidebarPanel
                           
                           mainPanel(
                             h1("Header 1"),
                             
                             h4("Capital"),
                             verbatimTextOutput("capital_out"),
                             
                             h4("Population"),
                             verbatimTextOutput("population_out"),
                             
                           ) # mainPanel
                           
                  ), # Navbar 1, tabPanel
                  tabPanel("Navbar 2", "This panel is intentionally left blank"),
                  tabPanel("Navbar 3", "This panel is intentionally left blank")
                  
                ) # navbarPage
) # fluidPage


# Define server function  


#country_name <- data$name
#country_capital <- data$capital
#country_population <- data$population
#country_population <- data$population

server <- function(input, output) {

  output$capital_out <- renderText({
    country_code = which(country_name == input$combobox1)
    paste( data$capital[country_code] )
  })
  
  output$population_out <- renderText({
    country_code = which(country_name == input$combobox1)
    paste( formatC(data$population[country_code], big.mark = "," ))
  })
} # server


# Create Shiny object
shinyApp(ui = ui, server = server)