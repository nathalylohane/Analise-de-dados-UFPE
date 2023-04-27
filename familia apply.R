#Família apply 

#média das variáveis da base de dados cars
apply(cars[], 2, mean)
lapply(cars[], mean)
sapply(cars[], mean)

#Divisão da área do plot para receber dois gráficos em uma linha
par(mfrow = c(1, 2))

#Criando o histograma 
sapply(cars[, 1:2], hist)

for (i in 1:2) { # Deve rodar as colunas 1 e 2
  x <- cars[ , i] # cria uma variável temporária
  hist(x,
       main = names(cars)[i], # atribui a cada gráfico o nome original de cada variável
       xlab = "Valores da Variável", # rótulo eixo x
       ylab = 'Frequência', # rótulo eixo y
       xlim = c(min(cars[, i]), max(cars[, i]))) # limites do eixo x
}

