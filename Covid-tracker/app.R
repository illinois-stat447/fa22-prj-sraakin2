

library(shiny)

ui <- navbarPage(
  theme = bs_theme(bootswatch = "darkly"),
  title = "Main Page",
  tabPanel("Main App",
            titlePanel("2020-2022 UIUC Covid Tracker"),
            sidebarLayout(
              sidebarPanel(
                selectInput(inputId = "groups", label = "Group", Groups),
                checkboxInput(inputId = "positivity", label = "Positivity Rate"),
                dateRangeInput(inputId = "time", label = "Date Range",
                               start  = "2020-08-17",
                               end    = "2022-10-13",
                               min    = "2020-08-17",
                               max    = "2022-10-13",
                               format = "mm/dd/yy",
                               separator = " - "),
              ),

              mainPanel(plotOutput("selectPlot"), plotOutput("sliderPlot"))))
)

 server <- function(input, output) {
   daterange <- reactive({
     Updated_Covid_Dataset %>% filter(Updated_Covid_Dataset$time >= input$time[1] 
                                   & Updated_Covid_Dataset$time <= input$time[2])
   })
   
   output$selectPlot <- renderPlot({
     
     if (input$groups == 'Undergraduates') { 
       cases_plot = ggplot(data = daterange(), aes(x = time, y = undergradCases)) + 
         geom_col(fill = 'blue', alpha = 0.6) + 
         theme_minimal(base_size = 14) +
         xlab("Date") + ylab("Daily Cases") + scale_x_date(date_labels = "%Y-%m-%d")
       cases_plot
       
     } else if (input$groups == 'Graduates') { 
       cases_plot = ggplot(data = daterange(), aes(x = time, y = gradCases)) + 
         geom_col(fill = 'dark red', alpha = 0.6) + 
         theme_minimal(base_size = 14) +
         xlab("Date") + ylab("Daily Cases") + scale_x_date(date_labels = "%Y-%m-%d")
       cases_plot
       
     } else if (input$groups == 'Faculty/Staff') { 
       cases_plot = ggplot(data = daterange(), aes(x = time, y = facStaffCases)) + 
         geom_col(fill = 'dark green', alpha = 0.6) + 
         theme_minimal(base_size = 14) +
         xlab("Date") + ylab("Daily Cases") + scale_x_date(date_labels = "%Y-%m-%d")
       cases_plot
     }
     
   })
   
   
   checkreactive <- reactive({ 
     if (input$positivity) { 
       if (input$groups == 'Undergraduates') { 
         PR_plot <- ggplot(data = daterange(), aes(x = time, y = UG_Positivity_Rate)) + 
           geom_line() + xlab("Date") + ylab("Positivity Rate (%)")
         PR_plot
       } else if (input$groups == 'Graduates') { 
         PR_plot <- ggplot(data = daterange(), aes(x = time, y = Grad_Positivity_Rate)) + 
           geom_line() + xlab("Date") + ylab("Positivity Rate (%)")
         PR_plot
       } else if (input$groups == 'Faculty/Staff') { 
         PR_plot <- ggplot(data = daterange(), aes(x = time, y = Faculty_Positivity_Rate)) + 
           geom_line() + xlab("Date") + ylab("Positivity Rate (%)") 
         PR_plot
       }
     }
     
   })
   
   output$sliderPlot <- renderPlot({ 
     checkreactive()
   })
   
 }
 shinyApp(ui = ui, server = server)
