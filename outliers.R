pacman::p_load("dplyr", "data.table", "plotly")

# Carregando a base de dados 

covid19PE <- fread("https://dados.seplag.pe.gov.br/apps/basegeral.csv")

covid19PEMun <- covid19PE %>% count (municipio, sort = T, name = "casos") %>% 
  mutate(casos2 = sqrt(casos), casosLog = log10(casos))

# outliers em variáveis
#distancia interquartil 

plot_ly(y = covid19PEMun$casos2, type = "box", text = covid19PEMun$municipio,
        boxpoints = "all", jittler = 0.3)
boxplot.stats(covid19PEMun$casos2)$out
boxplot.stats(covid19PEMun$casos2, coef = 2)$out #modificando o coeficiente de 1.5 para 2 para ser mais rigorosa quanto a identificação de outliers

covid19PEoutliers <- boxplot.stats(covid19PEMun$casos2)$out
covid19PEoutliersIndex <- which(covid19PEMun$casos2 %in% c(covid19PEoutliers))
covid19PEoutliersIndex

# filtro de Hamper
lower_bound <- median(covid19PEMun$casos2) - 3 * mad(covid19PEMun$casos2, constant = 1)
upper_bound <- median(covid19PEMun$casos2) + 3 * mad(covid19PEMun$casos2, constant = 1)
(outlier_ind <- which(covid19PEMun$casos2 < lower_bound | covid19PEMun$casos2 > upper_bound))

# Teste de Rosner 
pacman::p_load("EnvStats")
covidPERosner <- rosnerTest(covid19PEMun$casos2, k = 10)
covidPERosner
covidPERosner$all.stats
