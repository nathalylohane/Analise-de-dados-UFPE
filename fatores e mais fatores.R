pacman::p_load(ade4, arules)

# Base de dados com o perfil das pessoas vacinadas por covid-19 no Recife
PessoasVacinadasRecife <- read.csv2("http://dados.recife.pe.gov.br/dataset/7ccb3816-0d62-49e1-b39a-3159870883b0/resource/9664de94-9f07-4adc-848d-b6ef56510762/download/vacinados.csv", sep = ";", encoding = "UTF-8")

View(PessoasVacinadasRecife)

for(i in 2:4) {
  PessoasVacinadasRecife[,i] <- as.factor(PessoasVacinadasRecife[,i])}

factorPessoasVacinadas <- unlist(lapply(PessoasVacinadasRecife, is.factor))
PessoasVacinadasfactor <- PessoasVacinadasRecife[ , factorPessoasVacinadas]

# One hoting encoding 
PessoasVacinadasdummy <- acm.disjonctif(PessoasVacinadasfactor)

# Discretização 
inteirosPessoasVacinadas <- unlist(lapply(PessoasVacinadasRecife, is.integer))
PessoasVacinadasinteiros <- PessoasVacinadasRecife[ ,inteirosPessoasVacinadas]  

PessoasVacinadasinteiros$doses.disc <- discretize(PessoasVacinadasinteiros$doses, method = "interval", breaks = 3, labels = c("pouco", "médio", "muito"))
                                   