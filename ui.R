
library(shiny)


shinyUI( pageWithSidebar(
  # Application title
  headerPanel("Number Bingo"),
  
  sidebarPanel(
    #numericInput('guess', 'Number', 1, min = 1, max = 50, step = 1),
    #submitButton('Submit')
    textInput('guess', 'My Pick Is...', value = ""),
    h5('Please press \'Go!\' only on your first attempt'),
    actionButton("goButton", "Go!")
  ), 
  mainPanel(
    h2('Pick a whole number between 1 and 50'),
    h5('No practice required. Just pick a number and try your luck!'),
    h3('Hit the Jackpot?'),
    h4('Your pick is:'),
    verbatimTextOutput("inputValue"),
    h4('Correct or Not?'),
    verbatimTextOutput("outputValue")
    )
)
)