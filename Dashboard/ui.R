library(shinydashboard)


shinyUI(dashboardPage(
  dashboardHeader(title = 'UK Crime Data'),
  dashboardSidebar(sidebarUserPanel(name = 'Farouk Abdel-Magied', image = 'https://image.freepik.com/free-vector/cartoon-shark-with-open-jaws-isolated-white_29190-5408.jpg'),
                   sidebarMenu(
                     menuItem('Bar Chart View', tabName = 'Visuals', icon = icon('bar-chart-o')),
                     menuItem('Line Chart View', tabName = 'Data', icon = icon('line-chart')))#,
                   #selectizeInput(inputId = 'Graphs', label = 'Select the item you want', choice = c('Location', 'Offence Type'))
  ),
  dashboardBody(
    
    tabItems(
      tabItem(tabName = 'Visuals', 
              fluidRow( 
                      column(width = 6, box(selectInput(inputId = 'Offence Type', label = 'Select the type of Offence', choices = Offence_Type_Choices), plotOutput('p1'), width = 12)),
                      column(width = 6, box(dataTableOutput('d1'),width = 12, height = 500))),
              fluidRow( 
                      column(width = 6,box(selectInput(inputId = 'District Divisions', label = 'Select the district you want to display', choices = Borough_District_divisions), plotOutput('p2'),width = 12)),
                      column(width = 6, box(dataTableOutput('d2'),width = 12,height = 500))),
              fluidRow(
                      column(width = 6, box(selectInput(inputId = 'Offence Choices Ratio', label = 'Choose the type of Offence you want to display', choices = Offence_Type_Choices1), plotOutput('p3'),width = 12)),
                      column(width = 6, box(dataTableOutput('d3'),width = 12, height = 500))
                      )
        ),
      tabItem(tabName = 'Data', 
              fluidRow(
                    column(width = 6, box(selectInput(inputId = 'Districts', label = 'Choose the London District you want to display', choices = District_choices),plotOutput('p4'), width = 12)),
                    column(width = 6, box(dataTableOutput('d4'),width = 12, height = 500))),
              
              fluidRow(column(width = 6, box(selectInput(inputId = 'Boroughs_specific', label = 'Choose the London Borough you want to display', choices = Borough_choices_specific),plotOutput('p5'),width = 12)),
                       column(width = 6, box(dataTableOutput('d5'),width = 12, height = 500)))
        
        
        
        
      ) )
      
      
    )
    
  )
  
)