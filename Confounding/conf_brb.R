
source("init.R")


# data, loading, wrangling ------------------------------------------------

ds <- read_delim("v108_10_17_v2.csv", delim = ";", na = "?", locale = locale(encoding = "Windows-1252"))

glimpse(ds)
Abstract(ds)

ads.1 <- 
  ds %>% 
  mutate_each(funs(as.factor), ends_with("_fg"), ends_with("_x")) %>% 
  mutate_each(funs(lable_ja_nein), ends_with("_fg")) %>% 
  select(e_vp_id, sex_x, valter_n, franch_elig_fg, okp_unfall_fg, mc_fg, sprgeb_red_x, stadtland_red_x,
         greg_x, kons_n, pcg_n) %>% 
  as.data.frame()

summary(ads.1.mod)

Label(ads.1$e_vp_id) <- "anonymisiert ID"

glimpse(ads.1)

table(ads.1$okp_unfall_fg)
table(ds$okp_unfall_fg)

tic <- as.data.frame(Abstract(ads.1))

class(tic)

tic[main]

View(ads.1)

# description -------------------------------------------------------------

glimpse(ads.1)
glimpse(ads.1.mod)

ds %>% 
  ggplot(aes(kons_n)) + geom_histogram(stat = "density") + facet_wrap(~okp_mod_kat_x)

table(ds$okp_mod_kat_x)

Abstract(ads.1)

tic <- Desc(ads.1$sex_x)
tic[freq]

TOne(ads.1.mod %>% select(-mc_fg), grp = ads.1.mod$mc_fg,
     FUN = function(x) gettextf("%s / %s", Format(median(x, na.rm=TRUE), digits=1),
                                Format(IQR(x, na.rm=TRUE), digits=1)))

toe <- summary(ads.1 %>% select(-e_vp_id))

summary(ads.1$greg_x)

class(toe)

tac <- TOne(ads.1 %>% select(-mc_fg), grp = ads.1$mc_fg) %>% ftable()

plt.1 <- ggpairs(ads.1 %>% select(mc_fg, everything(), -e_vp_id))

ggduo(ads.1.mod, 2:10, 1) # wenig sinnvoll bei dichotomer Zielvariable

# models ------------------------------------------------------------------

lm.1 <- glm(formula = kons_n ~ mc_fg, data = ads.1, family = "poisson")
# Voraussetzung Poisson-Regression: mean == variance
1-pchisq(q = lm.1$deviance, df = lm.1$df.residual) # Test lässt vermuten, dass diese Voraussetzung nicht erfüllt ist
# aus diesem Grund muss die negativ-binomiale Regression verwendet werden
# siehe https://onlinecourses.science.psu.edu/stat504/node/169

with(lm.1, cbind(res.deviance = deviance, df = df.residual,
               p = pchisq(deviance, df.residual, lower.tail=FALSE)))


lm.1$deviance/lm.1$df.residual

lm.2 <- glm.nb(formula = kons_n ~ mc_fg, data = ads.1)

summary(lm.1)
28402/1998

summary(lm.2)
2308.2/1998

ads.1 %>% 
  group_by(mc_fg) %>% 
  summarise(mean = mean(kons_n), median = median(kons_n))

tidy(lm.1, exponentiate = TRUE, conf.int = TRUE, method = "Wald")
tidy(lm.2, exponentiate = TRUE)

glm.poisson <- glm(formula = kons_n ~ ., data = ads.1.mod, family = "poisson")
coef.poisson <- tidy(glm.poisson, exponentiate = TRUE, conf.int = TRUE, method = "Wald")

mean(ads.1$kons_n)/var(ads.1$kons_n)

glm.negbin.mc <- glm.nb(formula = kons_n ~ mc_fg, data = ads.1.mod)
# coef.negbin.mc <- tidy(glm.negbin.mc)
kable(summary(glm.negbin.mc), caption = "Koeffizient für mc_fg aus dem negativ-binomialen Modell")
tidy(glm.negbin.mc)
glance(glm.negbin.mc)

summary(glm.negbin.mc)

glm.negbin <- glm.nb(formula = kons_n ~ ., data = ads.1.mod)
summary(glm.negbin)

# Confounder --------------------------------------------------------------

glm.negbin.1 <- glm.nb(formula = kons_n ~ 1, data = ads.1.mod)
tidy(glm.negbin.1, exponentiate = TRUE)

glm.negbin.sex <- glm.nb(formula = kons_n ~ sex_x, data = ads.1.mod)
summary(glm.negbin.sex)
tidy(glm.negbin.sex, exponentiate = TRUE)
anova(glm.negbin.1, glm.negbin.sex)
anova(glm.negbin.sex, test = "LRT")

glm.negbin.ak <- glm.nb(formula = kons_n ~ ak_2_x, data = ads.1.mod)
tidy(glm.negbin.ak, exponentiate = TRUE)
anova(glm.negbin.1, glm.negbin.ak)

glm.negbin.franch <- glm.nb(formula = kons_n ~ franch_elig_fg, data = ads.1.mod)
tidy(glm.negbin.franch, exponentiate = TRUE)
anova(glm.negbin.1, glm.negbin.franch)

glm.negbin.unfall <- glm.nb(formula = kons_n ~ okp_unfall_fg, data = ads.1.mod)
tidy(glm.negbin.unfall, exponentiate = TRUE)
anova(glm.negbin.1, glm.negbin.unfall)

glm.negbin.spr <- glm.nb(formula = kons_n ~ sprgeb_red_x, data = ads.1.mod)
tidy(glm.negbin.spr, exponentiate = TRUE)
anova(glm.negbin.1, glm.negbin.spr)

glm.negbin.stadt <- glm.nb(formula = kons_n ~ stadtland_red_x, data = ads.1.mod)
tidy(glm.negbin.stadt, exponentiate = TRUE)
anova(glm.negbin.1, glm.negbin.stadt)

glm.negbin.greg <- glm.nb(formula = kons_n ~ greg_x, data = ads.1.mod)
tidy(glm.negbin.greg, exponentiate = TRUE)
anova(glm.negbin.1, glm.negbin.greg)

glm.negbin.pcg <- glm.nb(formula = kons_n ~ pcg_n, data = ads.1.mod)
tidy(glm.negbin.pcg, exponentiate = TRUE)
anova(glm.negbin.1, glm.negbin.pcg)

glm.mc <- glm.nb(formula = kons_n ~ mc_fg, data = ads.1.mod)
p.all <- anova(glm.mc) %>% rownames_to_column() %>% filter(rowname != "NULL")
coef.all <- tidy(glm.mc, exponentiate = TRUE, conf.int = FALSE, method = "Wald") %>% filter(term != "(Intercept)")
glm.sex <- glm.nb(formula = kons_n ~ sex_x, data = ads.1.mod)
coef.all <- rbind(coef.all, tidy(glm.sex, exponentiate = TRUE, conf.int = FALSE, method = "Wald") %>% filter(term != "(Intercept)"))
pander(coef.all, caption = "\\label{tab:coef.negbin.crude}Koeffizient für mc_fg aus dem negativ-binomialen Modell")

# Interaktionen -----------------------------------------------------------

glm.negbin.all <- glm.nb(formula = kons_n ~ mc_fg + sex_x + ak_2_x + franch_elig_fg + okp_unfall_fg + 
                         stadtland_red_x + greg_x + pcg_n, data = ads.1.mod)
tidy(glm.negbin.all, exponentiate = TRUE)

## Stratifikation

# Geschlecht
glm.negbin.all.strat <- glm.nb(formula = kons_n ~ mc_fg + ak_2_x + franch_elig_fg + okp_unfall_fg + 
                           stadtland_red_x + greg_x + pcg_n, data = ads.1.mod %>% filter(sex_x == "w"))
tidy(glm.negbin.all.strat, exponentiate = TRUE)

# Franchise
glm.negbin.all.strat <- glm.nb(formula = kons_n ~ mc_fg + sex_x + ak_2_x + okp_unfall_fg + 
                                 stadtland_red_x + greg_x + pcg_n, data = ads.1.mod %>% filter(franch_elig_fg == "nein"))
tidy(glm.negbin.all.strat, exponentiate = TRUE)

## div. Interaktionen
glm.negbin.all.sex <- glm.nb(formula = kons_n ~ mc_fg*sex_x + sex_x + ak_2_x + franch_elig_fg + okp_unfall_fg + 
                           stadtland_red_x + greg_x + pcg_n, data = ads.1.mod)
tic <- tidy(glm.negbin.all.sex, exponentiate = TRUE)
anova(glm.negbin.all, glm.negbin.all.sex)
tic %>% filter(term %like any% c("%mc_fg%","%sex_x%","%(Intercept)%")) %>% select(term, estimate)


glm.negbin.all.franch <- glm.nb(formula = kons_n ~ mc_fg*franch_elig_fg + sex_x + ak_2_x + franch_elig_fg + okp_unfall_fg + 
                               stadtland_red_x + greg_x + pcg_n, data = ads.1.mod)
tidy(glm.negbin.all.franch, exponentiate = TRUE)
anova(glm.negbin.all, glm.negbin.all.franch)

glm.negbin.all.sex.franch <- glm.nb(formula = kons_n ~ mc_fg*franch_elig_fg + mc_fg*sex_x + ak_2_x + okp_unfall_fg + 
                                  stadtland_red_x + greg_x + pcg_n, data = ads.1.mod)
tidy(glm.negbin.all.sex.franch, exponentiate = TRUE)
anova(glm.negbin.all, glm.negbin.all.sex.franch)


