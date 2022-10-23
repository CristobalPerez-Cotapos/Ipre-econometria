import pandas as pd
import recordlinkage as rl
from recordlinkage.base import BaseIndexAlgorithm


class IndexarEdad(BaseIndexAlgorithm):

    def __init__(self, edad, diferencia):

        super().__init__()
        self.edad = edad
        self.diferencia = diferencia

    def _link_index(self, df_a, df_b):
        print('empezamos')
        a_edad = df_a[df_a['edad'] == self.edad]
        b_edad = df_b[df_b['edad'] == self.edad + self.diferencia]

        index = pd.merge(a_edad, b_edad)
        return index
        #return pd.DataFrame(index=index)




#for j in [2011, 2013, 2015, 2017]:
#    casen = pd.read_csv(f'Modelo jefes de hogar/casen_{j}.csv')
#    for i in range(1,16):
#        datos = casen[casen['region'] == i]
#        datos.to_csv(f'Modelo jefes de hogar/{i}/casen_{j}.csv', index=False)

año_inicial = 2011
año_final = 2013
region = 1

datos_1 = pd.read_csv(f'Datos_limpios_arreglados/{region}/casen_{año_inicial}.csv')
datos_2 = pd.read_csv(f'Datos_limpios_arreglados/{region}/casen_{año_final}.csv')
datos_1 = datos_1[datos_1['sexo'] == 2]
datos_2 = datos_2[datos_2['sexo'] == 2]

print("yay, lectura")

datos_1["edad final"] = datos_1['edad'] + año_final - año_inicial

df = datos_1.merge(datos_2, left_on=['edad final', 'sexo'], right_on=['edad', 'sexo'])

print(df.head())
print(len(df))
