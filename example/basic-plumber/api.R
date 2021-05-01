library(tidyverse)
library(broom)
library(plumber)
library(here)
source(here("R/functions.R"))

api <- pr(here("R/plumber.R"))

pr_run(api)
