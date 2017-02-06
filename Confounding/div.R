
source("init.R")

# import data -------------------------------------------------------------

path <- "C:/Users/Beat/OneDrive/Dokumente/MPH/V108_10_17/V108.17_Kursunterlagen"

blutvolumen <- read_dta(file = paste(path, "blutvolumen.dta", sep = "/"))


# description -------------------------------------------------------------

glimpse(blutvolumen)

# regressions -------------------------------------------------------------

lm.1 <- lm(formula = blutvolumen ~ gewicht, data = blutvolumen)
summary(lm.1)
anova(lm.1)

# plots -------------------------------------------------------------------

plot(blutvolumen$gewicht, resid(lm.1))
