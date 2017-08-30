
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

#### Outros tipos de data.frame

# Sem coluna de data-tempo
dados_stempo <- dados[,-1]
str(dados_stempo)

# Data.frame long
dados_long <- stack(dados_stempo)
head(dados_long)
colnames(dados_long) <- c("Temperatura", "Sensores")
str(dados_long)


#### Salvando como .Rdata
save(dados, file = "dados.Rdata")
save(dados_stempo, file = "dados_stempo.Rdata")
save(dados_long, file = "dados_long.Rdata")
