import pandas as pd

datos = pd.read_csv("Datos_limpios/casen_2015.csv")
df = pd.DataFrame(datos)
df["nv"] = 99  # nueva variable

#for index_1, row_1 in df.iterrows():
#    for index_2, row_2 in df.iterrows():
#        if row_1["folio"] == row_2["folio"]:
#            if (row_1["o_viv"] == 1 or row_1["o_viv"] == 2) and row_2["o_viv"] == 3:
#                if row_1["nv"] > row_1["edad"] - row_2["edad"]:
#                    row_1["nv"] = row_1["edad"] - row_2["edad"]
#                    print("hijo de ambos")
#            elif (row_1["o_viv"] == 1) and row_2["o_viv"] == 4:
#                if row_1["nv"] > row_1["edad"] - row_2["edad"]:
#                    row_1["nv"] = row_1["edad"] - row_2["edad"]
#                    print("hijo jefe")
#            elif (row_1["o_viv"] == 2) and row_2["o_viv"] == 5:
#                if row_1["nv"] > row_1["edad"] - row_2["edad"]:
#                    row_1["nv"] = row_1["edad"] - row_2["edad"]
#                    print("hijo pareja")

diccionario = {}

for index_1, row_1 in df.iterrows():
    diccionario[row_1["folio"]] = []

for index_1, row_1 in df.iterrows():
    diccionario[row_1["folio"]].append([row_1, index_1])

print("diccionario cargado")

for i in diccionario.keys():     #Hay que ajustarlo para los cuestionarios de distintos años
    for j in diccionario[i]:     # Por ejemplo en 2011 y 2017 los numero indican cosas distintas
        for k in diccionario[i]:
            if (j[0]["pco2"] == 1 or j[0]["pco2"] == 2) and k[0]["pco2"] == 4:
                if j[0]["nv"] > j[0]["edad"] - k[0]["edad"]:
                    df.at[j[1], "nv"] = j[0]["edad"] - k[0]["edad"]
            elif (j[0]["pco2"] == 1) and k[0]["pco2"] == 5:
                if j[0]["nv"] > j[0]["edad"] - k[0]["edad"]:
                    df.at[j[1], "nv"] = j[0]["edad"] - k[0]["edad"]
            elif (j[0]["pco2"] == 2) and k[0]["pco2"] == 6:
                if j[0]["nv"] > j[0]["edad"] - k[0]["edad"]:
                    df.at[j[1], "nv"] = j[0]["edad"] - k[0]["edad"]
df.to_csv("Modelo jefes de hogar/casen_2015.csv", index=False)
