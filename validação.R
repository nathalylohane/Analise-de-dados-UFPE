pacman::p_load(data.table, dplyr, tidyverse, validate)

Pesagemresiduos <- Pesagemresiduos %>% select(PES_PESOFIM, PES_PESOUTIL, COLETA_DES, ESPECCOLETA_DESC)

# Criando as regras de validação
regraspesagem <- validator(PES_PESOUTIL >= 0, PES_PESOFIM >= 0)

# Fazendo a validação
validaçãoPesagem <- confront(Pesagemresiduos, regraspesagem)

summary(validaçãoPesagem)
plot(validaçãoPesagem)
