ls() # vai listar nossos objetos: "naZero", "sinistrosRecife2018Raw", "sinistrosRecife2019Raw" e "sinistrosRecifeRaw"

# Analisando o quanto cada objeto está ocupando de espaço
for (itm in ls()){
  print(formatC(c(itm, object.size(get(itm))),
              format = "d",
              width = 30),
     quote = F   )
} # o objeto da área intermediária que mais está ocupando espaço é o "sinistroRecife2018Raw" com 6202864

gc()

# Removendo os dados que não são mais úteis
rm(list = c('sinistrosRecife2018Raw','sinistrosRecife2019Raw', "itm"))

ls()

saveRDS(sinistrosRecifeRaw,  "bases tratadas/sinistrosRecife.rds")
write.csv2(sinistrosRecifeRaw, "bases tratadas/sinistrosRecife.cvs")
