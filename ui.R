# ui.R
dashboardPage(
  dashboardHeader(title = "Zillow Housing Index"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Price Trends", tabName = "price_trends", icon = icon("chart-line"))
    ),
    selectizeInput(
      "zip_filter", "Zip Code:",
      choices = NULL, multiple = FALSE,
      options = list(placeholder = "Start typing a ZIP/region…")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "price_trends",
        plotlyOutput("trend_plot", height = 450)
      )
    )
  )
)