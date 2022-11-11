import pandas as pd

archivo = "Modelo jefes de hogar/casen_2017.csv"

datos = pd.read_csv(archivo)
df = pd.DataFrame(datos)


df["yoprcor"] += 1
df["yoprcorh"] += 1


df.to_csv(archivo, index=False)
