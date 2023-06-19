### CARREGAR PACOTES
pacman::p_load(ccaPP, lsa, minerva, Rfast)

### CRIAR FUNÇÃO PARA RODAR VÁRIAS ASSOCIAÇÕES
multi.cor <- function(x, y) {
  c(
    cor = cor(x, y), # Correlação
    dcor = dcor(x, y), # Distance correlation
    cosine = cosine(x, y), # Distância do Cosseno 
    maxCor = maxCorProj(x, y), # Maximal correlation
    MIC = mine (x, y) #  Maximal Information Coefficient
  )
}

### Correlação linear

plot(cars) # Plotar o gráfico

corList <- multi.cor(cars$dist, cars$dist)
names(corList)
corList <- corList[c(1,5,6,7, 15)]
corList



