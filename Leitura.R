install.packages("microbenchmark")

library(microbenchmark)

# exporta em formato nativo do R
saveRDS(sinistrosRecifeRaw, "bases tratadas/sinistrosRecife.rds")

# exporta em formato tabular (.csv) - padrão para interoperabilidade
write.csv2(sinistrosRecifeRaw, "bases tratadas/sinistrosRecife.csv")

# exporta em formato de texto
write.table(sinistrosRecifeRaw, "bases tratadas/sinistrosRecife.txt")

# carrega base de dados em formato nativo R
sinistrosRecife <- readRDS('bases tratadas/sinistrosRecife.rds')

# carrega base de dados em formato tabular (.csv) - padrão para interoperabilidade
sinistrosRecife <- read.csv2('bases tratadas/sinistrosRecife.csv', sep = ';')

# carrega a base de dados em formato de texto
sinistrosRecife <- read.table("bases tratadas/sinistrosRecife.txt", header=T)

# compara os três processos de exportação, usando a função microbenchmark

microbenchmark(a <- saveRDS(sinistrosRecifeRaw, "bases tratadas/sinistrosRecife.rds"), b <- write.csv2(sinistrosRecifeRaw, "bases tratadas/sinistrosRecife.csv"), c <- write.table(sinistrosRecifeRaw, "bases tratadas/sinistrosRecife.txt"), 
               times = 30L) # O arquivo txt foi o que levou mais tempo para ser lido


microbenchmark(a <- readRDS('bases tratadas/sinistrosRecife.rds'), b <- read.csv2('bases tratadas/sinistrosRecife.csv', sep = ';'), c <- sinistrosRecife <- read.table("bases tratadas/sinistrosRecife.txt", header=T), times = 10L) # O arquivo que demorou mais foi o csv
