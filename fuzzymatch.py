import pandas as pd

archivo = "Datos_limpios_arreglados/casen_2011.csv"

datos = pd.read_csv(archivo)
df = pd.DataFrame(datos)

print(df.head()["ytrabaj"])

df["ytrabaj"] += 1
df["ytrabhaj"] += 1

print(df.head()["ytrabaj"])

df.to_csv(archivo, index=False)
