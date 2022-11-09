library(dplyr)
library(readxl)
library(openxlsx)

casen_2011 <- read.csv("C:/Users/trini/OneDrive/Escritorio/GITHUB COSAS/Ipre-econometria/Modelo jefes de hogar/casen_2011.csv", header=FALSE)
casen_2013 <- read.csv("C:/Users/trini/OneDrive/Escritorio/GITHUB COSAS/Ipre-econometria/Modelo jefes de hogar/casen_2013.csv", header=FALSE)
casen_2015 <- read.csv("C:/Users/trini/OneDrive/Escritorio/GITHUB COSAS/Ipre-econometria/Modelo jefes de hogar/casen_2015.csv", header=FALSE)
casen_2017 <- read.csv("C:/Users/trini/OneDrive/Escritorio/GITHUB COSAS/Ipre-econometria/Modelo jefes de hogar/casen_2017.csv", header=FALSE)

View(casen_2011)
View(casen_2013)
View(casen_2015)
View(casen_2017)

c11 = c("region", "sexo", "edad", "nhijos", "ephijo","ytrabaj", "ytrabajh","horas","tsec","esc","folio", "ecivil", "parentesco","ephijoh")
colnames(casen_2011) = c11
colnames(casen_2013) = c11
casen_2011 = casen_2011[-1,]
casen_2013 = casen_2013[-1,]
#### colnames(casen_2015) = c11
colnames(casen_2017) = c11
#### casen_2015 = casen_2015[-1,]
casen_2017 = casen_2017[-1,]

View(casen_2011)
View(casen_2013)
#View(casen_2015)
View(casen_2017)

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
casen_2011$folio = as.numeric(casen_2011$folio)
casen_2011$ecivil = as.numeric(casen_2011$ecivil)
casen_2011$parentesco = as.numeric(casen_2011$parentesco)
casen_2011$ephijoh = as.numeric(casen_2011$ephijoh)
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
casen_2013$folio = as.numeric(casen_2013$folio)
casen_2013$ecivil = as.numeric(casen_2013$ecivil)
casen_2013$parentesco = as.numeric(casen_2013$parentesco)
casen_2013$ephijoh = as.numeric(casen_2013$ephijoh)
#casen_2015$region = as.numeric(casen_2015$region)
#casen_2015$sexo = as.numeric(casen_2015$sexo)
#casen_2015$edad = as.numeric(casen_2015$edad)
#casen_2015$nhijos = as.numeric(casen_2015$nhijos)
#casen_2015$ephijo = as.numeric(casen_2015$ephijo)
#casen_2015$ytrabaj = as.numeric(casen_2015$ytrabaj)
#casen_2015$ytrabajh = as.numeric(casen_2015$ytrabajh)
#casen_2015$horas = as.numeric(casen_2015$horas)
#casen_2015$tsec = as.numeric(casen_2015$tsec)
#casen_2015$esc = as.numeric(casen_2015$esc)
#casen_2015$folio = as.numeric(casen_2015$folio)
#casen_2015$ecivil = as.numeric(casen_2015$ecivil)
#casen_2015$parentesco = as.numeric(casen_2015$parentesco)
#casen_2015$ephijoh = as.numeric(casen_2015$ephijoh)
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
casen_2017$folio = as.numeric(casen_2017$folio)
casen_2017$ecivil = as.numeric(casen_2017$ecivil)
casen_2017$parentesco = as.numeric(casen_2017$parentesco)
casen_2017$ephijoh = as.numeric(casen_2017$ephijoh)

#### Quitamos valores NA
casen_2011 = na.omit(casen_2011)
casen_2013 = na.omit(casen_2013)
#casen_2015 = na.omit(casen_2015)
casen_2017 = na.omit(casen_2017)

hombres_2011 = filter(casen_2011,casen_2011$nhijos != 99.0, casen_2011$sexo == 1)
hombres_2013 = filter(casen_2013,casen_2013$nhijos != 99.0, casen_2013$sexo == 1)
#hombres_2015 = filter(casen_2015,casen_2015$nhijos != 99.0, casen_2015$sexo == 1)
hombres_2017 = filter(casen_2017,casen_2017$nhijos != 99.0, casen_2017$sexo == 1)

dim.data.frame(hombres_2011)
dim.data.frame(hombres_2013)
#dim.data.frame(hombres_2015)
dim.data.frame(hombres_2017)

View(hombres_2011)
View(hombres_2013)
#View(hombres_2015)
View(hombres_2017)


# 2011 - 2013 -------------------------------------------------------------
h11_h13 = data.frame(matrix(nrow = 0,ncol = 15))
colnames(h11_h13) = c11

id = 0
vector_id = c()

for(i in 1:15){
  for(h in 1:4){
    alternativa1 = filter(hombres_2011,hombres_2011$region == i,hombres_2011$nhijos == 0,hombres_2011$edad > 9,hombres_2011$esc == h)
    alternativa3 = filter(hombres_2013,hombres_2013$region == i,hombres_2013$edad > 9, hombres_2013$esc == h)
    #print(vector_id)
    #print(id)
    View(h11_h13)
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
                      h11_h13 = rbind(h11_h13,j)
                      vector_id = append(vector_id,id)
                      z = 1
                      h11_h13 = rbind(h11_h13,k)
                      vector_id = append(vector_id,id)
                      cantidad_match_con = cantidad_match_con + 1
                    }else{ # ya tenemos otros match
                      h11_h13 = rbind(h11_h13,k)
                      vector_id = append(vector_id,id)
                      cantidad_match_con = cantidad_match_con + 1
                    }
                  }  
                }else if(cantidad_match_sin < 2){ # contrafactual sin hijos
                  if(k$nhijos == 0){
                    if(z == 0){ # agregamos primer match
                      id = id + 1
                      h11_h13 = rbind(h11_h13,j)
                      vector_id = append(vector_id,id)
                      z = 1
                      h11_h13 = rbind(h11_h13,k)
                      vector_id = append(vector_id,id)
                      cantidad_match_sin = cantidad_match_sin + 1
                    }else{ # ya tenemos otros match
                      h11_h13 = rbind(h11_h13,k)
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


h11_h13 = cbind(h11_h13, vector_id)
View(h11_h13)
write.xlsx(h11_h13,file = "h11_h13.xlsx")


# 2013 - 2015 -------------------------------------------------------------

h13_h15 = data.frame(matrix(nrow = 0,ncol = 15))
colnames(h13_h15) = c11

id = 0
vector_id = c()

for(i in 1:15){
  for(h in 1:4){
    alternativa3 = filter(hombres_2013,hombres_2013$region == i,hombres_2013$nhijos == 0,hombres_2013$edad > 9,hombres_2013$esc == h)
    alternativa5 = filter(hombres_2015,hombres_2015$region == i,hombres_2015$edad > 9, hombres_2015$esc == h)
    #print(vector_id)
    #print(id)
    View(h13_h15)
    for(j in 1:length(alternativa3$region)){
      z = 0
      #print(paste("j es:", j))
      cantidad_match_con = 0
      cantidad_match_sin = 0
      print(id)
      j = alternativa3[j, ]
      for(k in 1:length(alternativa5$region)){
        #print(paste("k es:", k))
        k = alternativa5[k, ]
        if(j$edad == k$edad - 2){ # acá iba j$sexo == k$sexo
          if(j$edad == k$edad - 2){
            if(j$esc == k$esc || j$esc == k$esc - 1){
              if(j$nhijos == 0){
                if(cantidad_match_con < 2){ # contrafactual con hijos
                  if(k$nhijos > 0){
                    if(z == 0){ # agregamos primer match
                      id = id + 1
                      h13_h15 = rbind(h13_h15,j)
                      vector_id = append(vector_id,id)
                      z = 1
                      h13_h15 = rbind(h13_h15,k)
                      vector_id = append(vector_id,id)
                      cantidad_match_con = cantidad_match_con + 1
                    }else{ # ya tenemos otros match
                      h13_h15 = rbind(h13_h15,k)
                      vector_id = append(vector_id,id)
                      cantidad_match_con = cantidad_match_con + 1
                    }
                  }  
                }else if(cantidad_match_sin < 2){ # contrafactual sin hijos
                  if(k$nhijos == 0){
                    if(z == 0){ # agregamos primer match
                      id = id + 1
                      h13_h15 = rbind(h13_h15,j)
                      vector_id = append(vector_id,id)
                      z = 1
                      h13_h15 = rbind(h13_h15,k)
                      vector_id = append(vector_id,id)
                      cantidad_match_sin = cantidad_match_sin + 1
                    }else{ # ya tenemos otros match
                      h13_h15 = rbind(h13_h15,k)
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


h13_h15 = cbind(h13_h15, vector_id)
View(h13_h15)
write.xlsx(h13_h15,file = "h13_h15.xlsx")


# 2015 - 2017 -------------------------------------------------------------
h15_h17 = data.frame(matrix(nrow = 0,ncol = 15))
colnames(h15_h17) = c11

id = 0
vector_id = c()

for(i in 1:15){
  for(h in 1:4){
    alternativa5 = filter(hombres_2015,hombres_2015$region == i,hombres_2015$nhijos == 0,hombres_2015$edad > 9,hombres_2015$esc == h)
    alternativa7 = filter(hombres_2017,hombres_2017$region == i,hombres_2017$edad > 9, hombres_2017$esc == h)
    #print(vector_id)
    #print(id)
    View(h15_h17)
    for(j in 1:length(alternativa5$region)){
      z = 0
      #print(paste("j es:", j))
      cantidad_match_con = 0
      cantidad_match_sin = 0
      print(id)
      j = alternativa5[j, ]
      for(k in 1:length(alternativa7$region)){
        #print(paste("k es:", k))
        k = alternativa7[k, ]
        if(j$edad == k$edad - 2){ # acá iba j$sexo == k$sexo
          if(j$edad == k$edad - 2){
            if(j$esc == k$esc || j$esc == k$esc - 1){
              if(j$nhijos == 0){
                if(cantidad_match_con < 2){ # contrafactual con hijos
                  if(k$nhijos > 0){
                    if(z == 0){ # agregamos primer match
                      id = id + 1
                      h15_h17 = rbind(h15_h17,j)
                      vector_id = append(vector_id,id)
                      z = 1
                      h15_h17 = rbind(h15_h17,k)
                      vector_id = append(vector_id,id)
                      cantidad_match_con = cantidad_match_con + 1
                    }else{ # ya tenemos otros match
                      h15_h17 = rbind(h15_h17,k)
                      vector_id = append(vector_id,id)
                      cantidad_match_con = cantidad_match_con + 1
                    }
                  }  
                }else if(cantidad_match_sin < 2){ # contrafactual sin hijos
                  if(k$nhijos == 0){
                    if(z == 0){ # agregamos primer match
                      id = id + 1
                      h15_h17 = rbind(h15_h17,j)
                      vector_id = append(vector_id,id)
                      z = 1
                      h15_h17 = rbind(h15_h17,k)
                      vector_id = append(vector_id,id)
                      cantidad_match_sin = cantidad_match_sin + 1
                    }else{ # ya tenemos otros match
                      h15_h17 = rbind(h15_h17,k)
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


h15_h17 = cbind(h15_h17, vector_id)
View(h15_h17)
write.xlsx(h15_h17,file = "h15_h17.xlsx")

