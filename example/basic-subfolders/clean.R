library(tidyverse)
library(here)
source(here("R/functions.R"))

raw_data <- read_csv(here("data/raw/diamonds.csv"))

clean_data <-
    raw_data %>%
    select(carat, cut, color, clarity, price)

write_csv(clean_data, here("data/clean/diamonds.csv"))
