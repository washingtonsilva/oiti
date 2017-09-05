
library(stargazer)


#############################################################
##############  ESTATISTICAS DESCRTIVIVAS   #################

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

# Usando stargazer
stargazer(as.data.frame(df1), type = "text")
stargazer(as.data.frame(df4), type = "text")
stargazer(as.data.frame(df7), type = "text")
stargazer(as.data.frame(dados), type = "text")

#############################################################
#############################################################

##################  ANALISE GRAFICA   #######################

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

################################################################
####           GRAFICOS DE LINHA INTERATIVOS                ####
################################################################

### df1 <- Antes de 2017-08-22 17:00 
### 85 obs. of  9 variables

p1 <- plot_ly(x = ~df1$datetime, y = ~df1$s1, type = "scatter", mode = "lines", name = "Sensor 1")  %>%
  layout(xaxis = x, yaxis = y) %>% 
  add_lines(y = ~df1$s2, name = "Sensor 2") %>% 
  add_lines(y = ~df1$s2, name = "Sensor 3") %>% 
  add_lines(y = ~df1$s3, name = "Sensor 4") %>% 
  add_lines(y = ~df1$s4, name = "Sensor 5") %>% 
  add_lines(y = ~df1$s5, name = "Sensor 6") %>% 
  add_lines(y = ~df1$s6, name = "Sensor 7") %>% 
  add_lines(y = ~df1$s7, name = "Sensor 8")
p1

### df4 <- Após 2017-08-22 17:00 e antes de 2017-08-22 18:25
###  85 obs. of  9 variables

p2 <- plot_ly(x = ~df4$datetime, y = ~df4$s1, type = "scatter", mode = "lines", name = "Sensor 1")  %>%
  layout(xaxis = x, yaxis = y) %>% 
  add_lines(y = ~df4$s2, name = "Sensor 2") %>% 
  add_lines(y = ~df4$s2, name = "Sensor 3") %>% 
  add_lines(y = ~df4$s3, name = "Sensor 4") %>% 
  add_lines(y = ~df4$s4, name = "Sensor 5") %>% 
  add_lines(y = ~df4$s5, name = "Sensor 6") %>% 
  add_lines(y = ~df4$s6, name = "Sensor 7") %>% 
  add_lines(y = ~df4$s7, name = "Sensor 8")
p2

### df7 <- Após 2017-08-22 18:25 
### 2901 obs. of  9 variables

p3 <- plot_ly(x = ~df7$datetime, y = ~df7$s1, type = "scatter", mode = "lines", name = "Sensor 1")  %>%
  layout(xaxis = x, yaxis = y) %>% 
  add_lines(y = ~df7$s2, name = "Sensor 2") %>% 
  add_lines(y = ~df7$s2, name = "Sensor 3") %>% 
  add_lines(y = ~df7$s3, name = "Sensor 4") %>% 
  add_lines(y = ~df7$s4, name = "Sensor 5") %>% 
  add_lines(y = ~df7$s5, name = "Sensor 6") %>% 
  add_lines(y = ~df7$s6, name = "Sensor 7") %>% 
  add_lines(y = ~df7$s7, name = "Sensor 8")
p3

### dados <- Todas as medições 
### 3072 obs. of  9 variables

p4 <- plot_ly(x = ~dados$datetime, y = ~dados$s1, type = "scatter", mode = "lines", name = "Sensor 1")  %>%
  layout(xaxis = x, yaxis = y) %>% 
  add_lines(y = ~dados$s2, name = "Sensor 2") %>% 
  add_lines(y = ~dados$s2, name = "Sensor 3") %>% 
  add_lines(y = ~dados$s3, name = "Sensor 4") %>% 
  add_lines(y = ~dados$s4, name = "Sensor 5") %>% 
  add_lines(y = ~dados$s5, name = "Sensor 6") %>% 
  add_lines(y = ~dados$s6, name = "Sensor 7") %>% 
  add_lines(y = ~dados$s7, name = "Sensor 8")
p4

################################################################
####                   BOXPLOTS                             ####
################################################################

### df3 <- Antes de 2017-08-22 17:00
p5 <- ggplot(df3, aes(x=Sensores, y=Temperatura, fill=Sensores)) + geom_boxplot()
p5 <- ggplotly(p5)
p5

### df6 <- Após 2017-08-22 17:00 e antes de 2017-08-22 18:25
p6 <- ggplot(df6, aes(x=Sensores, y=Temperatura, fill=Sensores)) + geom_boxplot()
p6 <- ggplotly(p6)
p6

### df9 <- Após 2017-08-22 18:25
p7 <- ggplot(df9, aes(x=Sensores, y=Temperatura, fill=Sensores)) + geom_boxplot()
p7 <- ggplotly(p7)
p7
