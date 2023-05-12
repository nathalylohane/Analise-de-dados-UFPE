ls() # vai listar nossos objetos: "naZero", "sinistrosRecife2020Raw", "sinistrosRecife2021Raw", "sinistrosRecife2022", "colunas_iguais", "colunas_iguais_2022" e "sinistrosRecifeRaw"

# Analisando o quanto cada objeto está ocupando de espaço
for (itm in ls()){
  print(formatC(c(itm, object.size(get(itm))),
              format = "d",
              width = 30),
     quote = F   )
} # o objeto da área intermediária que mais está ocupando espaço é o "sinistroRecife2020Raw" com 2765280

gc()

# Removendo os dados que não são mais úteis
rm(list = c('sinistrosRecife2022Raw', 'sinistrosRecife2020Raw','itm',
            'sinistrosRecife2021Raw', 'colunas_iguais', 'colunas_iguais_2022'))

ls()


saveRDS(sinistrosRecifeRaw,  "bases tratadas/sinistrosRecife.rds")
write.csv2(sinistrosRecifeRaw, "bases tratadas/sinistrosRecife.cvs")
