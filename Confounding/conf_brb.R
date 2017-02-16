
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

ds %>% 
  ggplot(aes(kons_n)) + geom_histogram(stat = "density") + facet_wrap(~okp_mod_kat_x)

table(ds$okp_mod_kat_x)

Abstract(ads.1)

tac <- TOne(ads.1 %>% select(-mc_fg), grp = ads.1$mc_fg) %>% ftable()


# models ------------------------------------------------------------------

lm.1 <- glm(formula = kons_n ~ mc_fg, data = ads.1, family = "poisson")
# Voraussetzung Poisson-Regression: mean == variance
1-pchisq(lm.1$deviance, lm.1$df.residual) # Test lässt vermuten, dass diese Voraussetzung nicht erfüllt ist
# aus diesem Grund muss die negativ-binomiale Regression verwendet werden
# siehe https://onlinecourses.science.psu.edu/stat504/node/169

lm.2 <- glm.nb(formula = kons_n ~ mc_fg, data = ads.1)

summary(lm.1)
28402/1998

summary(lm.2)
2308.2/1998

ads.1 %>% 
  group_by(mc_fg) %>% 
  summarise(mean = mean(kons_n), median = median(kons_n))

tidy(lm.1, exponentiate = TRUE)
tidy(lm.2, exponentiate = TRUE)



mean(ads.1$kons_n)/var(ads.1$kons_n)
