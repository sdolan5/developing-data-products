library(shiny)
shinyUI(fluidPage(
  titlePanel("How Dangerous is Your State?"),
  
  sidebarLayout(
    
    sidebarPanel(
      textInput(inputId="state", label = "State", value = "Enter text..."),
      htmlOutput("gvis2")
    ),
  mainPanel(
    h4('You entered:'),
    verbatimTextOutput("oid1"),
    h4('Which resulted in a Danger Index of:'),
    verbatimTextOutput("prediction"),
    h4('This state ranks number:'),
    verbatimTextOutput("prediction2"),
    htmlOutput("gvis") 
  )
  )
))