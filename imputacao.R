# imputação de valores em outliers ou missing
pacman::p_load(data.table, Hmisc, VIM) 



## imputação numérica
# preparação da base, colocando NA aleatórios
CarsDT <- cars %>% setDT() #copiar base de dados cars, usando a data.table

(CarsNA <- round(runif(10, 1, 50))) # criamos 10 valores aleatórios

(CarsDT$speed[CarsNA] <- NA) # imputamos NA nos valores aleatórios
View(AtendimentoSAMUDT)
# tendência central
CarsDT$speed <- impute(CarsDT$speed, fun = mean) # média
CarsDT$speed <- impute(CarsDT$speed, fun = median) # mediana

is.imputed(CarsDT$speed) # teste se o valor foi imputado
table(is.imputed(CarsDT$speed)) # tabela de imputação por sim / não

# predição
CarsDT$speed[CarsNA] <- NA # recolocamos os NA

regCars <- lm(speed ~ ., data = CarsDT) # criamos a regressão
CarsNAIndex <- is.na(CarsDT$speed) # localizamos os NA
CarsDT$speed[CarsNAIndex] <- predict(regCars, newdata = CarsDT[CarsNAIndex, ]) # imputamos os valores preditos

## Hot deck
# imputação aleatória
CarsDT$speed[CarsNA] <- NA # recolocamos os NA

(CarsDT$speed <- impute(CarsDT$speed, "random")) # fazemos a imputação aleatória

# imputação por instâncias /semelhança
CarsDT$speed[CarsNA] <- NA # recolocamos os NA
CarsDT2 <- kNN(CarsDT)
