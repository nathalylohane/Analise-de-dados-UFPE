# Extração de diferentes bases de dados 

#Extração da base de dados de Licenciamento Ambiental do Recife

LicenciamentoAmbientelRecife <- read.csv2("http://dados.recife.pe.gov.br/dataset/0bc5325e-0203-4577-9d56-bd3aef192f20/resource/921244a8-fe47-4192-a57d-084830337f99/download/licenciamento_ambiental.csv", sep = ";", encoding = "UTF-8")

# Extração base de dados Nasa

library("XML")

nasa <- xmlToDataFrame("http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/nasa/nasa.xml")

# Extração base de dados da velocidade das vias 

install.packages("rjson")
library("rjson")

VelocidadeViasRecife <- fromJSON(file = "http://dados.recife.pe.gov.br/dataset/99eea78a-1bd9-4b87-95b8-7e7bae8f64d4/resource/d4074db6-0ac6-4f5c-8e53-272711a84018/download/faixaazul.json")

VelocidadeViasRecife <- as.data.frame(VelocidadeViasRecife)
