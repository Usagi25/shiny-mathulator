# My first Shiny app all by myself!
# Andrew Zalesak, July 12th, 2022

# load R packages ----
library(shiny)

# define mathematical operation ----
foo <- function(first, second, operation){
  if (operation == 1){
    return(first + second)
  } else {return(first * second)}
}

# define UI ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("The Mathulator!"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: First number ----
      numericInput("first", label = h3("First number"),
                   value = 2),
      
      # Input: Second number ----
      numericInput("second", label = h3("Second number"),
                   value = 3),
      
      # Input: Radio buttons for addition or multiplication ----
      radioButtons("operation", label = h3("Operation"),
                   choices = list("Add" = 1, "Multiply" = 2),
                   selected = 1)
    ), # sidebarPanel
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      h4("The result of your calculation is:"),
      
      # Output: Number that is result of calculation
      textOutput("calculation")
    ) # mainPanel
    
  ) # sidebarLayout
) # fluidPage

# define server ----
server <- function(input, output) {
  
  output$calculation <- renderText({
    paste(foo(input$first, input$second, input$operation))
  })
} # server

# Create Shiny object ----
shinyApp(ui = ui, server = server)