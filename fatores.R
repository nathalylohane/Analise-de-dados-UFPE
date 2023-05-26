# Criando fatores 

comida <- c(1, 2, 3, 4, 3, 2, 2, 4, 1)
recode <- c(lasanha = 1, hamburguer = 2, maçã = 3, pera = 4)
(comida <- factor(comida, levels = recode, labels = names(recode)))

is.numeric(comida)
is.character(comida)
is.data.frame(comida)
is.factor(comida)
