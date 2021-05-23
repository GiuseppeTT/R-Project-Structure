library(tidyverse)
library(broom)
library(plumber)

source("R/functions.R")

api <- pr("R/plumber.R")

pr_run(api)
