library(dataRetrieval)
library(tidyverse)

huc1021 <- seq(10210001,10210010,1)
huc1029 <- seq(10290101,10290110,1)

hucsites1021 <- whatNWISdata(huc = huc1021)

huc1021N <- hucsites1021 %>% filter(parm_cd == "00600")
huc1021P <- hucsites1021 %>% filter(parm_cd == "00665")
huc1021D <- hucsites1021 %>% filter(parm_cd == "00060", stat_cd == "00003")
