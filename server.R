
library(shiny)

#Set the target number
number <- 38
#print(number)
numberGuessed <- function(guess, number) {
  returnValue <- "Nothing entered yet."
  if (guess > 50) {
    returnValue <- 'Above 50.'
  }
  else if (guess < 1) {
    #print(guess)
    returnValue <- 'Below 1.\nPlease make a selection between 1 and 50.'
  }
  else if (guess > number) {
    returnValue <- 'Go lower than that! You"re getting close!'
  }
  else if (guess < number) {
    returnValue <- 'Go higher than that! Almost hitting the target!'
  }
  else if (guess == number) {
    returnValue <- 'Bingo!'
  }
  returnValue
}
shinyServer( 
  function(input, output) {
    output$inputValue <- renderPrint({as.numeric(input$guess)})
    #output$outputValue <- renderText({numberGuessed(input$guess, number)})
    output$outputValue <- renderText({
      if (input$goButton == 0) "Pick a Number!"
      else if (input$goButton >= 1) numberGuessed(as.numeric(input$guess), number)
    })
  }
)
