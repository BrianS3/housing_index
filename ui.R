# ui.R
library(shiny)
library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "My Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("tachometer-alt")),
      menuItem("Plots", tabName = "plots", icon = icon("chart-line")),
      menuItem("Data Table", tabName = "table", icon = icon("table"))
    )
  ),
  dashboardBody(
    tabItems(
      # Dashboard tab
      tabItem(tabName = "dashboard",
              h2("Welcome to the Dashboard"),
              p("Use the side menu to navigate.")
      ),
      
      # Plots tab
      tabItem(tabName = "plots",
              fluidRow(
                box(title = "Miles Per Gallon vs Horsepower", 
                    status = "primary", solidHeader = TRUE, 
                    collapsible = TRUE,
                    plotOutput("mpgPlot"))
              )
      ),
      
      # Table tab
      tabItem(tabName = "table",
              fluidRow(
                box(title = "Dataset", 
                    status = "info", solidHeader = TRUE, 
                    collapsible = TRUE,
                    tableOutput("dataTable"))
              )
      )
    )
  )
)
