### CARREGANDO PACOTES ###
pacman::p_load(car, gvlma, lm.beta, lmtest, MASS, sandwich)

USArrests
View(USArrests)

# Criando a regressão 

RegUSA <- lm(Assault ~ ., data = USArrests)
summary(RegUSA)
lm.beta(RegUSA)

# Stepwise 
RegUSAback <- step(lm(Assault ~ ., data = USArrests), direction = "backward")
RegUSAforw <- step(lm(Assault ~ ., data = USArrests), direction = "forward")
RegUSAboth <- step(lm(Assault ~ ., data = USArrests), direction = 'both')
summary(RegUSAboth)

# Verificação dos pressupostos 
# normalidade dos resíduos
shapiro.test(residuals(RegUSAboth))
plot(RegUSAboth, which=1, col=c("blue")) # resíduos x ajuste
plot(RegUSAboth, which=2, col=c("red")) # Q-Q Plot
plot(RegUSAboth, which=5, col=c("blue"))  # Observações Influentes

# Retirada dos valores ausentes

# inflação da variância / multicolinearidade
vif(RegUSAboth)
barplot(vif(RegUSAboth), main = "VIF Values", horiz = FALSE, col = "steelblue", ylim = c(0,5))
abline(h = 5, lwd = 3, lty = 2)


# homocedasticidade (H0 = homocedasticidade)
bptest(RegUSAboth) # teste de homocedasticidade
plot(RegUSAboth, which=3, col=c("blue"))  # Scale-Location Plot

# Robustes dos dados
RegUSAboth$robse <- vcovHC(RegUSAboth, type = "HC1")
coeftest(RegUSAboth, RegUSAboth$robse)
