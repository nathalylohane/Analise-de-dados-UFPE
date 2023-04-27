# Indexação de vetores
poissonSimulacao <- rpois (400,3)
poissonSimulacao[1]
poissonSimulacao[c(1, 5:20,35)]

#Idexação de data frame
cars$speed #coluna speed da base cars
cars[,2] #coluna 2 da base cars
cars[2:13,1:2] #linhas de 2 até 13 e colunas 1 e 2 da base cars
cars[,"dist"] #coluna dist
cars[, "dist", drop = FALSE] #retorma a coluna dist, em forma de coluna
