rmarkdown::render(
    input = here::here("Rmd/analysis.Rmd"),
    output_file = here::here("output/analysis.html"),
    knit_root_dir = here::here()
)
