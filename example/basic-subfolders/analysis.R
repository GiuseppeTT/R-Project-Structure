library(tidyverse)
library(gt)

source("R/functions.R")

data <- read_csv("data/clean/diamonds.csv")

table <-
    data %>%
    summarise(
        Minimum = min(price),
        Mean = mean(price),
        Maximum = max(price),
        `Standard Deviation` = sd(price)
    ) %>%
    pivot_longer(everything(), names_to = "Metric", values_to = "Value") %>%
    gt() %>%
    fmt_number(Value, decimals = 0, pattern = "${x}")

gtsave(table, "output/table/table.html")

plot <-
    data %>%
    ggplot(aes(x = carat, y = price)) +
    geom_point(alpha = 0.1) +
    scale_x_log10() +
    scale_y_log10()

ggsave("output/figure/plot.png", plot)

model <-
    data %>%
    lm(log(price) ~ log(carat), data = .)  %>%
    summary()

write_output(model, "output/model/model.txt")
