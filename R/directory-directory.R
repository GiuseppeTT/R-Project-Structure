#' @export
print.directory <- function(
    x,
    level = 0,
    is_last = FALSE,
    ...
) {
    cat(stringr::str_c(prefix(level, is_last), crayon::blue$bold(x$name), "\n"))

    file_level <- level + 1

    for (i in seq_along(x$files)) {
        file <- x$files[[i]]

        is_last_level_file <- i == length(x$files) & length(file) == 0

        print(file, file_level, is_last_level_file)
    }

    return(invisible(x))
}

length.directory <- function(
    x
) {
    x %>%
        magrittr::extract2("files") %>%
        length() %>%
        return()
}

is_directory <- function(
    x
) {
    x %>%
        inherits("directory") %>%
        return()
}

#' @title
#' Build a directory structure
#'
#' @description
#' Build a directory structure, which can be pretty printed.
#'
#' @param name
#' Directory name.
#'
#' @param files
#' Directory files, provided as a list. File can be plain files (represented by
#' strings) or subdirectories (represented by `directory()` class).
#'
#' @return
#' A directory.
#'
#' @examples
#' directory("directory-name", list(
#'     directory("subdirectory-1-name", list(
#'         "subdirectory-1-file-1-name",
#'         "subdirectory-1-file-2-name"
#'     )),
#'     directory("subdirectory-2-name", list(
#'     )),
#'     "file-1-name"
#' ))
#'
#' @export
directory <- function(
    name,
    files = list()
) {
    files <-
        files %>%
        purrr::map_if(is.character, plain_file)

    new_directory(name, files) %>%
        validate_directory() %>%
        return()
}

new_directory <- function(
    name = character(),
    files = list()
) {
    stopifnot(is.character(name))
    stopifnot(is.list(files))

    x <- structure(list(name = name, files = files), class = "directory")

    return(x)
}

validate_directory <- function(
    x
) {
    if (x$name == "")
        stop("Directory name should not be empty", call. = FALSE)

    for (file in x$files)
        if (!is_plain_file(file) & !is_directory(file))
            stop("Directory file should be either a plain file or another directory", call. = FALSE)

    return(x)
}
