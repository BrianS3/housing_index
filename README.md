# Zillow Housing Index Dashboard

An interactive Shiny dashboard that visualizes Zillow Housing Index (ZHVI) trends across regions.  
The app is deployed and accessible here: [Housing Index Dashboard](https://bseko.shinyapps.io/housing_index/)

---

## Features

- 📈 **Trend Visualization**  
  Plot historical ZHVI values over time with interactive line charts (via `ggplot2` + `plotly`).

- 🔍 **Region Filtering**  
  Start typing a ZIP code or region name to quickly filter the data.

- 🎨 **Interactive UI**  
  Built with `shinydashboard` for a clean sidebar layout.

---

## Tech Stack

- **R** with:
  - [shiny](https://shiny.posit.co/) – web framework  
  - [shinydashboard](https://rstudio.github.io/shinydashboard/) – layout & navigation  
  - [plotly](https://plotly.com/r/) – interactive visualizations  
  - [ggplot2](https://ggplot2.tidyverse.org/) – charting  
  - [dplyr](https://dplyr.tidyverse.org/) – data manipulation  

---

## Project Structure

- `global.R` – loads libraries and the Zillow Housing Index dataset (`housing_index_data.RDS`).  
- `ui.R` – defines the dashboard layout and sidebar inputs.  
- `server.R` – handles reactivity, filtering, and rendering of plots.  

---

## Data

- Dataset: `housing_index_data.RDS`  
- Source: Zillow Housing Index (ZHVI) data.  
- Pre-processed into a format with columns:  
  - `date`  
  - `region_name` (e.g., ZIP code or region)  
  - `zhvi` (Zillow Home Value Index)  
  - `metric` (e.g., All Homes, 1BR, etc.)  

---

## Running Locally

Clone this repo and run the app in R:

```r
# install packages if needed
install.packages(c("shiny", "shinydashboard", "plotly", "ggplot2", "dplyr"))

# run app
shiny::runApp()
