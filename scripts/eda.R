
load("dados.Rdata")

Sensor_1 <- summary(dados$`Sensor 1`)
Sensor_2 <- summary(dados$`Sensor 2`)
Sensor_3 <- summary(dados$`Sensor 3`)
Sensor_4 <- summary(dados$`Sensor 4`)
Sensor_5 <- summary(dados$`Sensor 5`)
Sensor_6 <- summary(dados$`Sensor 6`)
Sensor_7 <- summary(dados$`Sensor 7`)
Sensor_8 <- summary(dados$`Sensor 8`)
s <- rbind(Sensor_1, Sensor_2, Sensor_3, Sensor_4, 
           Sensor_5, Sensor_6, Sensor_7, Sensor_8) 
print(s)

library(plotly)

f <- list(
  family = "Courier New, monospace",
  size = 18,
  color = "#7f7f7f")

x <- list(
  title = "Hora",
  titlefont = f)

y <- list(
  title = "Temperatura (em C)",
  titlefont = f)

p <- plot_ly(x = ~dados$datetime, y = ~dados$`Sensor 1`, type = "scatter", mode = "lines", name = "Sensor 1")  %>%
  layout(xaxis = x, yaxis = y) %>% 
  add_lines(y = ~dados$`Sensor 2`, name = "Sensor 2") %>% 
  add_lines(y = ~dados$`Sensor 3`, name = "Sensor 3") %>% 
  add_lines(y = ~dados$`Sensor 4`, name = "Sensor 4") %>% 
  add_lines(y = ~dados$`Sensor 5`, name = "Sensor 5") %>% 
  add_lines(y = ~dados$`Sensor 6`, name = "Sensor 6") %>% 
  add_lines(y = ~dados$`Sensor 7`, name = "Sensor 7") %>% 
  add_lines(y = ~dados$`Sensor 8`, name = "Sensor 8")
p
