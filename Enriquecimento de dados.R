#### CARREGANDO PACOTES ####
pacman::p_load(dplyr, tidyverse)

# Carregando as bases de dados 

RedeMunicipal <- read.csv2("http://dados.recife.pe.gov.br/dataset/4d3a3b39-9ea9-46ed-bf21-a2670de519c1/resource/7c613836-9edd-4c0f-bc72-495008dd29c3/download/info_unidadesensino_07102021.csv", sep = ";", encoding = "UTF-8")

ListaEscolas <- read.csv2("http://dados.recife.pe.gov.br/dataset/2015a954-4f3a-4ff2-84a1-f915feffd9ac/resource/c4c1d073-8664-485a-8295-61368ca6a8dd/download/escolas.csv", sep = ";", encoding = "UTF-8")

view(RedeMunicipal)
view(ListaEscolas)

ListaEscolas <- left_join(ListaEscolas, RedeMunicipal, by = c("CO_ENTIDADE" = "inep"))

view(ListaEscolas)
