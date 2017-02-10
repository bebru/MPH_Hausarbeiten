
source("init.R")

# import data -------------------------------------------------------------

path <- "C:/Users/Beat/OneDrive/Dokumente/MPH/V108_10_17/V108.17_Kursunterlagen"

blutvolumen <- read_dta(file = paste(path, "blutvolumen.dta", sep = "/"))

eiger <- read_dta(file = paste(path, "eiger09.dta", sep = "/"))


# description -------------------------------------------------------------

View(blutvolumen)
glimpse(blutvolumen)
Abstract(blutvolumen)

glimpse(eiger)
Abstract(eiger)
Abstract(eiger.1)
Desc(eiger$sektor)

# data wrangling ----------------------------------------------------------

eiger.1 <- 
  eiger %>%
  filter(!is.na(adl3)) %>%
  mutate(alter_80 = alter - 80) %>% 
  mutate(treat0 = (sektor==0)*treat) %>% 
  mutate(treat1 = (sektor==1)*treat) %>% 
  mutate_each(funs(as.character), -pnr, -alter, -alter_80) %>% 
  mutate_each(funs(as_factor), -pnr, -alter, -alter_80)

glimpse(eiger.1)

table(eiger.1$treat, eiger.1$treat0)
table(eiger.1$sektor, eiger.1$treat0)

# regressions -------------------------------------------------------------

lm.1 <- lm(formula = blutvolumen ~ gewicht, data = blutvolumen)
summary(lm.1)
anova(lm.1)

tidy(lm.1)
glance(lm.1)


# xi: logistic adl3 alter_80 i.geschl i.beruf  i.stratum i.gesund i.adlbas i.sektor treat0 t

glm.1 <- glm(adl3 ~ alter_80 + geschl + beruf + stratum + gesund + adlbas + sektor + treat0 + treat1,
             data = eiger.1, family = "binomial")

glm.2 <- glm(adl3 ~ alter_80 + geschl + beruf + stratum + gesund + adlbas + sektor * treat,
             data = eiger.1, family = "binomial")


summary(glm.1)
res.1 <- tidy(glm.1, exponentiate = TRUE, conf.int = TRUE)
glance(glm.1)

res.2 <- tidy(glm.2, exponentiate = TRUE, conf.int = TRUE)
glance(glm.2)


res.1$estimate[res.1$term=="treat01"] * res.1$estimate[res.1$term=="treat11"]
res.2$estimate[res.2$term=="treat1"] * res.2$estimate[res.2$term=="sektor1:treat1"]

# plots -------------------------------------------------------------------

plot(blutvolumen$gewicht, resid(lm.1))

blutvolumen %>% 
  ggplot(aes(x = gewicht, y = blutvolumen)) + geom_point() + geom_smooth(se = TRUE, method = "lm") +
  ylim(c(0,NA)) + theme_minimal()

blutvolumen.ext %>% 
  ggplot(aes(x = gewicht, y = resid)) + geom_point() + geom_smooth(span = 0.9) +
  theme_minimal()


# residuals ---------------------------------------------------------------

blutvolumen.ext <- 
  blutvolumen %>% 
  add_predictions(lm.1) %>% 
  add_residuals(lm.1)
  
View(blutvolumen.ext)


