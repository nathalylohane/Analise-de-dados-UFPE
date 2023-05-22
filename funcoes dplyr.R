library(dplyr)

# Abrindo a base de dados 
Pesagemresiduos <- read.csv2("http://dados.recife.pe.gov.br/dataset/2bc56ecf-4716-449e-9c72-1241f090c6d9/resource/41a65b6d-1e31-4084-9d6b-1f50bfd004e5/download/pesagens2016.csv", sep = ";", encoding = "UTF-8")

View(Pesagemresiduos)

# Transformando um texto em fator
Pesagemresiduos$COLETA_DES <- as.factor(Pesagemresiduos$COLETA_DES)

# Criando o sumário 
count(Pesagemresiduos, COLETA_DES)

# Criando um sumário com agrupamento - é para fazer uma sumário com a média do peso fim a partir do tipo de coleta
Pesagemresiduos %>% group_by(COLETA_DES) %>% summarise(avg = mean(PES_PESOFIM))

#Criando uma seleção de casos 
Pesagemresiduos %>% group_by(COLETA_DES, ESPECCOLETA_DESC) %>% summarise (avg = mean(PES_PESOFIM)) # média do peso final a partir do tipo de coleta e do local 
Pesagemresiduos %>% summarise (avg = mean(PES_PESOFIM)) # média geral

# Ordernando os casos 
arrange(Pesagemresiduos, PES_PESOFIM) #crescente
arrange(Pesagemresiduos, desc(PES_PESOFIM)) # decrescente

# Seleção de colunas
Pesagemresiduos %>% select(COLETA_DES, ESPECCOLETA_DESC, PES_PESOFIM) %>% arrange(PES_PESOFIM) # com a base de dados selecione as três colunas expostas e ordene a partir do peso final

# Criando uma nova coluna
Pesagemresiduos %>% mutate(peso = PES_PESOFIM/PES_PESOUTIL) # nova coluna do peso final dividido pelo peso útil

# Renomeando as colunas 
Pesagemresiduos %>% rename(Pesofim = PES_PESOFIM)
