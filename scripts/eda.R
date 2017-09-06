
# Diretorio de trabalho
setwd("C:/Users/Washington/Desktop/GitHub/oiti/data.analysis")
getwd()

# Bibliotecas 
library(mosaic)
library(plotly)

# Dados para analise
load("dados.Rdata")
load("df1.Rdata")
load("df2.Rdata")
load("df3.Rdata")
load("df4.Rdata")
load("df5.Rdata")
load("df6.Rdata")
load("df7.Rdata")
load("df8.Rdata")
load("df9.Rdata")


#############################################################
##############  ESTATISTICAS DESCRTIVIVAS   #################

# Antes de 2017-08-22 17:00 
favstats(Temperatura~Sensores, data=df3)

# Após 2017-08-22 17:00 e antes de 2017-08-22 18:25
favstats(Temperatura~Sensores, data=df6)

# Após 2017-08-22 18:25 
favstats(Temperatura~Sensores, data=df9)

# Medições de todo o período
favstats(Temperatura~Sensores, data=dados_long)

library(dplyr)
group_by(my_data, group) %>%
  summarise(
    count = n(),
    mean = mean(weight, na.rm = TRUE),
    sd = sd(weight, na.rm = TRUE)
  )

#############################################################
#############################################################

##################  ANALISE GRAFICA   #######################

library("ggpubr")
ggline(df3, x = "Sensores", y = "Temperatura", add = c("mean_se"))
ggline(dados_long, x = "Sensores", y = "Temperatura", add = c("mean_se"))

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

## dados_long <- Medições de todo o período
p8 <- ggplot(dados_long, aes(x=Sensores, y=Temperatura, fill=Sensores)) + geom_boxplot()
p8 + scale_fill_discrete(name=" ",
                         breaks=c("s1", "s2", "s3", "s4", "s5", "s6", "s7", "s8"),
                         labels=c("Sensor 1", "Sensor 2", "Sensor 3", "Sensor 4", "Sensor 5", "Sensor 6", "Sensor 7", "Sensor 8"))
p8 <- ggplotly(p8)
p8
