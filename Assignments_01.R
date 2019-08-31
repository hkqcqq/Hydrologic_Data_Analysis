# Import data
EnoDischarge <- readNWISdv(siteNumbers = "02096500",
                           parameterCd = "00060", # discharge (ft3/s)
                           startDate = "2009-08-01",
                           endDate = "2019-07-31")
EnoGageHeight <- readNWISdv(siteNumbers = "02096500",
                            parameterCd = "00065", # gaga height (ft)
                            startDate = "2009-08-01",
                            endDate = "2019-07-31")                     

# Renaming columns (one method of multiple)
names(EnoDischarge)[4:5] <- c("Discharge", "Approval.Code")
names(EnoGageHeight)[4:5] <- c("Gage.Height", "Approval.Code")

EnoDischarge <- mutate(EnoDischarge,year(Date))
EnoGageHeight <- mutate(EnoGageHeight,year(Date))

names(EnoDischarge)[6] <- c("year")
names(EnoGageHeight)[6] <- c("year")

EnoTotal <- merge(EnoDischarge, EnoGageHeight, by="Date")

EnoPlotDis_Gage <-
  ggplot(EnoTotal, aes(x = Gage.Height, y = Discharge))+
  geom_line()
plot(EnoPlotDis_Gage)