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

View(casen2011) # lista
View(casen2013) # lista
View(casen2015) # lista
View(casen2017) # lista

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

