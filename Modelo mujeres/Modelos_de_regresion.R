library(readxl)
#BDD <- read_excel("C:/Users/cpere/Desktop/Libros Ingeniería/Sexto semestre/Ipre-econometria/Modelo mujeres/m13_m15.xlsx")
#BDD <- read_excel("C:/Users/cpere/Desktop/Libros Ingeniería/Sexto semestre/Ipre-econometria/Modelo mujeres/m15_m17.xlsx")
#BDD <- read_excel("C:/Users/trini/OneDrive/Escritorio/GITHUB COSAS/Ipre-econometria/Modelo mujeres/m11_m13.xlsx")
library(readr)
BDD <- read_csv("C:/Users/cpere/Desktop/Libros Ingeniería/Sexto semestre/Ipre-econometria/Modelo mujeres/2011_2017.csv")

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
    vector_tiempo_hijo = append(vector_tiempo_hijo, 0)
  }
}

numero_en_mach[1:50]
vector_hijos[1:50]

modelo_1 = lm(BDD$ytrabaj ~ BDD$nhijos)
summary(modelo)

plot(BDD$nhijos, BDD$ytrabaj/1000, ylab="Ingreso", xlab = "Número de hijos")

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

