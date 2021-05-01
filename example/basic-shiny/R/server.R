server <- function(
    input,
    output
) {
    prediction <- reactive({
        model %>%
            augment(newdata = tibble(carat = input$carat), interval = "prediction") %>%
            mutate(across(!carat, exp))
    })

    output$prediction_plot <- renderPlot({
        base_plot +
            geom_pointrange(
                aes(y = .fitted, ymin = .lower, ymax = .upper),
                data = prediction(),
                color = "red",
                size = 4,
                fatten = 2
            )
    })

    output$prediction_table <- render_gt({
        prediction() %>%
            gt() %>%
            tab_options(table.width = "100%")
    })
}
