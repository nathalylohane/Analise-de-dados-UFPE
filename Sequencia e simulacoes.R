tarefaSemente <- addTaskCallback(function(...) {set.seed(123);TRUE})
tarefaSemente

#distribuição normal 
distNormal <- rnorm(150) #criando uma distribuição normal 

summary(distNormal) #sumário da distNormal

#distribuição binomial 
distBinominal <- rbinom(150, 1, 0.7) #criar distribuição binominal, indicando casos, tamanho e probabilidade

#repetições
classeSimulacao <- c(rep("gatos", length(distBinominal)/2), rep("cachorros", length(distBinominal)/2)) # vetor repetindo as classe 

#sequências
indexSimulacao <- seq(1, length(distNormal)) #vetor com índex dos dados, usando a função length o total de casos

#remover a tarefa
removeTaskCallback(tarefaSemente)
