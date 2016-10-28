library(shiny)

shinyUI(bootstrapPage(
  
  fluidPage(
    titlePanel("Prediction UI"),
    sidebarLayout(
      
      
      
      sidebarPanel(
        fluidRow(actionButton("docView",label="Documentation")),
        fluidRow(actionButton("importView",label="import data")),
        fluidRow(actionButton("exploreView",label="explore data")),
        fluidRow(actionButton("createModelView",label="create model")),
        fluidRow(actionButton("predictView",label="predict values"))
                    ),
                mainPanel(
                  
                          tags$div(id = 'placeholder') 

              )
      
      )

)))

