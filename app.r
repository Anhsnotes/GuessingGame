#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com/
#

library(shiny)
library(shinyjs)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Guessing Game"),
  
  # Text input for your guess
  sidebarLayout(
    sidebarPanel(
      numericInput("guess",
                   "Please choose a number between 1 and 100:",
                   "",
                   min = 1,
                   max = 100,
                   step = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      textOutput("message")
      #,textOutput("target")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  target <- sample(1:100,1)
  
  message <- reactive ({
    if (is.na(input$guess)) {"Please choose your input."}
    else { if (abs(input$guess - target) <= 5 & abs(input$guess - target) > 0){"We are close to the Earth core!"}
      else { if (abs(input$guess - target) <= 10 & abs(input$guess - target) > 5){"It is hot like summer!"}
        else { if (abs(input$guess - target) <= 15 & abs(input$guess - target) >10){"It is cold like winter!"}
          else { if (abs(input$guess - target) <= 20 & abs(input$guess - target) > 15){"We are in the North Pole!"}
            else { if (abs(input$guess - target) == 0){"Your are the winner!"}
              else {"We are in liquid nitrogen!"}
            }
          }
        }
      }
    }
    
  })
  
  output$message <- renderText(message())
  #output$target <- renderText(target) 
}

# Run the application 
shinyApp(ui = ui, server = server)
