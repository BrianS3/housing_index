# global.R
library(shiny)
library(shinydashboard)
library(glue)
library(tidyr)
library(dplyr)

# set directory (change this one line when needed)
asset_directory <- "data_2025_09"
asset_path <- file.path("assets", asset_directory)
assets <- list.files(asset_path, full.names = TRUE)

# read all CSVs into a named list
asset_obj_list <- lapply(assets, read.csv)
asset_obj_list <- lapply(asset_obj_list, janitor::clean_names)

names(asset_obj_list) <- tools::file_path_sans_ext(basename(assets))

asset_obj_list[[1]] %>% View()

