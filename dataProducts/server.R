


# By default, the file size limit is 5MB. It can be changed by
# setting this option. Here we'll raise limit to 9MB.
options(shiny.maxRequestSize = 9*1024^2)

shinyServer(function(input, output,session) {

    cols<-NULL
    colsNames<-NULL
    inFile<-NULL
    
    data<-NULL
    selectedCol<-NULL
    
    resultPredict<-NULL
    
    max1<-100
    max2<-100
    
    min1<-0
    min2<-0
    myModel<-NULL
    
    
    
    observeEvent(input$docView, {
      
      removeUI (
        selector='#test'
      )
      
      insertUI(
        selector = '#placeholder',
        ui = tags$div(id="test", mainPanel(
                                span(h4("This application is simple model of web application aiming to provide a predictions using classical models")),
                                span(h4("import data --> It allows to import data from csv file")),
                                span(h4("explore data --> It allows to explore data frame using histogram and barplots")),
                                span(h4("create model --> It allows creating prediction model, by the selecting predicators && outcome && model then generate model by clicking on 'Go Model'")),
                                span(h4("predict values --> It allows to import data from csv file then use the model the predict values "))
                                
                                
                                
                                )))
    })
    
    
    
    observeEvent(input$importView, {
      

      removeUI (
        selector='#test'
      )
      
      insertUI(
        selector = '#placeholder',
        ui = tags$div(id="test", mainPanel(fileInput('file1', 'Choose file to upload',
                                        accept = c('text/csv','text/comma-separated-values',
                                                'text/tab-separated-values','text/plain',
                                       '.csv', '.tsv')),
                                       fluidRow(numericInput("startValue1",value=min1,label="From"),
                        numericInput("endValue1",value=max1,label="To")),
                        tableOutput('contents'))))
       })
    
    
    observeEvent(input$exploreView, {
      
 
      removeUI (
        selector='#test'
      )

      if(is.null(colsNames)){
        return(NULL)
      }
      
      insertUI(
        selector = '#placeholder',
        ui = tags$div(id="test", mainPanel(uiOutput('exploreView'),
                                           radioButtons("selectedCol", "Distribution type:",
                                                        colsNames),
                                           plotOutput('myHisto'))))
      
    })
    
        
    observeEvent(input$createModelView, {

      removeUI (
        selector='#test'
      )
      choices<-c("lm","glm","rf")
      
      if(is.null(colsNames)){
        return(NULL)
      }
      insertUI(
        selector = '#placeholder',
        ui = tags$div(id="test", mainPanel(       
                                           checkboxGroupInput("modelColumns", "features to use", colsNames),
                                           selectInput("modelPredict", "model to use", choices),
                                           radioButtons("featureToPredict", "Distribution type:",
                                                        colsNames),
                                           actionButton("GoModeling",label="Go Modeling")
                                           )))
      
      
      
    })
    
    
    observeEvent(input$predictView, {
 
      removeUI (
        selector='#test'
      )
      
      if(is.null(myModel)){
        return(NULL)
      }
      insertUI(
        selector = '#placeholder',
        ui = tags$div(id="test", mainPanel(fileInput('file2', 'Choose file to upload',
                                                     accept = c('text/csv','text/comma-separated-values',
                                                                'text/tab-separated-values','text/plain',
                                                                '.csv', '.tsv')),
                                           fluidRow(numericInput("startValue2",value=min2,label="From"),
                                                    numericInput("endValue2",value=max2,label="To")),
                                           tableOutput('contentsToPredict'))))
      
    })
    
    
    
    
    
    
    
    observeEvent(input$startValue1, {
      
      min1<<-input$startValue1
      
    })
    
    observeEvent(input$endValue1, {
      
      max1<<-input$endValue1
      
    })
    
    observeEvent(input$startValue2, {
      
      min2<<-input$startValue2
      
    })
    
    observeEvent(input$endValue2, {
      
      max2<<-input$endValue2
      
    })
    
    observeEvent(input$GoModeling, {

      library(caret)
  
      tryCatch({
          myModel<<-train(x=data[,input$modelColumns],y=data[,input$featureToPredict],method=input$modelPredict)
    ##    myModel<<-train(x=data[,c("hp","drat")],y=data[,c("wt")],method="lm")
        
      },
      warning=function(r){
        print("warning apprentissage")      
      }
      ,
      
      error=function(e){
        
        print("erreur apprentissage")      
      })
      
    })
    
  
  output$text1 <- renderText({ 
    "You have selected this"

                  })
  
  output$contents <- renderTable({
    inFile <<- input$file1
    

    if (is.null(inFile))
    {
      return(NULL)
    }
    data<<-read.csv(inFile$datapath)
    colsNames <<-colnames(data)
    max1<<-min(nrow(data),max1)
    

    updateNumericInput(session, "endValue1", value = max1)
    data[(min1:max1),]
   
  })
  
  
  output$myHisto <- renderPlot({

    if (is.null(inFile))
    {
      return(NULL)
    }
    if(is.null(input$selectedCol)){
      return(NULL)
    }
    if(is.numeric(data[,input$selectedCol])){
      return(  hist(data[,input$selectedCol]))
    }
    else{
      return(barplot(height=table(data[,input$selectedCol])))
    }
    
  })
  
  output$contentsToPredict <- renderTable({
    inFile2 <<- input$file2
    

    if (is.null(inFile2))
    {
      return(NULL)
    }
    
    dataToPredict<<-read.csv(inFile2$datapath)

        tryCatch({

      resultPredict<<-predict(myModel,data[,input$modelColumns])
      resultPredict<<-unlist(resultPredict)
    },
      warning=function(r){
        print("warning apprentissage")      
      }
    ,
    
    error=function(e){

      print("erreur apprentissage")      
    })
    

    max2<<-min(nrow(dataToPredict),max2)

    dataToPredict$PredictedValue<<-resultPredict
    
    updateNumericInput(session, "endValue2", value = max2)
    
    dataToPredict[(min2:max2),]
    
  })
  
  
##  contentsToPredict
  
  })

