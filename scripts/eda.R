
load("dados.Rdata")

Sensor_1 <- summary(dados$s1)
Sensor_2 <- summary(dados$s2)
Sensor_3 <- summary(dados$s3)
Sensor_4 <- summary(dados$s4)
Sensor_5 <- summary(dados$s5)
Sensor_6 <- summary(dados$s6)
Sensor_7 <- summary(dados$s7)
Sensor_8 <- summary(dados$s8)
s <- rbind(Sensor_1, Sensor_2, Sensor_3, Sensor_4, 
           Sensor_5, Sensor_6, Sensor_7, Sensor_8) 
print(s)

library(stargazer)
stargazer(dados[,c(2:9)], type = "text")

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

p <- plot_ly(x = ~dados$datetime, y = ~dados$s1, type = "scatter", mode = "lines", name = "Sensor 1")  %>%
  layout(xaxis = x, yaxis = y) %>% 
  add_lines(y = ~dados$s2, name = "Sensor 2") %>% 
  add_lines(y = ~dados$s2, name = "Sensor 3") %>% 
  add_lines(y = ~dados$s3, name = "Sensor 4") %>% 
  add_lines(y = ~dados$s4, name = "Sensor 5") %>% 
  add_lines(y = ~dados$s5, name = "Sensor 6") %>% 
  add_lines(y = ~dados$s6, name = "Sensor 7") %>% 
  add_lines(y = ~dados$s7, name = "Sensor 8")
p


p2 <- plot_ly(x = ~dados$datetime, y = ~dados$s1, frame = ~dados$datetime, type = "scatter", mode = "lines", name = "Sensor 1")  %>%
  layout(xaxis = x, yaxis = y) %>% 
  add_lines(y = ~dados$s2, name = "Sensor 2") %>% 
  add_lines(y = ~dados$s2, name = "Sensor 3") %>% 
  add_lines(y = ~dados$s3, name = "Sensor 4") %>% 
  add_lines(y = ~dados$s4, name = "Sensor 5") %>% 
  add_lines(y = ~dados$s5, name = "Sensor 6") %>% 
  add_lines(y = ~dados$s6, name = "Sensor 7") %>% 
  add_lines(y = ~dados$s7, name = "Sensor 8")
p2

