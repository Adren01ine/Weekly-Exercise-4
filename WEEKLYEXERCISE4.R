library(readr)
library(tidyverse)

Olympics <- readr::read_csv("Olympics.csv") %>% mutate(total.medals = gold + silver + bronze)

country_gold <- Olympics %>% group_by(country) %>% summarise(total_gold = sum(gold, na.rm = TRUE))

year_medals <- Olympics %>% group_by(year) %>% summarise(total_medals_given = sum(total.medals, na.rm = TRUE))

