
# -------------------------------------------------------------------------
# Shiny Practise - Prep the data 
# Rachael Watson, May 2023
# -------------------------------------------------------------------------

# Setup -------------------------------------------------------------------

source("00_setup.R")

starwars_films <- starwars %>% 
  group_by(name) %>% 
  mutate(film1 = films[[1]][1]) %>% 
  mutate(film2 = films[[1]][2]) %>% 
  mutate(film3 = films[[1]][3]) %>% 
  mutate(film4 = films[[1]][4]) %>% 
  mutate(film5 = films[[1]][5]) %>% 
  mutate(film6 = films[[1]][6]) %>% 
  mutate(film7 = films[[1]][7]) %>% 
  mutate(film8 = films[[1]][8]) %>% 
  mutate(film9 = films[[1]][9]) %>% 
  ungroup() %>% 
  pivot_longer(film1:film9, names_to = "temp", values_to = "film") %>% 
  filter(!is.na(film)) %>% 
  select(-temp) 

# character_counts <- starwars_films %>%
#   group_by(name) %>% 
#   summarise(count = n()) %>%
#   ungroup() %>%
#   arrange(desc(count)) %>% 
#   mutate(rank = row_number()) %>% 
#   group_by(count) %>% 
#   mutate(rank = min(rank)) %>% 
#   ungroup() %>% 
#   mutate(rank = case_when(rank == 1 ~ "Most films",
#                           rank == 2 ~ "=2nd most films",
#                           TRUE ~ paste0("=", rank, "th most films"))) 
# 
# fig <- plot_ly(character_counts,
#                x = ~name,
#                y = ~count,
#                type = 'bar',
#                text = ~rank,
#                marker = list(color = 'rgb(158,202,225)',
#                              line = list(color = 'rgb(8,48,107)',
#                                          width = 1.5)))
# 
# fig <- fig %>% layout(title = "Number of appearances of each character",
#                       xaxis = list(title = ""),
#                       yaxis = list(title = ""))
# 
# fig
