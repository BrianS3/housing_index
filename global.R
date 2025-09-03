# global.R
library(shiny)
library(shinydashboard)
library(glue)
library(tidyr)
library(dplyr)
library(scales)
library(ggplot2)
library(plotly)

housing_index_df <- shiny::reactiveValues(data = NULL)

get_hi_df <- function() {
  housing_index_df$data <- readRDS("housing_index_data.RDS")
}

get_hi_df()



