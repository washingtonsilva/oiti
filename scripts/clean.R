
# Diretoria de trabalho
setwd("C:/Users/Washington/Desktop/GitHub/oiti/data.analysis")
getwd()

# Bibliotecas utilizadas
library(readxl)
library(visdat)


#### Importando a planilha de dados
dados <- read_xlsx("temperatura.xlsx")
str(dados)

#### Convertendo a Coluna "Date" PARA POSIXct
dados$datetime <- as.POSIXct(dados$datetime, format="%m-%d-%YT%H:%M",  tz = "America/Sao_Paulo")
str(dados$datetime)
head(dados)

#### Verifando a data.frame
vis_dat(dados)
vis_miss(dados)

#### Salvando como .Rdata
save(dados, file = "dados.Rdata")
