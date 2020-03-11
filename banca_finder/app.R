#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(data.table)
library(dplyr)

df = fread("tidy_bioinfo_comitees.csv",header = T)
students = as.data.frame(unique(df[,"student"]))
students = sort(students[,1])

presidents = df %>% filter(position == "president") 
presidents = sort(unique(presidents[,"name"]))

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Banca finder"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        radioButtons("choice", "See table based on:", choices = c("Student", "Commitee President"), selected = "Student",
                     inline = FALSE, width = NULL, choiceNames = NULL,
                     choiceValues = NULL),
         selectizeInput("student",
                     "Student:",
                     choices = students),
        selectizeInput("president",
                       "Presidents:",
                       choices = presidents)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        tableOutput("table")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  get_table <- eventReactive({
    input$student
    input$president
    input$choice
  }, {
    
    if (input$choice == "Student"){
      short_df <-
        df %>% filter(
          student ==  input$student
        )
      return(short_df)
    } else {
      
      commitees_that_I_presided = df %>% filter(position == "president" & name == input$president)
      
      students_that_I_judged = commitees_that_I_presided[, "student"]
      short_df <-
        df %>% filter(
          student %in% students_that_I_judged
        )
      return(short_df)
      
    }

  })
  output$table <- renderTable({
    get_table()
  })
   
}

# Run the application 
shinyApp(ui = ui, server = server)

