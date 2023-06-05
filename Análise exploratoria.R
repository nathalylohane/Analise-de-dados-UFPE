## Carregar pacotes que serão usados
pacman::p_load(dplyr, ggplot2)

install.packages("devtools")
library("devtools")
devtools::install_github("curso-r/basesCursoR")

# Carregando base de dados
pokemon <- basesCursoR::pegar_base("pokemon")

# Gráfico de Caixas Univariado

pokemon %>% ggplot(aes(y = ataque_especial)) + geom_boxplot()

# Gráfico de Caixas Multivariado

pokemon %>% ggplot(aes(y = ataque_especial, x = pokemon)) + geom_boxplot()

# Histograma 

pokemon %>% ggplot(aes(x = ataque_especial)) + geom_histogram()

# Densidade

pokemon %>% ggplot(aes(x = ataque_especial)) + geom_density()

# Abrindo a base de dados 
library(ISLR)

# Séries Temporais
Auto %>% group_by(year) %>% summarise(acceleration = sum(acceleration)) %>% ggplot(aes(x = year, y = acceleration)) + geom_line()

# Barras
Auto %>% ggplot(aes(x = year, y = acceleration)) + geom_bar(stat = "identity")

# Dispersão
Auto %>% ggplot(aes(x = year, y = acceleration)) + geom_point()
