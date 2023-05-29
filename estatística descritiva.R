# Estatística descritiva com R

View(USArrests)

# Tabela da frequência absoluta da variável mortes da base USArrests
table(USArrests$Murder)

# Tabela da frequência variável da variável mortes da base USArrests
prop.table(table(USArrests$Murder))

# Média
mean(USArrests$Murder)

# Mediana 
median(USArrests$Murder)

# Separatrizes
quantile(USArrests$Murder, probs = 0.75)
quantile(USArrests$Murder, probs = 0.10)
quantile(USArrests$Murder, probs = 0.95)

# Desvio padrão
sd(USArrests$Murder)

#sumário básco de todas as variáveis 
summary(USArrests)

# Sumário descritivo de todas as variáveis com o pacote fBasics
pacman::p_load(fBasics)
basicStats(USArrests)
