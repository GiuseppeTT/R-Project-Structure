prefix <- function(
    level,
    last = FALSE
) {
    if (last)
        branch <- "\u2514\u2500\u2500 "  # "└── "
    else
        branch <- "\u251\u2500\u2500 "  # "├── "

    if (level == 0) {
        x <- ""
    } else {
        space <- strrep("|   ", level - 1)
        x <- stringr::str_c(space, branch)
    }

    x <- crayon::silver(x)

    return(x)
}
