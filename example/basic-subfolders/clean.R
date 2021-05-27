library(tidyverse)

source("R/functions.R")

raw_data <- read_csv("data/raw/diamonds.csv")

clean_data <-
    raw_data %>%
    select(carat, cut, color, clarity, price)

write_csv(clean_data, "data/clean/diamonds.csv")
