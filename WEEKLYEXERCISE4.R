library(tidyverse)
library(ggplot2)

olympics_main <- readr::read_csv("Olympics.csv")
largest_1992 <- olympics_main %>% filter(year == 1992) %>% arrange(desc(athletes)) %>% select(country, athletes)

top5 <- c("United States", "France", "Germany", "Russia", "China")
gold_ts <- olympics_main %>% filter(country %in% top5) %>% group_by(country, year) %>% summarise(gold = sum(gold, na.rm = TRUE))


ggplot(gold_ts,aes(x=year,y=gold,color=country))+geom_line(size = 1)+labs(title="Gold Medals Over Time (Top 5 Countries)",x="Year",y="Gold Medals")+theme_minimal()

library(tidyverse)

Olympics <- readr::read_csv("Olympics.csv") %>% mutate(total.medals = gold + silver + bronze)

country_gold <- Olympics %>% group_by(country) %>% summarise(total_gold = sum(gold, na.rm = TRUE))

year_medals <- Olympics %>% group_by(year) %>% summarise(total_medals_given = sum(total.medals, na.rm = TRUE))
