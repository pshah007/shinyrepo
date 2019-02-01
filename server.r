library(shiny)
library(shinydashboard)

shinyServer(function(input,output)
{
  output$histogram <- renderPlot(
    {
      hist(faithful$eruptions,
           breaks=input$bins
           
           )
    })
    output$approvedSales <- renderInfoBox(
      {
        infoBox("Approval Sales","10,000,000",icon=icon("bar-chart-o"))
      }
      
    )
    output$itemRequested <- renderValueBox(
      {
        valueBox(15*300,"Item Requested By Employees",icon=icon("fire"),color="yellow")
      })

    
  # output$msgOutput <- renderMenu({
  #   msgs <- apply(read.csv("messages.csv"),1,function(row){
  #     messageItem(from = row[["from"]],message = row[["message"]])
  #   })
  #     dropdownMenu(type="message","HELLO")
  #     
  #   })
})