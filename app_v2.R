# https://shiny.rstudio.com/images/shiny-cheatsheet.pdf
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
                             selectInput("combobox1", "Select a country", choices = data$name)
                             
                           ), # sidebarPanel
                           
                           mainPanel(
                             h2(textOutput("header_1")),
                             
                             uiOutput("flag_out"),
                             
                             h4("Capital"),
                             verbatimTextOutput("capital_out"),
                             
                             h4("Population"),
                             verbatimTextOutput("population_out"),
                             
                             h4("Region"),
                             verbatimTextOutput("region_out"),
                             
                             h4("Sub-Region"),
                             verbatimTextOutput("subregion_out")
                             
                           ) # mainPanel
                           
                  ), # Navbar 1, tabPanel
                  tabPanel("Navbar 2", "This panel is intentionally left blank"),
                  tabPanel("Navbar 3", "This panel is intentionally left blank")
                  
                ) # navbarPage
) # fluidPage

# Define server function  
#country_capital <- data$capital
#country_population <- data$population
#country_population <- data$population

country_name <- data$name
server <- function(input, output) {
  
  output$header_1 <- renderText({
    country_code = which(country_name == input$combobox1)
    paste( data$name[country_code] )
  })

  output$capital_out <- renderText({
    country_code = which(country_name == input$combobox1)
    paste( data$capital[country_code] )
  })
  
  output$population_out <- renderText({
    country_code = which(country_name == input$combobox1)
    paste( formatC(data$population[country_code], big.mark = "," ))
  })

  output$region_out <- renderText({
    country_code = which(country_name == input$combobox1)
    paste( data$region[country_code])
  })
    
  output$subregion_out <- renderText({
    country_code = which(country_name == input$combobox1)
    paste( data$subregion[country_code])
  })

  output$flag_out <- renderUI({
    country_code = which(country_name == input$combobox1)
    tags$img(src = data$flag[country_code], width = "30%")
  })
  

} # server


# Create Shiny object
shinyApp(ui = ui, server = server)