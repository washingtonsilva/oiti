
# Diretorio de trabalho
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
tail(dados)
str(dados)

#### Verifando a data.frame
vis_dat(dados)
vis_miss(dados)

#### Salvando como .Rdata
save(dados, file = "dados.Rdata")

#### dados sem a coluna 1 (data-tempo)  wide format
dados_wide <- dados[-1]
str(dados_wide)
save(dados_wide, file = "dados_wide.Rdata")

#### dados sem a coluna 1 (data-tempo) long format
dados_long <- stack(dados_wide)
head(dados_long)
colnames(dados_long) <- c("Temperatura", "Sensores")
tail(dados_long)
save(dados_long, file = "dados_long.Rdata")

###############################################################
###############       SUBSETTING          #####################  
###############################################################

############################################################
## df1 <- Antes de 2017-08-22 17:00
df1 <- subset(dados, datetime < as.POSIXct('2017-08-22 17:00'))
head(df1)
tail(df1)
str(df1)
save(df1, file = "df1.Rdata")

# df2 = df1 sem a coluna 1 (data-tempo) - wide format
df2 <- df1[,-1]
head(df2)
tail(df2)
save(df2, file = "df2.Rdata")

# df3 = df2 long format
df3 <- stack(df2)
head(df3)
colnames(df3) <- c("Temperatura", "Sensores")
tail(df3)
save(df3, file = "df3.Rdata")

############################################################
## df4 <- Após 2017-08-22 17:00 e antes de 2017-08-22 18:25
df4 <- subset(dados, datetime >= as.POSIXct('2017-08-22 17:00') 
              & datetime < as.POSIXct('2017-08-22 18:25'))
head(df4)
tail(df4)
str(df4)
save(df4, file = "df4.Rdata")

# df5 = df4 sem a coluna 1 (data-tempo) - wide format
df5 <- df4[,-1]
tail(df5)
save(df5, file = "df5.Rdata")

# df6 = df5 long format
df6 <- stack(df5)
head(df6)
colnames(df6) <- c("Temperatura", "Sensores")
tail(df6)
save(df6, file = "df6.Rdata")

############################################################
## df7 <- Após 2017-08-22 18:25
df7 <- subset(dados, datetime > as.POSIXct('2017-08-22 18:25'))
head(df7)
tail(df7)
save(df7, file = "df7.Rdata")

# df8 = df7 sem a coluna 1 (data-tempo) - wide format
df8 <- df7[,-1]
head(df8)
tail(df8)
save(df8, file = "df8.Rdata")

# df9 = df8 long format
df9 <- stack(df8)
head(df9)
colnames(df9) <- c("Temperatura", "Sensores")
tail(df9)
save(df9, file = "df9.Rdata")
