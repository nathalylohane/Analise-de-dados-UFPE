install.packages("funModeling")
install.packages("tidyverse")
pacman::p_load(funModeling, tidyverse)


glimpse(LicenciamentoUrbanisticoNovo) # olhar de forma geral os dados
status(LicenciamentoUrbanisticoNovo) # estrutura dos dados (missing etc)
freq(LicenciamentoUrbanisticoNovo) # frequência das variáveis fator
plot_num(LicenciamentoUrbanisticoNovo) # exploração das variáveis numéricas
profiling_num(LicenciamentoUrbanisticoNovo) # estatísticas das variáveis numéricas
