library(tidyverse)
library(broom)


# Abrir base de datos #

data("CO2")


# Fórmula de un Modelo #
## alguna_funcion(Y ~ X1 + X2 + ... + Xn, data = data.frame) ##
### donde Y es una variable que queremos explicar, X son variables que creemos que la pueden explicar, y data.frame será nuestra base de datos ###
#### Y = Variable(Captación de CO2)
#### ~ = explicado por
#### Xn = Variable explicativa (Subespecie, tratamiento, etc)
#### data.frame = Base de datos (CO2)
#### alguna_función = modelo a testear (nuestra simplificación de la realidad)

# Qué modelo usamos para medir el co2 de la planta?

## Captación de CO2 explicado por ecotipo

Fit1 <- lm(uptake ~ Type, data = CO2)

## para el modelo general 

Est1 <- glance(Fit1)
 
Est2 <- tidy(Fit1)

Est3 <- augment(Fit1)



# Como seleccionar un modelo?
  # AIC=2K−2ln(L̂)
    # donde K = número de parámetros
    # L = logLik


# Modelos candidatos

Fit2 <- lm(uptake ~ Treatment, data = CO2)
Fit3 <- lm(uptake ~ conc, data = CO2)
Fit4 <- lm(uptake ~ Type + Treatment + conc, data = CO2)
Fit5 <- lm(uptake ~ Type + conc + I(log(conc)), data = CO2)
