# -------------------------------------------------------------------------
# Shiny Practise - Plot functions
# Rachael Watson, May 2023
# -------------------------------------------------------------------------

# Setup -------------------------------------------------------------------

source("00_setup.R")

# Functions ---------------------------------------------------------------

plot_character_histogram <- function(data) {
  
  data <- data %>%
    group_by(name) %>% 
    summarise(count = n()) %>%
    ungroup() %>%
    arrange(desc(count)) %>% 
    mutate(rank = row_number()) %>% 
    group_by(count) %>% 
    mutate(rank = min(rank)) %>% 
    ungroup() %>% 
    mutate(rank = case_when(rank == 1 ~ "Most films",
                            rank == 2 ~ "=2nd most films",
                            TRUE ~ paste0("=", rank, "th most films"))) 
  
  fig <- plot_ly(data,
                 x = ~name,
                 y = ~count,
                 type = 'bar',
                 text = ~rank,
                 marker = list(color = 'rgb(158,202,225)',
                               line = list(color = 'rgb(8,48,107)',
                                           width = 1.5)))
  
  fig <- fig %>% layout(title = "Number of appearances of each character",
                        xaxis = list(title = ""),
                        yaxis = list(title = ""))
  
  fig
  
}
