library(readxl)
library(dplyr)
#BDD <- read_excel("C:/Users/cpere/Desktop/Libros Ingeniería/Sexto semestre/Ipre-econometria/Modelo mujeres/m13_m15.xlsx")
#BDD <- read_excel("C:/Users/cpere/Desktop/Libros Ingeniería/Sexto semestre/Ipre-econometria/Modelo mujeres/m15_m17.xlsx")
#BDD <- read_excel("C:/Users/trini/OneDrive/Escritorio/GITHUB COSAS/Ipre-econometria/Modelo mujeres/m11_m13.xlsx")
library(readr)
BDD <- read.csv("C:/Users/trini/OneDrive/Escritorio/GITHUB COSAS/Ipre-econometria/Modelo mujeres/2013_2017.csv")


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


##### Agregado ##### 
#menos_uno = c()
# [1] 161204
# [1] 42014
#hola <- read.csv("C:/Users/trini/OneDrive/Escritorio/GITHUB COSAS/Ipre-econometria/Modelo mujeres/2011_2013.csv")
#View(hola)
#numero_id = c(1:42014)
#for (i in 1:length(numero_id)){ # recorro id
  #print(i)
  #contador = 0
  #for (j in 1:length(hola$id)){ # recorro obs
   # if (contador == 0){
    #  if (hola$id[j] == i){
     #   menos_uno = append(menos_uno, hola$ytrabaj[j])
      #  contador = 1
      #}
    #}else{
     # break
    #}
  #}
#}
#menos_uno
#media_n1 = mean(hola$ytrabaj)
#media_n1
##### terminado #####


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

medias = c(media_n1, media_0, media_1, media_2, media_3, media_4)
numeros = c(-1,0,1,2,3,4)

plot(numeros, medias/1000, ylab = "Income [chilean pesos]", xlab = "Years since the first child",pch = 20,cex = 4,cex.lab = 2,cex.axis = 1.5)


modelo_1 = lm(BDD$ytrabaj ~ BDD$nhijos)
summary(modelo_1)
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

# plot de multiplicación y income
one = c()
cero = c()
for (i in 1:length(multiplicacion)){
  if (multiplicacion[i] == 1){
    one = append(one,BDD$ytrabaj[i])
  }else{
    cero = append(cero,BDD$ytrabaj[i])
  }
}
media_cero_mult = mean(cero)
media_one_mult = mean(one)
vector_multi= c(media_cero_mult,media_one_mult)

plot(c(0,1),vector_multi/1000,xlab = "Multiplication", ylab = "Income [chilean pesos]",xlim = c(0, 1),pch = 20,cex = 4,cex.lab = 2,cex.axis = 1.5)




BDD <- read_csv("C:/Users/cpere/Desktop/Libros Ingeniería/Sexto semestre/Ipre-econometria/Modelo mujeres/casen_2013.csv")

primer_filtro = filter(BDD, BDD$sexo == 1, BDD$edad >= 18)






bdd_filtrada = primer_filtro

bdd_filtrada_0 = filter(bdd_filtrada, bdd_filtrada$s5 == 0)
bdd_filtrada_1 = filter(bdd_filtrada, bdd_filtrada$s5 == 1)
bdd_filtrada_2 = filter(bdd_filtrada, bdd_filtrada$s5 == 2)
bdd_filtrada_3 = filter(bdd_filtrada, bdd_filtrada$s5 == 3)
bdd_filtrada_4 = filter(bdd_filtrada, bdd_filtrada$s5 == 4)
bdd_filtrada_5 = filter(bdd_filtrada, bdd_filtrada$s5 == 5)
bdd_filtrada_6 = filter(bdd_filtrada, bdd_filtrada$s5 == 6)



media_0 = mean(bdd_filtrada_0$yoprcor)
media_1 = mean(bdd_filtrada_1$yoprcor)
media_2 = mean(bdd_filtrada_2$yoprcor)
media_3 = mean(bdd_filtrada_3$yoprcor)
media_4 = mean(bdd_filtrada_4$yoprcor)
media_5 = mean(bdd_filtrada_5$yoprcor)
media_6 = mean(bdd_filtrada_6$yoprcor)


medias = c(media_0, media_1, media_2, media_3, media_4, media_5, media_6)
numeros = c(0,1,2,3,4,5,6)

plot(numeros, medias/1000, ylab = "Income [chilean pesos]", xlab = "Number of children",
     type = "b") #2017
lines(numeros, medias/1000, ylab = "Income [chilean pesos]", xlab = "Number of children",
     type = "b", col="red") #2015
lines(numeros, medias/1000, ylab = "Income [chilean pesos]", xlab = "Number of children",
     type = "b", col="green") #2013
lines(numeros, medias/1000, ylab = "Income [chilean pesos]", xlab = "Number of children",
      type = "b", col="blue") #2011

legend("topright",                                       # Add legend to plot
       legend = c("2017", "2015", "2013", "2011"),
       col = c("black", "red", "green", "blue"),
       lty = 1)



