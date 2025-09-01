library(tidyr)
library(dplyr)
library(glue)
library(janitor)
library(stringr)

pivot_function <- function(df){
  df_clean <- df |> 
    clean_names() |> 
    filter(state=="NY") |> 
    pivot_longer(
      cols = starts_with("x"),
      names_to = "date",
      values_to = "zhvi"
    ) |> 
    mutate(
      # remove the leading "x"
      date = str_remove(date, "^x"),
      # parse into proper Date format
      date = as.Date(date, format = "%Y_%m_%d")
    )
  
  return(df_clean)
}

asset_directory <- "data_2025_09"
asset_path <- file.path("assets", asset_directory)
assets <- list.files(asset_path, full.names = TRUE)

# read all CSVs into a named list
asset_obj_list <- lapply(assets, read.csv)
asset_obj_list <- lapply(asset_obj_list, pivot_function)
names(asset_obj_list) <- tools::file_path_sans_ext(basename(assets))

combined_df <- bind_rows(asset_obj_list, .id = "metric") 
combined_df <- combined_df |> filter(!is.na(zhvi))

saveRDS(combined_df, "housing_index_data.RDS")
