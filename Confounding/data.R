
ds <- read_delim("v108_10_17_v2.csv", delim = ";", na = "?")

ads.1 <- 
  ds %>% 
  mutate_each(funs(as.factor), ends_with("_fg"), ends_with("_x")) 