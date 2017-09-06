#Importa tidyverse, pacote pai do readr
library(tidyverse)

#Lê CSV (separado por vírgula) (arquivo possui cabeçalho)
dados <- read.csv("com-cabecalho.csv")

#Lê CSV (parâmetros expandidos)
dados <- read.csv(
  file = "sem-cabecalho.csv", # Nome do arquivo
  header = FALSE, # Se o arquivo possui cabeçalho ou não
  sep = ",", # Separador ( no caso do CSV, o padrão é "," )
  quote = "\"", # Os caracteres estão encapsulados em algum caractere?
  skip = 0, # Pular "n" linhas antes de começar a ler
  nrows = -1, # Deve ler um total de quantas linhas?
  col.names = c( # Nome das colunas
    "Id",
    "sfat_dr",
    "sfat_ffq",
    "tfat_dr",
    "tfat_ffq",
    "alco_dr",
    "alco_ffq",
    "cal_dr",
    "cal_ffq"
  )
)






