
# Carregando a base de dados - base de pedidos de Licenciamento Urbanistico na cidade do Recife 

LicenciamentoUrbanistico <- read.csv2("http://dados.recife.pe.gov.br/dataset/e2bd8f0b-1d62-4323-8159-8ebd6ed9eb4a/resource/77c885c4-76ca-45eb-9209-06c5d217122d/download/licenciamento_urbanistico.csv", sep = ";", encoding = "UTF-8")

LicenciamentoUrbanistico <- LicenciamentoUrbanistico[-2,] # retirei a linha dois da base de dados para diferenciar as bases

#Nova base de dados de licenciamento urbanistico 

LicenciamentoUrbanisticoNovo <- read.csv2("http://dados.recife.pe.gov.br/dataset/e2bd8f0b-1d62-4323-8159-8ebd6ed9eb4a/resource/77c885c4-76ca-45eb-9209-06c5d217122d/download/licenciamento_urbanistico.csv", sep = ";", encoding = "UTF-8")

View(LicenciamentoUrbanisticoNovo)

# Comprando usando chave primária 
LicenciamentoUrbanisticoIncrementada <- (!LicenciamentoUrbanisticoNovo$num_processo %in%
                                           LicenciamentoUrbanistico$num_processo)

# Juntando as duas bases 
LicenciamentoUrbanistico <- rbind(LicenciamentoUrbanistico,
                                  LicenciamentoUrbanistico[LicenciamentoUrbanisticoIncrementada,])
