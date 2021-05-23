library(tidyverse)
library(gt)
library(broom)
library(shiny)

source("R/functions.R")
source("R/global.R")
source("R/ui.R")
source("R/server.R")

options(shiny.autoload.r = FALSE)

shinyApp(ui, server)
