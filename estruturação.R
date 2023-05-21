library(data.table)
library(dplyr)
library(tidyverse)

general_data<-fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") # carrega dados de covid19 no mundo

view(general_data)

south_america_countries<-c("Argentina", "Brazil", "Bolivia", "Chile", "Colombia", "Ecuador",  "Guyana", "Paraguay", "Peru", "Suriname", "Uruguay", "Venezuela") # vetor que identifica países da america do sul

south_america<- general_data %>% filter(location %in% south_america_countries) # filtra casos apenas no vetor

msouth <- south_america %>% group_by(location) %>% mutate(row = row_number()) %>% select(location, new_cases, row) # cria matriz dos países, agrupando por local, criando uma nova linha com index e selecionando apenas algumas variáveis
 
view(msouth)

# filtra dados para garantir que todos os países tenham mesmo nro de casos
result <- mlatin %>% group_by(location) %>% filter(row == max(row))
mlatin <- mlatin %>% filter(row<=min(result$row)) 

# pivota o data frame de long para wide
msouthw <- msouth %>% pivot_wider(names_from = row, values_from = new_cases) %>% remove_rownames %>% column_to_rownames(var="location") 
