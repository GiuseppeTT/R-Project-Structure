rmarkdown::render(
    input = here::here("Rmd/presentation.Rmd"),
    output_file = here::here("output/github-pages/presentation.html"),
    intermediates_dir = tempdir(),
    knit_root_dir = here::here(),
    clean = TRUE
)
