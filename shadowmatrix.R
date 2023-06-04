pacman::p_load("data.table", "funModeling", "tidyverse")

VacinaCovidRecife <- read.csv2("http://dados.recife.pe.gov.br/dataset/7ccb3816-0d62-49e1-b39a-3159870883b0/resource/bceb5759-5500-49db-bc86-b038892acc06/download/vacinados.csv", sep = ";", encoding = "UTF-8")

View(VacinaCovidRecife)

# Criando a Shadow Matrix

VacinaCovidNA <- as.data.frame(abs(is.na(VacinaCovidRecife)))

view(VacinaCovidNA) 

VacinaCovidNA <- VacinaCovidNA[which(sapply(VacinaCovidNA, sd) > 0)]
round(cor(VacinaCovidNA) , 3) # calculando as correlações