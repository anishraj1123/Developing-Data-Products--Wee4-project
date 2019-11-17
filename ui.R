# Coursera - Developing Data Products- Course Project

# ui.R file for the shiny app

# This app was developed to help people choose the best car for their trip, using mtcars dataset, from [R] 

library(markdown)

# Define UI for application
shinyUI(navbarPage("Select best car for your trip",

    # Application title with the tab called Table and About
        tabPanel("Table",

        # Sidebar with a slider input for number of bins
        sidebarLayout(
            sidebarPanel(
                helpText("Provide information about your trip and the carachteristics of the car that you want"),
                
                ##Text Box to enter number of miles
                numericInput('dis', 'Distance (in miles):', 50, min = 1, max = 1000),
                
                ##Text Box to enter Gasoline price
                numericInput('cost', 'Gasoline Price (per gallon):', 2.41, min = 2, max = 4, step=0.01),
                
                ##Text Box named gas to enter expnditure on gasoline
                numericInput('gas', 'Maximum expenditure on gasoline:', 50, min=1, max=1000),
                
                ##Check Box to slide through cyl varibale in mtcars to select number of cylinders
                checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
                
                ##Slider to slide through disp variable in mtcars to enter displacement value
                sliderInput('disp', 'Displacement', min=70, max=480, value=c(70,480), step=10),
                
                ##Slider named hp to enter horsepower ampunt
                sliderInput('hp', 'Gross horsepower', min=50, max=340, value=c(50,340), step=10),
                
                ##Check Box group named am to enter transmission type
                checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1))
                ), #closing Sidebarpanel
                
                # Show a plot of the generated table entries
                mainPanel(dataTableOutput('table')
                ) 
            
            ) # closing siderbarlayout
        
        ), # closing tabpanel table

        tabPanel("About",
            mainPanel(
                includeMarkdown("about.md")
                )
            )
        ) 
    )

