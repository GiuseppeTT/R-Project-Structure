library(tidyverse)
library(gt)
library(broom)
library(shiny)
library(here)
source(here("R/functions.R"))
source(here("R/global.R"))
source(here("R/ui.R"))
source(here("R/server.R"))

options(shiny.autoload.r = FALSE)

shinyApp(ui, server)
