# Importa tidyverse, pacote pai do readr
library(tidyverse)

# Função que retorna um arquivo de exemplo do R
readr_example("mtcars.csv")

# Lê CSV (separado por vírgula)
dados <- read_csv(readr_example("mtcars.csv"))

# Conseguimos também colocar URL's e arquivos compactados em diversos formatos,
# que o pacote irá descompactar/baixar e ler
dados <- read_csv(readr_example("mtcars.csv.zip"))

# Lê CSV2 (separado por ponto-e-vírgula)
dados <- read_csv2("x;y\n1;1\n2;2\n3;3")

# Lê FWF (campos com tamanho fixo)
dados <- read_fwf(
  readr_example("fwf-sample.txt"), 
  fwf_widths(
    c(20, 10, 12),  # Tamanhos
    c("nome", "estado", "ssn") # Nome da coluna
  )
)

# Todos arquivos com algum delimitador, podem ser lidos com a função genérica, 
# que é usada pelas citadas acima
dados <- read_delim(readr_example("mtcars.csv"), delim = ",")

# Podemos inferir tipos para as colunas.
# Isso pode ser feito em qualquer uma das funções de leitura
dados <- read_csv(
  readr_example("mtcars.csv"), 
  col_types = cols(
    mpg = col_double(),  # Infere tipo das colunas
    cyl = col_integer(), # no formato "nome_columa = col_type()"
    disp = col_double(),
    hp = col_integer(),
    drat = col_double(),
    vs = col_integer(),
    wt = col_double(),
    qsec = col_double(),
    am = col_integer(),
    gear = col_integer(),
    carb = col_integer()
  )
)

# Caso o arquivo não possua cabeçalho ( primeira linha com nome de colunas ),
# podemos fazer ele desconsiderar, dando um nome nas colunas de X1 .. XN ( colunas )
dados <- read_csv(
  readr_example("mtcars.csv"),
  col_names = FALSE, # Informa que o arquivo não tem cabeçalho
  skip = 1, # Pula a primeira linha
  col_types = cols(
    col_double(),   # Infere tipo das colunas, em um segundo formato
    col_integer(),  # col_type() ( na ordem em que é lido )
    col_double(),
    col_integer(),
    col_double(),
    col_double(),
    col_double(),
    col_double(),
    col_integer(),
    col_integer(),
    col_integer()
  )
)