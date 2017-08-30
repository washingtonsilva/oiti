

setwd("C:/Users/Washington/Desktop/GitHub/oiti/data.analysis")
get

# Bibliotecas utilizadas
library(stargazer)
library(visdat)
library(plotly)
library(readxl)

#### Importando a planilha de dados
dados <- read_xlsx("temperatura.xlsx")
str(dados)

#### Convertendo a Coluna "Date" PARA POSIXct
dados$datetime <- as.POSIXct(dados$datetime, format="%m-%d-%YT%H:%M",  tz = "America/Sao_Paulo")
str(dados$datetime)

#### Convetendo as variáveis para o tipo numeric
dados$s1 <- as.numeric(dados$s1)
dados$s2 <- as.numeric(dados$s2)
dados$s3 <- as.numeric(dados$s3)
dados$s4 <- as.numeric(dados$s4)
dados$s5 <- as.numeric(dados$s5)
dados$s6 <- as.numeric(dados$s6)
dados$s7 <- as.numeric(dados$s7)
dados$s8 <- as.numeric(dados$s8)
head(dados)

#### Verifando a data.frame
vis_dat(dados)
vis_miss(dados)

#### Salvando como .Rdata
save(dados, file = "dados.Rdata")
