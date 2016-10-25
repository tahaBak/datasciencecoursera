library(shiny)

shinyUI(bootstrapPage(
  
  fluidPage(
    titlePanel("Uploading Files"),
    sidebarLayout(
      
      
      
      sidebarPanel(
        fluidRow(actionButton("importView",label="import data")),
        fluidRow(actionButton("exploreView",label="explore data")),
        fluidRow(actionButton("createView",label="create model")),
        fluidRow(actionButton("predictView",label="predict values"))
                    ),
                mainPanel("main panel",textOutput("text1"),
                          tags$div(id = 'placeholder') 
#                           conditionalPanel(condition="selectedView =='1'", fileInput('file1', 'Choose file to upload',
#                                     accept = c('text/csv','text/comma-separated-values',
#                                                'text/tab-separated-values','text/plain',
#                                                '.csv', '.tsv')),
#                           numericInput("startValue",value=0,label="0"),
#                           numericInput("endValue",value=100,label="100"),
#                          tableOutput('contents'))
              )
      
      )

)))

