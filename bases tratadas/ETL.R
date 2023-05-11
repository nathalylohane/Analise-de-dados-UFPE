# Fiz a junção da base de dados dos anos de 2018 e 2019, pois ao tentar juntar algum ano com os dados de 2020 e 2021 dava erro nas colunas, pois os nomes estavam escritos de forma direferente


# carregando a base de snistros de transito do site da PCR
sinistrosRecife2018Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2485590a-3b35-4ad0-b955-8dfc36b61021/download/acidentes_2018.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8')


# junta as bases de dados com comando rbind (juntas por linhas)

sinistrosRecifeRaw <- rbind(sinistrosRecife2018Raw, sinistrosRecife2019Raw)

View(sinistrosRecifeRaw)

# observa a estrutura dos dados
str(sinistrosRecifeRaw)

# modifca a data para formato date
sinistrosRecifeRaw$DATA <- as.Date(sinistrosRecifeRaw$DATA, format = "%Y-%m-%d")

# modifica natureza do sinistro para fator
sinistrosRecifeRaw$natureza_acidente <- as.factor(sinistrosRecifeRaw$natureza_acidente)

# modifica o tipo de acidente para fator 
sinistrosRecifeRaw$tipo <- as.factor(sinistrosRecifeRaw$tipo)

# cria função para substituir not available (na) por 0
naZero <- function(x) {
  x <- ifelse(is.na(x), 0, x)
}

# aplica a função naZero a todas as colunas de contagem
sinistrosRecifeRaw[, 15:25] <- sapply(sinistrosRecifeRaw[, 15:25], naZero)

# exporta em formato nativo do R
saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds")

# exporta em formato csv - para ter uma interoperabilidade
write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv")


