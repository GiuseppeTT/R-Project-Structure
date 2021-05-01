library(tidyverse)
library(gt)

write_output <- function(
    output,
    path
) {
    output %>%
        capture.output() %>%
        write_lines(path)
}

data <- read_csv("diamonds.csv")

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

gtsave(table, "table.html")

plot <-
    data %>%
    ggplot(aes(x = carat, y = price)) +
    geom_point(alpha = 0.1) +
    scale_x_log10() +
    scale_y_log10()

ggsave("plot.png", plot)

model <-
    data %>%
    lm(log(price) ~ log(carat), data = .)  %>%
    summary()

write_output(model, "model.txt")
