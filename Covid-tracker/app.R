

#library(shiny)

# Define UI for application that draws a histogram
#ui <- navbarPage(
 # theme = bs_theme(bootswatch = "darkly"),
  #title = "Page",
  #tabPanel("App", 
#            titlePanel("2020-2022 UIUC Covid Tracker"),
#            sidebarLayout(
#              # sidebarPanel(
#                selectInput(inputId = "groups", label = "Group", Groups), 
#                checkboxInput(inputId = "positivity", label = "Positivity Rate"),
#                dateRangeInput(inputId = "date", label = "Date Range",
#                               start  = "2020-08-17",
#                               end    = "2021-11-27",
#                               min    = "2020-08-17",
#                               max    = "2021-11-27",
#                               format = "mm/dd/yy",
#                               separator = " - "),
#              ),
#              
#              mainPanel(plotOutput("selectPlot"), plotOutput("sliderPlot")))))
# 
# server <- function(input, output) {
#   
#   daterange <- reactive({
#     Updated_Covid_Dataset %>% filter(Updated_Covid_Dataset$Dates >= input$date[1] 
#                                   & Updated_Covid_Dataset$Dates <= input$date[2])
#   })
#   
#   tablereact <- reactive({ 
#     if (input$groups == 'Undergraduates') { 
#       uiuc_covid_updated %>% select(Dates, undergradCases, undergradTests, UG_Positivity_rate)
#     } else if (input$groups == 'Graduates') { 
#       uiuc_covid_updated %>% select(Dates, gradCases, gradTests, Grad_Positivity_rate)
#     } else if (input$groups == 'Faculty/Staff') { 
#       uiuc_covid_updated %>% select(Dates, facStaffCases, facStaffTests, Faculty_Positivity_rate)
#     } 
#   })
#   
#   
#   output$table = renderDataTable(tablereact())
#   
#   output$selectPlot <- renderPlot({
#     
#     if (input$groups == 'Undergraduates') { 
#       cases_plot = ggplot(data = daterange(), aes(x = Dates, y = undergradCases)) + 
#         geom_col(fill = 'blue', alpha = 0.6) + 
#         theme_minimal(base_size = 14) +
#         xlab("Date") + ylab("Daily Cases") + scale_x_date(date_labels = "%Y-%m-%d")
#       cases_plot
#       
#     } else if (input$groups == 'Graduates') { 
#       cases_plot = ggplot(data = daterange(), aes(x = Dates, y = gradCases)) + 
#         geom_col(fill = 'dark red', alpha = 0.6) + 
#         theme_minimal(base_size = 14) +
#         xlab("Date") + ylab("Daily Cases") + scale_x_date(date_labels = "%Y-%m-%d")
#       cases_plot
#       
#     } else if (input$groups == 'Faculty/Staff') { 
#       cases_plot = ggplot(data = daterange(), aes(x = Dates, y = facStaffCases)) + 
#         geom_col(fill = 'dark green', alpha = 0.6) + 
#         theme_minimal(base_size = 14) +
#         xlab("Date") + ylab("Daily Cases") + scale_x_date(date_labels = "%Y-%m-%d")
#       cases_plot
#     }
#     
#   })
#   
#   
#   checkreactive <- reactive({ 
#     if (input$positivity) { 
#       if (input$groups == 'Undergraduates') { 
#         pr_plot <- ggplot(data = daterange(), aes(x = Dates, y = UG_Positivity_rate)) + 
#           geom_line() + xlab("Date") + ylab("Positivity Rate (%)")
#         pr_plot
#       } else if (input$groups == 'Graduates') { 
#         pr_plot <- ggplot(data = daterange(), aes(x = Dates, y = Grad_Positivity_rate)) + 
#           geom_line() + xlab("Date") + ylab("Positivity Rate (%)")
#         pr_plot
#       } else if (input$groups == 'Faculty/Staff') { 
#         pr_plot <- ggplot(data = daterange(), aes(x = Dates, y = Faculty_Positivity_rate)) + 
#           geom_line() + xlab("Date") + ylab("Positivity Rate (%)") 
#         pr_plot
#       }
#     }
#     
#   })
#   
#   output$sliderPlot <- renderPlot({ 
#     checkreactive()
#   })
#   
# }
# 
# # Run the application 
# shinyApp(ui = ui, server = server)
