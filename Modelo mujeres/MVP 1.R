library(dplyr)
library(readxl)

casen_2011 <- read.csv("C:/Users/trini/OneDrive/Escritorio/GITHUB COSAS/Ipre-econometria/Datos_limpios_arreglados/casen_2011.csv", header=FALSE)
casen_2013 <- read.csv("C:/Users/trini/OneDrive/Escritorio/GITHUB COSAS/Ipre-econometria/Datos_limpios_arreglados/casen_2013.csv", header=FALSE)
casen_2015 <- read.csv("C:/Users/trini/OneDrive/Escritorio/GITHUB COSAS/Ipre-econometria/Datos_limpios_arreglados/casen_2015.csv", header=FALSE)
casen_2017 <- read.csv("C:/Users/trini/OneDrive/Escritorio/GITHUB COSAS/Ipre-econometria/Datos_limpios_arreglados/casen_2017.csv", header=FALSE)

c11 = c("region", "sexo", "edad", "nhijos", "ephijo","ytrabaj", "ytrabajh","horas","tsec","esc","filo")
colnames(casen_2011) = c11
colnames(casen_2013) = c11
casen_2011 = casen_2011[-1,]
casen_2013 = casen_2013[-1,]
casen_2011 = casen_2011[,-11]
casen_2013 = casen_2013[,-11]

c15 = c("region", "sexo", "edad", "nhijos", "ephijo","ytrabaj", "ytrabajh","horas","tsec","esc")
colnames(casen_2015) = c15
colnames(casen_2017) = c15
casen_2015 = casen_2015[-1,]
casen_2017 = casen_2017[-1,]

casen_2011$region = as.numeric(casen_2011$region)
casen_2011$sexo = as.numeric(casen_2011$sexo)
casen_2011$edad = as.numeric(casen_2011$edad)
casen_2011$nhijos = as.numeric(casen_2011$nhijos)
casen_2011$ephijo = as.numeric(casen_2011$ephijo)
casen_2011$ytrabaj = as.numeric(casen_2011$ytrabaj)
casen_2011$ytrabajh = as.numeric(casen_2011$ytrabajh)
casen_2011$horas = as.numeric(casen_2011$horas)
casen_2011$tsec = as.numeric(casen_2011$tsec)
casen_2011$esc = as.numeric(casen_2011$esc)
casen_2013$region = as.numeric(casen_2013$region)
casen_2013$sexo = as.numeric(casen_2013$sexo)
casen_2013$edad = as.numeric(casen_2013$edad)
casen_2013$nhijos = as.numeric(casen_2013$nhijos)
casen_2013$ephijo = as.numeric(casen_2013$ephijo)
casen_2013$ytrabaj = as.numeric(casen_2013$ytrabaj)
casen_2013$ytrabajh = as.numeric(casen_2013$ytrabajh)
casen_2013$horas = as.numeric(casen_2013$horas)
casen_2013$tsec = as.numeric(casen_2013$tsec)
casen_2013$esc = as.numeric(casen_2013$esc)
casen_2015$region = as.numeric(casen_2015$region)
casen_2015$sexo = as.numeric(casen_2015$sexo)
casen_2015$edad = as.numeric(casen_2015$edad)
casen_2015$nhijos = as.numeric(casen_2015$nhijos)
casen_2015$ephijo = as.numeric(casen_2015$ephijo)
casen_2015$ytrabaj = as.numeric(casen_2015$ytrabaj)
casen_2015$ytrabajh = as.numeric(casen_2015$ytrabajh)
casen_2015$horas = as.numeric(casen_2015$horas)
casen_2015$tsec = as.numeric(casen_2015$tsec)
casen_2015$esc = as.numeric(casen_2015$esc)
casen_2017$region = as.numeric(casen_2017$region)
casen_2017$sexo = as.numeric(casen_2017$sexo)
casen_2017$edad = as.numeric(casen_2017$edad)
casen_2017$nhijos = as.numeric(casen_2017$nhijos)
casen_2017$ephijo = as.numeric(casen_2017$ephijo)
casen_2017$ytrabaj = as.numeric(casen_2017$ytrabaj)
casen_2017$ytrabajh = as.numeric(casen_2017$ytrabajh)
casen_2017$horas = as.numeric(casen_2017$horas)
casen_2017$tsec = as.numeric(casen_2017$tsec)
casen_2017$esc = as.numeric(casen_2017$esc)

# datos <- na.omit(datos)

#### Quitamos valores NA
casen_2011 = na.omit(casen_2011)
casen_2013 = na.omit(casen_2013)
casen_2015 = na.omit(casen_2015)
casen_2017 = na.omit(casen_2017)
#### Trabajamos con mujeres sin trabajo secundario
#### arreglo: Quitamos los que no saben cuántos hijos tiene####
mujeres_2011 = filter(casen_2011,casen_2011$nhijos != 99.0, casen_2011$sexo == 2)
mujeres_2013 = filter(casen_2013,casen_2013$nhijos != 99.0, casen_2013$sexo == 2)
mujeres_2015 = filter(casen_2015,casen_2015$nhijos != 99.0, casen_2015$sexo == 2)
mujeres_2017 = filter(casen_2017,casen_2017$nhijos != 99.0, casen_2017$sexo == 2)

dim.data.frame(mujeres_2011)
dim.data.frame(mujeres_2013)
dim.data.frame(mujeres_2015)
dim.data.frame(mujeres_2017)

View(mujeres_2011)
View(mujeres_2013)
View(mujeres_2015)
View(mujeres_2017)

# Yitg=g*DitEvent+g*DitAge+g*DitYear+itg
#casen_2011 = filter(casen_2011$sexo == )

#### 2011 - 2013 ####
#### importa: region, sexo, edad nhijos, ephijo, esc y e6b
m11_m13 = data.frame(matrix(nrow = 0,ncol = 11))
colnames(m11_m13) = c15

#### 2011-2013
id = 0
vector_id = c()

for(i in 1:15){
  for(h in 1:4){
    alternativa1 = filter(mujeres_2011,mujeres_2011$region == i,mujeres_2011$nhijos == 0,mujeres_2011$edad > 9,mujeres_2011$esc == h)
    alternativa3 = filter(mujeres_2013,mujeres_2013$region == i,mujeres_2013$edad > 9, mujeres_2013$esc == h)
    #print(vector_id)
    #print(id)
    View(m11_m13)
    for(j in 1:length(alternativa1$region)){
      z = 0
      #print(paste("j es:", j))
      cantidad_match_con = 0
      cantidad_match_sin = 0
      print(id)
      j = alternativa1[j, ]
      for(k in 1:length(alternativa3$region)){
        #print(paste("k es:", k))
        k = alternativa3[k, ]
        if(j$edad == k$edad - 2){ # acá iba j$sexo == k$sexo
          if(j$edad == k$edad - 2){
            if(j$esc == k$esc || j$esc == k$esc - 1){
              if(j$nhijos == 0){
                if(cantidad_match_con < 2){ # contrafactual con hijos
                  if(k$nhijos > 0){
                    if(z == 0){ # agregamos primer match
                      id = id + 1
                      m11_m13 = rbind(m11_m13,j)
                      vector_id = append(vector_id,id)
                      z = 1
                      m11_m13 = rbind(m11_m13,k)
                      vector_id = append(vector_id,id)
                      cantidad_match_con = cantidad_match_con + 1
                    }else{ # ya tenemos otros match
                      m11_m13 = rbind(m11_m13,k)
                      vector_id = append(vector_id,id)
                      cantidad_match_con = cantidad_match_con + 1
                    }
                  }  
                }else if(cantidad_match_sin < 2){ # contrafactual sin hijos
                  if(k$nhijos == 0){
                    if(z == 0){ # agregamos primer match
                      id = id + 1
                      m11_m13 = rbind(m11_m13,j)
                      vector_id = append(vector_id,id)
                      z = 1
                      m11_m13 = rbind(m11_m13,k)
                      vector_id = append(vector_id,id)
                      cantidad_match_sin = cantidad_match_sin + 1
                    }else{ # ya tenemos otros match
                      m11_m13 = rbind(m11_m13,k)
                      vector_id = append(vector_id,id)
                      cantidad_match_sin = cantidad_match_sin + 1
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }  
}


m11_m13 = cbind(m11_m13, vector_id)
View(m11_m13)
write.csv(m11_m13,"m11m13.csv")


m13_m15 = data.frame(matrix(nrow = 0,ncol = 11))
colnames(m13_m15) = c15

#### 2013-2015
id = 0
vector_id = c()

for(i in 1:15){
  for(h in 1:4){
    alternativa3 = filter(mujeres_2013,mujeres_2013$region == i,mujeres_2013$nhijos == 0,mujeres_2013$edad > 9,mujeres_2013$esc == h)
    alternativa5 = filter(mujeres_2015,mujeres_2015$region == i,mujeres_2015$edad > 9, mujeres_2015$esc == h)
    #print(vector_id)
    #print(id)
    View(m13_m15)
    for(j in 1:length(alternativa3$region)){
      z = 0
      print(paste("j es:", j))
      cantidad_match_con = 0
      cantidad_match_sin = 0
      print(id)
      j = alternativa3[j, ]
      for(k in 1:length(alternativa5$region)){
        print(paste("k es:", k))
        k = alternativa5[k, ]
        if(j$edad == k$edad - 2){ # acá iba j$sexo == k$sexo
          if(j$edad == k$edad - 2){
            if(j$esc == k$esc || j$esc == k$esc - 1){
              if(j$nhijos == 0){
                if(cantidad_match_con < 2){ # contrafactual con hijos
                  if(k$nhijos > 0){
                    if(z == 0){ # agregamos primer match
                      id = id + 1
                      m13_m15 = rbind(m13_m15,j)
                      vector_id = append(vector_id,id)
                      z = 1
                      m13_m15 = rbind(m13_m15,k)
                      vector_id = append(vector_id,id)
                      cantidad_match_con = cantidad_match_con + 1
                    }else{ # ya tenemos otros match
                      m13_m15 = rbind(m13_m15,k)
                      vector_id = append(vector_id,id)
                      cantidad_match_con = cantidad_match_con + 1
                    }
                  }  
                }else if(cantidad_match_sin < 2){ # contrafactual sin hijos
                  if(k$nhijos == 0){
                    if(z == 0){ # agregamos primer match
                      id = id + 1
                      m13_m15 = rbind(m13_m15,j)
                      vector_id = append(vector_id,id)
                      z = 1
                      m13_m15 = rbind(m13_m15,k)
                      vector_id = append(vector_id,id)
                      cantidad_match_sin = cantidad_match_sin + 1
                    }else{ # ya tenemos otros match
                      m13_m15 = rbind(m13_m15,k)
                      vector_id = append(vector_id,id)
                      cantidad_match_sin = cantidad_match_sin + 1
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }  
}


m13_m15 = cbind(m13_m15, vector_id)
write.csv(m13_m15,"m13m15.csv")



m15_m17 = data.frame(matrix(nrow = 0,ncol = 11))
colnames(m15_m17) = c15

#### 2015-2017
id = 0
vector_id = c()

for(i in 1:15){
  for(h in 1:4){
    alternativa5 = filter(mujeres_2015,mujeres_2015$region == i,mujeres_2015$nhijos == 0,mujeres_2015$edad > 9,mujeres_2015$esc == h)
    alternativa7 = filter(mujeres_2017,mujeres_2017$region == i,mujeres_2017$edad > 9, mujeres_2017$esc == h)
    #print(vector_id)
    #print(id)
    View(m15_m17)
    for(j in 1:length(alternativa5$region)){
      z = 0
      print(paste("j es:", j))
      cantidad_match_con = 0
      cantidad_match_sin = 0
      print(id)
      j = alternativa5[j, ]
      for(k in 1:length(alternativa7$region)){
        print(paste("k es:", k))
        k = alternativa7[k, ]
        if(j$edad == k$edad - 2){ # acá iba j$sexo == k$sexo
          if(j$edad == k$edad - 2){
            if(j$esc == k$esc || j$esc == k$esc - 1){
              if(j$nhijos == 0){
                if(cantidad_match_con < 2){ # contrafactual con hijos
                  if(k$nhijos > 0){
                    if(z == 0){ # agregamos primer match
                      id = id + 1
                      m15_m17 = rbind(m15_m17,j)
                      vector_id = append(vector_id,id)
                      z = 1
                      m15_m17 = rbind(m15_m17,k)
                      vector_id = append(vector_id,id)
                      cantidad_match_con = cantidad_match_con + 1
                    }else{ # ya tenemos otros match
                      m15_m17 = rbind(m15_m17,k)
                      vector_id = append(vector_id,id)
                      cantidad_match_con = cantidad_match_con + 1
                    }
                  }  
                }else if(cantidad_match_sin < 2){ # contrafactual sin hijos
                  if(k$nhijos == 0){
                    if(z == 0){ # agregamos primer match
                      id = id + 1
                      m15_m17 = rbind(m15_m17,j)
                      vector_id = append(vector_id,id)
                      z = 1
                      m15_m17 = rbind(m15_m17,k)
                      vector_id = append(vector_id,id)
                      cantidad_match_sin = cantidad_match_sin + 1
                    }else{ # ya tenemos otros match
                      m15_m17 = rbind(m15_m17,k)
                      vector_id = append(vector_id,id)
                      cantidad_match_sin = cantidad_match_sin + 1
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }  
}


m15_m17 = cbind(m15_m17, vector_id)
write.csv(m15_m17,"m15m17.csv")

##### write.csv(df, "mi_df.csv") #####
#The RStudio console returns the error message "Error in match.names(clabs, 
#names(xi)) : names do not match previous names".
#The reason for this is that the column names of the first and the second data 
#frame are not the same.

