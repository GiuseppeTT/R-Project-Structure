write_output <- function(
    output,
    path
) {
    output %>%
        capture.output() %>%
        write_lines(path)
}
