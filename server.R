# server.R
function(input, output, session) {
  
  # populate type-ahead from data
  observe({
    req(housing_index_df$data)
    regions <- housing_index_df$data |>
      dplyr::pull(region_name) |>
      unique() |>
      sort()
    updateSelectizeInput(session, "zip_filter", choices = regions, server = TRUE)
  })
  
  # plot
  output$trend_plot <- renderPlotly({
    req(housing_index_df$data, input$zip_filter)
    
    df <- housing_index_df$data |>
      dplyr::filter(region_name == input$zip_filter)
    
    plot_title <- unique(df$city)
    
    p <- ggplot(df, aes(x = date, y = zhvi, color = metric, group = metric)) +
      geom_line(linewidth = 1) +
      scale_y_continuous(limits = c(0, NA)) +
      theme_minimal() +
      labs(x = NULL, y = "ZHVI", color = "Metric", title=plot_title)
    
    ggplotly(p, dynamicTicks = TRUE)
  })
}