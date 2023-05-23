
source("00_plot_functions.R")
source("01_prep_the_data.R")

ui <- shinyUI(fluidPage(
  source(file.path("starwars/ui.R"), local = TRUE)$value
))

server <- function(input, output) {
  source(file.path("starwars/server.R"), local = TRUE)$value
}

shinyApp(ui=ui, server=server)

