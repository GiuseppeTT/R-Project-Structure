rmarkdown::render(
    input = here::here("Rmd/presentation.Rmd"),
    output_file = here::here("output/presentation.html"),
    intermediates_dir = tempdir(),
    knit_root_dir = here::here(),
    clean = TRUE
)
