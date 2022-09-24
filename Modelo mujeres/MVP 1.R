library(dplyr)
library(readxl)
casen2011 <- read_excel("C:/Users/trini/OneDrive/Escritorio/6° SEMESTRE/IPRE/raw/Datos limpios/Datos limpios/Version Excel/Arregladas/casen2011.xlsx")
casen2013 <- read_excel("C:/Users/trini/OneDrive/Escritorio/6° SEMESTRE/IPRE/raw/Datos limpios/Datos limpios/Version Excel/Arregladas/casen2013.xlsx")
casen2015 <- read_excel("C:/Users/trini/OneDrive/Escritorio/6° SEMESTRE/IPRE/raw/Datos limpios/Datos limpios/Version Excel/Arregladas/casen2015.xlsx")
casen2017 <- read_excel("C:/Users/trini/OneDrive/Escritorio/6° SEMESTRE/IPRE/raw/Datos limpios/Datos limpios/Version Excel/Arregladas/casen2017.xlsx")

#### arreglo: Quitamos los que no saben cuántos hijos tiene####
casen2011 = filter(casen2011,casen2011$s7 != "99.0")
casen2013 = filter(casen2013,casen2013$s5 != "99.0")
casen2015 = filter(casen2015,casen2015$s4 != "99.0")
casen2017 = filter(casen2017,casen2017$s4 != "99.0")

#View(casen2011) # lista
#View(casen2013) # lista
#View(casen2015) # lista
#View(casen2017) # lista

# 1 Nunca asisitió
# 2 Jardín Infantil / Sala Cuna
# 3 Kinder / Prekinder
# 4 Educación Especial (Diferencial)
# 5 Primaria o Preparatoria (Sistema antiguo)
# 6 Educación Básica
# 7 Humanidades (Sistema Antiguo)
# 8 Educación Media Científico-Humanista
# 9 Técnica Comercial, Industrial o Normalista (Sistema Antiguo)
# 10 Educación Media Técnica Profesional
# 11 Técnico Nivel Superior
# 12 Profesional
# 13 Postgrado

# Yitg=g*DitEvent+g*DitAge+g*DitYear+itg
#mujeres2011 = filter(casen2011$sexo == )

#### Trabajaremos con mujeres, datos en las 4 bdd ####
mujeres2011 = filter(casen2011, casen2011$sexo == 2)
mujeres2013 = filter(casen2013, casen2013$sexo == 2)
mujeres2015 = filter(casen2015, casen2015$sexo == 2)
mujeres2017 = filter(casen2017, casen2017$sexo == "2.0")

View(mujeres2011)
View(mujeres2013)
View(mujeres2015)
View(mujeres2017)

mujeres2011$region = as.numeric(mujeres2011$region)
mujeres2011$sexo = as.numeric(mujeres2011$sexo)
mujeres2011$edad = as.numeric(mujeres2011$edad)
mujeres2011$s7 = as.numeric(mujeres2011$s7)
mujeres2011$s8 = as.numeric(mujeres2011$s8)
mujeres2011$ytrabaj = as.numeric(mujeres2011$ytrabaj)
mujeres2011$ytrabhaj = as.numeric(mujeres2011$ytrabhaj)
mujeres2011$o10 = as.numeric(mujeres2011$o10)
mujeres2011$o27 = as.numeric(mujeres2011$o27)
mujeres2011$e6a = as.numeric(mujeres2011$e6a)
mujeres2011$e6b = as.numeric(mujeres2011$e6b)
mujeres2013$region = as.numeric(mujeres2013$region)
mujeres2013$sexo = as.numeric(mujeres2013$sexo)
mujeres2013$edad = as.numeric(mujeres2013$edad)
mujeres2013$s5 = as.numeric(mujeres2013$s5)
mujeres2013$s6 = as.numeric(mujeres2013$s6)
mujeres2013$yoprcor = as.numeric(mujeres2013$yoprcor)
mujeres2013$yoprcorh = as.numeric(mujeres2013$yoprcorh)
mujeres2013$o10 = as.numeric(mujeres2013$o10)
mujeres2013$o27 = as.numeric(mujeres2013$o27)
mujeres2013$e6a = as.numeric(mujeres2013$e6a)
mujeres2013$e6b = as.numeric(mujeres2013$e6b)
mujeres2015$region = as.numeric(mujeres2015$region)
mujeres2015$sexo = as.numeric(mujeres2015$sexo)
mujeres2015$edad = as.numeric(mujeres2015$edad)
mujeres2015$s4 = as.numeric(mujeres2015$s4)
mujeres2015$s5 = as.numeric(mujeres2015$s5)
mujeres2015$yoprcor = as.numeric(mujeres2015$yoprcor)
mujeres2015$yoprcorh = as.numeric(mujeres2015$yoprcorh)
mujeres2015$o10 = as.numeric(mujeres2015$o10)
mujeres2015$o27 = as.numeric(mujeres2015$o27)
mujeres2015$e6a = as.numeric(mujeres2015$e6a)
mujeres2017$region = as.numeric(mujeres2017$region)
mujeres2017$sexo = as.numeric(mujeres2017$sexo)
mujeres2017$edad = as.numeric(mujeres2017$edad)
mujeres2017$s4 = as.numeric(mujeres2017$s4)
mujeres2017$s5 = as.numeric(mujeres2017$s5)
mujeres2017$yoprcor = as.numeric(mujeres2017$yoprcor)
mujeres2017$yoprcorh = as.numeric(mujeres2017$yoprcorh)
mujeres2017$o10 = as.numeric(mujeres2017$o10)
mujeres2017$o26 = as.numeric(mujeres2017$o26)
mujeres2017$e6a = as.numeric(mujeres2017$e6a)

#### 2011 - 2013 ####
#### importa: region, sexo, edad s7, s8, e6a y e6b
columnas_11_13 = c("id", "region", "sexo", "edad", "s7", "s8", "ytrabaj", "ytrabhaj","o10", "o27", "e6a", "e6b")
m11.m13 = data.frame(matrix(nrow = 0,ncol = 12))
colnames(m11.m13) = columnas_11_13

#### 2011-2013
id = 1
contador = 0
for(i in 1:15){
  alternativa1 = filter(mujeres2011,mujeres2011$region == i)
  alternativa3 = filter(mujeres2013,mujeres2013$region == i)
  for(j in 1:length(alternativa1$region)){
    z = 0
    j = alternativa1[j, ]
    for(k in 1:length(alternativa3$region)){
      k = alternativa3[k, ]
      if(j$sexo == k$sexo){
        if(j$edad == k$edad){
          if(j$s7 == 0){
            if(j$s8 == k$s6 - 2){ # contrafactual con hijos
              if(z == 0){
                rbind(m11.m13,j)
                contador = contador + 1
                m11.m13[contador,1] == id
                z = 1
                rbind(m11.m13,k)
                contador = contador + 1
                m11.m13[contador,1] == id
                id = id + 1
              }else{
                rbind(m11.m13,k)
                contador = contador + 1
                m11.m13[contador,1] == id
              }
            }else if(k$s6 == 0){ # contrafactual sin hijos
              if(z == 0){
                rbind(m11.m13,j)
                contador = contador + 1
                m11.m13[contador,1] == id
                z = 1
                rbind(m11.m13,k)
                contador = contador + 1
                m11.m13[contador,1] == id
                id = id + 1
              }else{
                rbind(m11.m13,k)
                contador = contador + 1
                m11.m13[contador,1] == id
              }
            }
          }
        }
      }
    }
  }
}

#contador = 1
#for(i in 1:length(mujeres2011$region)){
#  z = 0
#  i = mujeres2011[i,]
#  for(j in 1:length(mujeres2013$region)){
#    j = mujeres2013[j,]
#    if(i$region == j$region){
#      if(i$sexo == j$sexo){
#        if(i$edad == j$edad - 2){
#          if(i$s7 == 0){
#            if(i$s8 == j$s6 - 2){ # contrafactual con hijos
#              z = 1
#            }else if(j$s6 == 0){   # contrafactual sin hijos
#              z = 2
#            }
#          }
#        }
#      }
#    }
#  }
#  if(z != 0){
    #print(i)
#  }
#}

#View(m11.m13)
