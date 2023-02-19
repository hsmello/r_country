# https://shiny.rstudio.com/images/shiny-cheatsheet.pdf
# Import packages
library(shiny)
library(jsonlite)

data <- fromJSON('https://restcountries.com/v2/all') #import data
# Define server function  

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