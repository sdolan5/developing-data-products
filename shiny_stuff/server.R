library(shiny)

# Load Crime Dataset
data(USArrests)

# Remove Urban Population percentage column
USArrests <- USArrests[, colnames(USArrests) %in% c("Murder", "Assault", "Rape")]
# Create Column with State Names
USArrests$State <- rownames(USArrests)
# Create Column with calculated Danger index
USArrests$Danger <- round(((2 * USArrests$Murder) + (1.5 * USArrests$Rape) + 
                             (0.8 * USArrests$Assault))/3.68064)

## Alternate: Function to calculate Danger Index
dangerFunction <- function(state){
  
  murderRisk <- USArrests$Murder[USArrests$State == state]
  assaultRisk <- USArrests$Assault[USArrests$State == state]
  rapeRisk <- USArrests$Rape[USArrests$State == state]
  
  danger1 <- (2 * murderRisk) + (1.5 * rapeRisk) + (0.8 * assaultRisk)
  danger2 <- round(danger1/ 3.68064)
  
  return(danger2)
}

# Ordered dataframe from safest to most dangerous
dangerRank <- USArrests[ order(USArrests$Danger, decreasing = TRUE), ]

stateRank <- function(state){
  # Gets numerical rank of state from the ordered dataframe
  rank <- which(dangerRank$State == state)
  return(rank)
}


stateDF <- function(state){
  # Pull appropriate states's row from USArrests
  stateArrests <- USArrests[USArrests$State == state, ]
  # Create dataframe for Column Chart
  df <- data.frame(State = stateArrests$State, Murders = stateArrests$Murder, 
                   Rapes = stateArrests$Rape, Assaults = stateArrests$Assault)

}

suppressPackageStartupMessages(library(googleVis))

shinyServer(
  function(input, output) {
    output$oid1 <- renderPrint({input$state})
    output$prediction <- renderPrint({dangerFunction(input$state)})
    output$prediction2 <- renderPrint({stateRank(input$state)})
    output$gvis <- renderGvis({
      gvisGeoChart(USArrests, 
                   "State", "Danger", 
                    options=list(title="Danger Index by State",
                      region="US", 
                      displayMode="regions", 
                      resolution="provinces",
                      width=800, height=300, 
                      colors="['#E42217']"))})
    output$gvis2 <- renderGvis({
      gvisColumnChart(stateDF(input$state), xvar="State", yvar=c("Murders", "Rapes", 
                                             "Assaults"),
                      options=list(title="Crimes by Type (Per 100K People)",
                                   width=400, height=500, legend = 'top'))})
})