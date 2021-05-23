data <- read_csv("../data/diamonds.csv")

model <-
    data %>%
    lm(log(price) ~ log(carat), data = .)

#* Predict diamond price
#* @param carat:dbl Diamond weight, in carats
#* @get /predict
function(
    carat
) {
    carat <- as.numeric(carat)

    model %>%
        augment(newdata = tibble(carat = carat), interval = "prediction") %>%
        mutate(across(!carat, exp)) %>%
        as.list()
}
