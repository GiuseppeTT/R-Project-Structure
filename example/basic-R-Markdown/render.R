rmarkdown::render(
    input = list.files("Rmd/", full.names = TRUE),
    output_dir = "output/",
    knit_root_dir = getwd()
)
