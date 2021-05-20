print.plain_file <- function(
    x,
    level = 0,
    is_last = FALSE,
    ...
) {
    name <- unclass(x)

    cat(stringr::str_c(prefix(level, is_last), crayon::bold(name), "\n"))

    return(invisible(x))
}

length.plain_file <- function(
    x
) {
    return(0)
}

is_plain_file <- function(
    x
) {
    x %>%
        inherits("plain_file") %>%
        return()
}

plain_file <- function(
    name
) {
    name %>%
        new_plain_file() %>%
        validate_plain_file() %>%
        return()
}

new_plain_file <- function(
    name = character()
) {
    stopifnot(is.character(name))
    x <- structure(name, class = "plain_file")

    return(x)
}

validate_plain_file <- function(
    x
) {
    name <- unclass(x)

    if (name == "")
        stop("Plain file name should not be empty", call. = FALSE)

    return(x)
}
