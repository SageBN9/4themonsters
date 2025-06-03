library(shiny)

#dfdata=read.table("4thewords.csv",header=TRUE)
load("4thewords.rdata")

shinyUI(fluidPage(
  titlePanel("4thewords Monster Finder"),
  sidebarLayout(
    sidebarPanel(
      helpText("Search for the best monster"),
      inputPanel(
        textInput("words", label = "# Words", placeholder = "In numbers",value="1200"),
        textInput("minutes", label = "# Minutes", placeholder = "In numbers (of minutes)",value="120"),
        textInput("drop1", label = "Most Important Drop (Caps matters, write XP if none)", value="XP"),
        textInput("drop2", label = "2nd Most Important Drop (Caps matters, write XP if none)", value="XP"),
        textInput("drop3", label = "3rd Most Important Drop (Caps matters, write XP if none)", value="XP")
       )
      ),
      mainPanel( 
         tableOutput("finaldf"),
      )
    )
  )
)