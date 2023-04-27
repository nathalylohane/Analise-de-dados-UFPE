sample(distNormal, 10, replace = FALSE)
sample(distNormal, 10, replace = TRUE)

#bootstraping com a função replicate
set.seed(412)
bootsDistNormal10 <- replicate(10, sample(distNormal, 10, replace = TRUE)) #a amostra foi replicada 10x

#calculando uma estatística com bootstrapping
mediaBootsNormal10 <- replicate(10, mean(sample(distNormal, 10, replace = TRUE))) #média de 10 amostras de 10 casos
mediaBootsNormal50 <- replicate(50, mean(sample(distNormal, 10, replace = TRUE))) #média de 50 amostras de 10 casos
mediaBootsNormal100 <- replicate(100, mean(sample(distNormal, 10, replace = TRUE))) #média de 100 amostras de 10 casos

#comparando as médias 
mean(mediaBootsNormal10) # media do boostraping 10
mean(mediaBootsNormal50) # media do boostraping 50
mean(mediaBootsNormal100) # media do boostraping 100
mean(distNormalSimulacao) # media dos dados originais
