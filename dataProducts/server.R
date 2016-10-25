


# By default, the file size limit is 5MB. It can be changed by
# setting this option. Here we'll raise limit to 9MB.
options(shiny.maxRequestSize = 9*1024^2)

shinyServer(function(input, output) {

    cols<<-NULL
    colsNames<-c("hello","bis")
    inFile<<-NULL
    
    data<-NULL
    selectedCol<-NULL
    
    
    observeEvent(input$importView, {
      
      print("content")
      print(colsNames)
      
      removeUI (
        selector='#test'
      )
      
      insertUI(
        selector = '#placeholder',
        ui = tags$div(id="test", mainPanel(fileInput('file1', 'Choose file to upload',
                                        accept = c('text/csv','text/comma-separated-values',
                                                'text/tab-separated-values','text/plain',
                                       '.csv', '.tsv')),
                        numericInput("startValue",value=0,label="0"),
                        numericInput("endValue",value=100,label="100"),
                        tableOutput('contents'))))
       })
    observeEvent(input$exploreView, {
      
      print("content")
      print(colsNames)
      
      removeUI (
        selector='#test'
      )
      
      insertUI(
        selector = '#placeholder',
        ui = tags$div(id="test", mainPanel(uiOutput('exploreView'),
                                           radioButtons("selectedCol", "Distribution type:",
                                                        colNames),
                                           plotOutput('myHisto'))))
      
    })
    
        
    observeEvent(input$createView, {
      print("content")
      print(colsNames)
      removeUI (
        selector='#test'
      )
      
      insertUI(
        selector = '#placeholder',
        ui = tags$div(id="test", mainPanel(fileInput('file1', 'Choose file to upload',
                                                     accept = c('text/csv','text/comma-separated-values',
                                                                'text/tab-separated-values','text/plain',
                                                                '.csv', '.tsv')),
                                           numericInput("startValue",value=0,label="0"),
                                           numericInput("endValue",value=100,label="100"),
                                           tableOutput('contents'))))
      
    })
    
    observeEvent(input$predictView, {
      print("content")
      print(colsNames)
      removeUI (
        selector='#test'
      )
      
      insertUI(
        selector = '#placeholder',
        ui = tags$div(id="test", mainPanel(fileInput('file1', 'Choose file to upload',
                                                     accept = c('text/csv','text/comma-separated-values',
                                                                'text/tab-separated-values','text/plain',
                                                                '.csv', '.tsv')),
                                           numericInput("startValue",value=0,label="0"),
                                           numericInput("endValue",value=100,label="100"),
                                           tableOutput('contents'))))
      
    })

  
  
  output$text1 <- renderText({ 
    "You have selected this"

                  })
  
  output$contents <- renderTable({
    inFile <<- input$file1
    
    print("content")
    print(colsNames)
    if (is.null(inFile))
    {
      return(NULL)
    }
    
    data<<-read.csv(inFile$datapath)
    colsNames <<-colnames(data)
    
    
    data[(input$startValue:input$endValue),]
    
  })
  
  
  output$myHisto <- renderPlot({
    print("contentmyHist1")
    print(colsNames)
    if (is.null(inFile))
    {
      return(NULL)
    }
    print("contentmyHist2")
    if(is.null(input$selectedCol)){
      return(NULL)
    }
    print("contentmyHist3")
    if(is.numeric(data[,input$selectedCol])){
      return(  hist(data[,input$selectedCol]))
    }
    else{
      return(barplot(height=table(data[,input$selectedCol])))
    }
  
  
    
    
  })
  
  })

