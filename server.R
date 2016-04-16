

BMR<-function(weight,gender,age,height) {
  if (gender=="Female") 
    return(655+(4.35*weight)+(4.7*height)-(4.7*age))
  else  return(66+(((6.23*weight)+(12.7*height))-(6.8*age)))
}
library(reshape2)
library(shiny)

shinyServer(function(input, output) {
       output$weight <- renderPrint({input$weight})
    output$BMR <- renderPrint({
      input$goButton
      isolate(BMR(input$weight,input$gender,input$age,input$height))
    })
      
    AM<-function(BMR){
      BMR<- isolate(BMR(input$weight,input$gender,input$age,input$height))
      if (is.na(BMR)) return ("")
      else {
        if(input$activity=="Sedentary (little or no exercise)")
          return(BMR*1.2)
        if(input$activity=="Lightly Active (light exercise/sports 1-3 days/week)")
          return(1.375*BMR)
        if(input$activity=="Moderately Active (moderate exercise/sports 3-5 days/week)")
          return(1.55*BMR)
        if(input$activity=="Very Active (hard exercise/sports 6-7 days a week)")
          return(1.725*BMR)
        if(input$activity=="Extra Active (very hard exercise/sports & physical job or 2x training)")
          return(1.9*BMR)
      }
    }
    output$AM <- renderPrint({
      input$goButton
      isolate(AM(BMR(input$weight,input$gender,input$age,input$height)))
})
})
