library(readxl)
library(dplyr)
#BDD <- read_excel("C:/Users/cpere/Desktop/Libros Ingeniería/Sexto semestre/Ipre-econometria/Modelo mujeres/m13_m15.xlsx")
#BDD <- read_excel("C:/Users/cpere/Desktop/Libros Ingeniería/Sexto semestre/Ipre-econometria/Modelo mujeres/m15_m17.xlsx")
#BDD <- read_excel("C:/Users/trini/OneDrive/Escritorio/GITHUB COSAS/Ipre-econometria/Modelo mujeres/m11_m13.xlsx")
library(readr)
BDD <- read_csv("C:/Users/cpere/Desktop/Libros Ingeniería/Sexto semestre/Ipre-econometria/Modelo mujeres/2011_2013.csv")

View(BDD)

numero_en_mach = vector()
id = 0

for (i in 1:length(BDD$ytrabaj)){
  print(i)
  if (BDD$id[i] == id){
    numero_en_mach = append(numero_en_mach, 1)
  }
  else 
    {
    numero_en_mach = append(numero_en_mach, 0)
    id = id + 1 
    }
}

vector_hijos = vector()
vector_tiempo_hijo = vector()   # Tiempo desde que se tuvo el primer hijo
for (i in 1:length(BDD$ytrabaj)){
  print(i)
  if (BDD$nhijos[i] == 0){
    vector_hijos = append(vector_hijos, 0)
    vector_tiempo_hijo = append(vector_tiempo_hijo, 99)
  }
  else 
  {
    vector_hijos = append(vector_hijos, 1)
    vector_tiempo_hijo = append(vector_tiempo_hijo, BDD$edad[i] - BDD$ephijo[i])
  }
}

numero_en_mach[1:50]
vector_hijos[1:50]
vector_tiempo_hijo[1:50]


bdd_filtrada = cbind(BDD, vector_tiempo_hijo)

bdd_filtrada = filter(bdd_filtrada, bdd_filtrada$vector_tiempo_hijo != 99.0, bdd_filtrada$vector_tiempo_hijo >= 0)
plot(bdd_filtrada$vector_tiempo_hijo, bdd_filtrada$ytrabaj/1000, ylab="Ingreso", xlab = "Tiempo desde el primer hijo")


bdd_filtrada_0 = filter(bdd_filtrada, bdd_filtrada$vector_tiempo_hijo == 0)
bdd_filtrada_1 = filter(bdd_filtrada, bdd_filtrada$vector_tiempo_hijo == 1)
bdd_filtrada_2 = filter(bdd_filtrada, bdd_filtrada$vector_tiempo_hijo == 2)
bdd_filtrada_3 = filter(bdd_filtrada, bdd_filtrada$vector_tiempo_hijo == 3)
bdd_filtrada_4 = filter(bdd_filtrada, bdd_filtrada$vector_tiempo_hijo == 4)
bdd_filtrada_5 = filter(bdd_filtrada, bdd_filtrada$vector_tiempo_hijo == 5)
bdd_filtrada_6 = filter(bdd_filtrada, bdd_filtrada$vector_tiempo_hijo == 6)


media_0 = mean(bdd_filtrada_0$ytrabaj)
media_1 = mean(bdd_filtrada_1$ytrabaj)
media_2 = mean(bdd_filtrada_2$ytrabaj)
media_3 = mean(bdd_filtrada_3$ytrabaj)
media_4 = mean(bdd_filtrada_4$ytrabaj)
media_5 = mean(bdd_filtrada_5$ytrabaj)
media_6 = mean(bdd_filtrada_6$ytrabaj)

medias = c(media_0, media_1, media_2, media_3, media_4, media_5, media_6)
numeros = c(0,1,2,3,4,5,6)

plot(numeros, medias/1000, ylab = "Ingreso", xlab = "Tiempo desde el primer hijo")


plot(BDD$nhijos, BDD$ytrabaj/1000, ylab = "Ingreso", xlab = "Número de hijos")

modelo_1 = lm(BDD$ytrabaj ~ BDD$nhijos)
summary(modelo)
#modelo_log = lm(log(BDD$ytrabaj) ~ BDD$nhijos)
#summary(modelo_log)

modelo_2 = lm(BDD$ytrabaj ~ vector_hijos)
summary(modelo_2)

multiplicacion = numero_en_mach * vector_hijos

modelo_3 = lm(BDD$ytrabaj ~ multiplicacion)
summary(modelo_3)

modelo_3_2 = lm(BDD$ytrabaj ~ multiplicacion + vector_tiempo_hijo)
summary(modelo_3_2)

modelo_4 = lm(BDD$ytrabaj ~ multiplicacion + numero_en_mach)
summary(modelo_4)

modelo_5 = lm(BDD$ytrabaj ~ multiplicacion + BDD$edad + numero_en_mach)
summary(modelo_5)

modelo_6 = lm(BDD$ytrabaj ~ multiplicacion + BDD$edad + numero_en_mach
              + BDD$esc + BDD$horas + BDD$region + BDD$tsec)
summary(modelo_6)

