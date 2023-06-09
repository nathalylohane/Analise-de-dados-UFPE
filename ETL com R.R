pacman::p_load(dplyr)

sinistrosRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8')

# carrega a base de snistros de transito do site da PCR
sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2022Raw <- read.csv2("http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/971e0228-fa9c-4a42-b360-c842b29d2f56/download/acidentes2022.csv", sep = ";", encoding = "UTF-8")

# junta as bases de dados com comando rbind (juntas por linhas)
colunas_iguais <- names(sinistrosRecife2020Raw[
  intersect(
    names(sinistrosRecife2020Raw), names(sinistrosRecife2021Raw))])

sinistrosRecife2020Raw <- sinistrosRecife2020Raw %>% select(all_of(colunas_iguais))

colunas_iguais_2022<- names(sinistrosRecife2022Raw[
  intersect(
    names(colunas_iguais), names(sinistrosRecife2022Raw))])

sinistrosRecife2022Raw <- sinistrosRecife2022Raw %>% select(all_of(colunas_iguais_2022))

sinistrosRecifeRaw <- rbind(sinistrosRecife2020Raw, sinistrosRecife2021Raw, sinistrosRecife2022Raw)

# observa a estrutura dos dados
str(sinistrosRecifeRaw)

# modifca a data para formato date
sinistrosRecifeRaw$data <- as.Date(sinistrosRecifeRaw$data, format = "%Y-%m-%d")

# modifica natureza do sinistro de texto para fator
sinistrosRecifeRaw$natureza_acidente <- as.factor(sinistrosRecifeRaw$natureza_acidente)

#modifica a direção da mão da via para fator
sinistrosRecifeRaw$mao_direcao <- as.factor(sinistrosRecifeRaw$mao_direcao)

# cria função para substituir not available (na) por 0
naZero <- function(x) {
  x <- ifelse(is.na(x), 0, x)
}

# aplica a função naZero a todas as colunas de contagem
sinistrosRecifeRaw[, 15:25] <- sapply(sinistrosRecifeRaw[, 15:25], naZero)

# exporta em formato nativo do R
saveRDS(sinistrosRecifeRaw, "bases tratadas/sinistrosRecife.rds")

# exporta em formato tabular (.csv) - padrão para interoperabilidade
write.csv2(sinistrosRecifeRaw, "bases tratadas/sinistrosRecife.csv")
