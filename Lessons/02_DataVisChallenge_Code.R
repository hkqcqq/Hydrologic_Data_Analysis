EnoDischarge <- mutate(EnoDischarge, Discharge.metric = Discharge/35.3147,
                       Discharge.RollMean = 
                         rollmean(EnoDischarge$Discharge.metric, 30, fill = NA))  

EnoPlot3 <-
  ggplot(EnoDischarge, aes(x = Date)) +
  geom_line(aes(y = Discharge.metric, color = "Daily")) +
  geom_line(aes(y = Discharge.RollMean, color = "30-day")) +
  geom_label_repel(data = subset(EnoDischarge, Date == "2018-09-17"),
                   aes(y = Discharge.metric, label = "Hurricane\nFlorence"),
                   color = "darkgray", segment.color = "darkgray", min.segment.length = 0,
                   segment.alpha = 0.5, nudge_x = -1000, nudge_y = 10000, size = 3) +
  scale_color_manual(values = c("Daily" = "darkgray", "30-day" = "darkgreen")) +
  scale_y_continuous(name = expression("Discharge (m"^3*"/s)")) +
  theme_classic() +
  theme(axis.title.x = element_blank(), legend.title = element_blank(),
        legend.position = c(0.1,1), legend.justification = c(0.1, 1))
print(EnoPlot3)