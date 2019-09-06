Paulsurface <- Pauldata %>%
  mutate(Month = month(sampledate)) %>%
  filter(depth == 0 & Month < 9)

Paulsurface.May <- filter(Paulsurface, Month == 5)
Paulsurface.June <- filter(Paulsurface, Month == 6)
Paulsurface.July <- filter(Paulsurface, Month == 7)
Paulsurface.August <- filter(Paulsurface, Month == 8)

Temptrend.May <- lm(data = Paulsurface.May, temperature_C ~ year4)
summary(Temptrend.May)

Temptrend.June <- lm(data = Paulsurface.June, temperature_C ~ year4)
summary(Temptrend.June)

Temptrend.July <- lm(data = Paulsurface.July, temperature_C ~ year4)
summary(Temptrend.July)

Temptrend.August <- lm(data = Paulsurface.August, temperature_C ~ year4)
summary(Temptrend.August)

ggplot(Paulsurface, aes(x = sampledate, y = temperature_C)) +
  geom_point() +
  facet_grid(rows = vars(Month)) +
  geom_smooth(se = FALSE, method = lm)