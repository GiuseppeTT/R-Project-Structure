ui <- fluidPage(
    titlePanel("Diamond analysis"),
    sidebarPanel(
        sliderInput("carat",
            "Carat",
            min = min(data$carat),
            max = max(data$carat),
            value = mean(data$carat)
        )
    ),
    mainPanel(
        plotOutput("prediction_plot", height = 500),
        gt_output("prediction_table")
    )
)
