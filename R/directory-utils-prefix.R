prefix <- function(
    level,
    last = FALSE
) {
    if (last)
        branch <- "└── "
    else
        branch <- "├── "

    if (level == 0) {
        x <- ""
    } else {
        space <- strrep("|   ", level - 1)
        x <- stringr::str_c(space, branch)
    }

    x <- crayon::silver(x)

    return(x)
}
