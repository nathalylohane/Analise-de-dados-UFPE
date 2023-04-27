install.packages("eeptools")
library("eeptools")

#Vetor com nome dos gatos
nomegatos <- c("Gertrudes", "Jumbo", "Jumo", "Juby")

#Vetor com a cor dos gatos 
corgatos <- c("branco e preto", "preto", "amarelo", "amarelo e branco")

#Vetor com a data de nascimento
nascimentogatos <- as.Date(c("2022-06-26", "2022-06-26", "2022-06-26","2022-06-26"))

#Vetor com a idade 
idadegatos <- round( age_calc(nascimentogatos, units = "years"))

#Criando o data frame
Informaçõesgatos <- data.frame(
  nome = nomegatos, #nome de cada gato
  cor = corgatos,  #cor de cada gato
  nascimento = nascimentogatos, #data de nascimento
  idade = idadegatos #idade de cada gato
)
