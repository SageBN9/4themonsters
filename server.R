library(shiny)
library(dplyr)

#dfdata=read.table(df,header=TRUE)
load("4thewords2.rdata")

shinyServer(function(input, output){
    output$finaldf = renderTable({
      word.ints = strtoi(input$words)
      minutes   = strtoi(input$minutes)
      drop.a = input$drop1
      drop.b = input$drop2
      drop.c = input$drop3

      df = df2[,c("monsters","words","min",drop.a,drop.b,drop.c)]
      keepers=!apply(df,1,function(row){any(is.na(row))})
      
      df=df[keepers,]
      df=df[df$words<=word.ints,]
      df=df[df$min <= minutes,]
      df$totalNumberDroppedInWords = (word.ints %/% df$words)*df[[drop.a]]
      df = df[order(df$totalNumberDroppedInWords, decreasing = TRUE), ] 
      return(df)
    })
})