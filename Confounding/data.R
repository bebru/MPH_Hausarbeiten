
ds <- read_delim("v108_10_17_v2.csv", delim = ";", na = "?", locale = locale(encoding = "Windows-1252"))

ads.1 <- 
  ds %>% 
  mutate_each(funs(as.factor), ends_with("_fg"), ends_with("_x")) %>% 
  mutate_each(funs(label_ja_nein), ends_with("_fg")) %>% 
  select(e_vp_id, sex_x, valter_n, franch_elig_fg, okp_unfall_fg, mc_fg, sprgeb_red_x, stadtland_red_x,
         greg_x, kons_n, pcg_n) %>% 
  as.data.frame()

ads.1.mod <- 
  ds %>% 
  filter(!is.na(pcg_n), !is.na(stadtland_red_x), !is.na(greg_x)) %>% 
  mutate(age_grp_x = cut(valter_n, breaks = c(19, 25, 35, 45, 55 ,65, 75, 85, Inf), right = FALSE)) %>% 
  # mutate(stadtland_red_x = if_else(is.na(stadtland_red_x),"missing", stadtland_red_x)) %>% 
  # mutate(greg_x = if_else(is.na(greg_x),"missing", greg_x)) %>% 
  mutate_each(funs(as.factor), ends_with("_fg"), ends_with("_x")) %>% 
  mutate_each(funs(label_ja_nein), ends_with("_fg")) %>% 
  select(mc_fg, sex_x, valter_n, age_grp_x, franch_elig_fg, okp_unfall_fg, sprgeb_red_x, stadtland_red_x,
         greg_x, kons_n, pcg_n) %>% 
  as.data.frame()

Label(ads.1$e_vp_id) <- "anonymisierte ID"
Label(ads.1$sex_x) <- "Geschlecht"
Label(ads.1$valter_n) <- "Alter"
Label(ads.1$franch_elig_fg) <- "erhöhte Franchise"
Label(ads.1$okp_unfall_fg) <- "Unfalldeckung"
Label(ads.1$mc_fg) <- "Managed Care Modell"
Label(ads.1$sprgeb_red_x) <- "Sprachgebiet"
Label(ads.1$stadtland_red_x) <- "Stadt oder Land"
Label(ads.1$greg_x) <- "Grossregionen BfS"
Label(ads.1$kons_n) <- "Anzahl Konsultationen"
Label(ads.1$pcg_n) <- "Anzahl PCG"

