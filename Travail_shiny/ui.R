
library(shiny)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Shiny test"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
           actionLink("lien_isara","lien isara"),
           fileInput("fichier","sélectionner un fichier"),
           dateInput("date", "sélectionner une date"),
           
           imageOutput("imageIA1", width = 1, height = 1)
           
        )
    )
    
)
