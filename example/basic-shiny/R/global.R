data <- read_csv(here("data/diamonds.csv"))

base_plot <-
    data %>%
    ggplot(aes(x = carat, y = price)) +
    geom_point(alpha = 0.1) +
    scale_x_log10() +
    scale_y_log10() +
    theme_grey(20)

model <-
    data %>%
    lm(log(price) ~ log(carat), data = .)
