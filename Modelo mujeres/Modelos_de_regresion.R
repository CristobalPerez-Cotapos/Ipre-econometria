library(readxl)
BDD <- read_excel("C:/Users/cpere/Desktop/Libros Ingeniería/Sexto semestre/Ipre-econometria/Modelo mujeres/m13_m15.xlsx")

numero_en_mach = vector()
id = 0

for (i in 1:length(BDD$ytrabaj)){
  print(i)
  if (BDD$vector_id[i] == id){
    numero_en_mach = append(numero_en_mach, 1)
  }
  else 
    {
    numero_en_mach = append(numero_en_mach, 0)
    id = id + 1 
    }
}

vector_hijos = vector()
for (i in 1:length(BDD$ytrabaj)){
  print(i)
  if (BDD$nhijos[i] == 0){
    vector_hijos = append(vector_hijos, 0)
  }
  else 
  {
    vector_hijos = append(vector_hijos, 1)
  }
}


modelo = lm(BDD$ytrabaj ~ BDD$nhijos)
summary(modelo)

modelo_2 = lm(BDD$ytrabaj ~ vector_hijos)
summary(modelo_2)

multiplicacion = numero_en_mach * vector_hijos

modelo_3 = lm(BDD$ytrabaj ~ multiplicacion)
summary(modelo_3)

modelo_4 = lm(BDD$ytrabaj ~ multiplicacion + BDD$edad + numero_en_mach + vector_hijos)
summary(modelo_4)

modelo_5 = lm(BDD$ytrabaj ~ multiplicacion + BDD$edad + numero_en_mach
              + vector_hijos + BDD$esc + BDD$horas)
summary(modelo_5)
