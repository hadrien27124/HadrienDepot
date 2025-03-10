  
library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
        
        observeEvent(input$lien_isara,{
          browseURL("https://isara.fr/")
        }) 
        
        

    })
  
      
      
    output$imageIA1 <- renderImage({
      list(
      src = "www/image.png",  
      contentType = "image/png",  
      alt = "Image IA générée"
   )
      } )

}
