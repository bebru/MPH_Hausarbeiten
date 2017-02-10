source("init.R")

# import data -------------------------------------------------------------

path <- "C:/Users/Beat/OneDrive/Dokumente/MPH/V108_10_17/V108.17_Kursunterlagen"

blutvolumen <- read_dta(file = paste(path, "blutvolumen.dta", sep = "/"))


# description -------------------------------------------------------------

View(blutvolumen)
glimpse(blutvolumen)
Abstract(blutvolumen)


# 1. ----------------------------------------------------------------------

blutvolumen %>% 
  ggplot(aes(x = gewicht, y = blutvolumen)) + geom_point() + geom_smooth(se = TRUE, method = "lm") +
  ylim(c(0,NA)) + theme_minimal()


# 2. ----------------------------------------------------------------------

blutvolumen.ext <- 
  blutvolumen %>% 
  mutate(gewicht_60 = gewicht - 60)


# 3. ----------------------------------------------------------------------

lm.1 <- lm(blutvolumen ~ gewicht_60, data = blutvolumen.ext)
summary(lm.1)
anova(lm.1)


blutvolumen.ext %>% 
  ggplot(aes(x = gewicht, y = blutvolumen)) + geom_point() + geom_smooth(se = TRUE, method = "lm") +
  ylim(c(0,NA)) + theme_minimal()

# 4. ----------------------------------------------------------------------

coef.1 <- tidy(lm.1)

# Blutvolumen bei Gewicht 55:
predict(lm.1, newdata = data.frame(gewicht_60 = -5), type = "response")

# 5. ----------------------------------------------------------------------

# Es werden hier verschiedene Personen miteinander verglichen, das Modell sagt
# nichts über Veränderungen bei individuellen Personen aus

# 6. ----------------------------------------------------------------------

blutvolumen.ext <- 
  blutvolumen %>% 
  mutate(gewicht_60 = gewicht - 60) %>% 
  add_residuals(lm.1) %>% 
  add_predictions(lm.1)

mean(blutvolumen.ext$resid)

# 7. ----------------------------------------------------------------------

qqnorm(blutvolumen.ext$resid)

blutvolumen.ext %>% 
  ggplot(aes(sample = resid)) + stat_qq() + theme_minimal()

# 8. ----------------------------------------------------------------------

blutvolumen.ext %>% 
  ggplot(aes(x = gewicht, y = resid)) + geom_point() + geom_smooth(span = 0.9) +
  theme_minimal()

# 9. ----------------------------------------------------------------------

blutvolumen.ext <- 
  blutvolumen %>% 
  mutate(gewicht_60 = gewicht - 60) %>% 
  mutate(gewicht_60q = gewicht_60^2)

lm.2 <- lm(blutvolumen ~ gewicht_60 + gewicht_60q, data = blutvolumen.ext)
summary(lm.2)
anova(lm.2)

# der quadratsiche Term ist nicht signifikant

# 10. ---------------------------------------------------------------------

blutvolumen.ext <- 
  blutvolumen %>% 
  mutate(gewicht_60 = gewicht - 60) %>% 
  mutate(gewicht_60q = gewicht_60^2) %>% 
  add_residuals(lm.2) %>% 
  add_predictions(lm.2)


blutvolumen.ext %>% 
  ggplot(aes(x = gewicht, y = blutvolumen)) + geom_point() + geom_line(aes(y = pred)) +
  theme_minimal()

blutvolumen.ext %>% 
  ggplot(aes(x = gewicht, y = resid)) + geom_point() + geom_smooth(span = 0.9) +
  theme_minimal()

# Zusatz ------------------------------------------------------------------

# robuste Methode
# in STATA wird mit robust etwas anderes bewirkt
# The Stata regress command includes a robust option for estimating the 
# standard errors using the Huber-White sandwich estimators. Such robust 
# standard errors can deal with a collection of minor concerns about failure 
# to meet assumptions, such as minor problems about normality, 
# heteroscedasticity, or some observations that exhibit large residuals, 
# leverage or influence. For such minor problems, the robust option may 
# effectively deal with these concerns.

# With the robust option, the point estimates of the coefficients are exactly 
# the same as in ordinary OLS, but the standard errors take into account issues 
# concerning heterogeneity and lack of normality. Here is the same regression 
# as above using the robust option. Note the changes in the standard errors 
# and t-tests (but no change in the coefficients). In this particular example, 
# using robust standard errors did not change any of the conclusions from the 
# original OLS regression.

lm.1.r <- rlm(blutvolumen ~ gewicht_60, data = blutvolumen.ext)
summary(lm.1.r)
anova(lm.1.r)


