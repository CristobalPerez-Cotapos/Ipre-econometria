import pandas as pd

datos = pd.read_csv("Datos_limpios/casen_2017.csv")
df = pd.DataFrame(datos)
df["nv"] = 99  # nueva variable
diccionario = {}

for index_1, row_1 in df.iterrows():
    diccionario[row_1["folio"]] = []

for index_1, row_1 in df.iterrows():
    diccionario[row_1["folio"]].append([row_1, index_1])

print("diccionario cargado")
print(df.head(5))

for i in diccionario.keys():     #Hay que ajustarlo para los cuestionarios de distintos años
    for j in diccionario[i]:     # Por ejemplo en 2011 y 2017 los numero indican cosas distintas
        for k in diccionario[i]:
            if (j[0]["pco2"] == 1 or j[0]["pco2"] == 2) and k[0]["pco2"] == 3:
                if j[0]["nv"] > j[0]["edad"] - k[0]["edad"]:
                    df.at[j[1], "nv"] = j[0]["edad"] - k[0]["edad"]
                    j[0]["nv"] = j[0]["edad"] - k[0]["edad"]
            elif (j[0]["pco2"] == 1) and k[0]["pco2"] == 4:
                if j[0]["nv"] > j[0]["edad"] - k[0]["edad"]:
                    df.at[j[1], "nv"] = j[0]["edad"] - k[0]["edad"]
                    j[0]["nv"] = j[0]["edad"] - k[0]["edad"]
            elif (j[0]["pco2"] == 2) and k[0]["pco2"] == 5:
                if j[0]["nv"] > j[0]["edad"] - k[0]["edad"]:
                    df.at[j[1], "nv"] = j[0]["edad"] - k[0]["edad"]
                    j[0]["nv"] = j[0]["edad"] - k[0]["edad"]
print(df.head(5))
df.to_csv("Modelo jefes de hogar/casen_2017.csv", index=False)
