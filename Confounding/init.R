library(MASS)
library(dplyr)
library(broom)
library(modelr)
library(haven)
library(ggplot2)
library(epiR)
library(readr)
library(tibble)
library(DescTools)
library(knitr)
library(pander)
library(forcats)
library(xtable)
library(Hmisc)

options(scipen = 7)
fmt.count <- as.fmt(digits=0, big.mark="'")
set.alignment('left')
panderOptions('table.split.table', Inf)

lable_ja_nein <- function(x) {
  fct_recode(x, ja = "1", nein = "0")
}
