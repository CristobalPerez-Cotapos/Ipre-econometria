import pandas as pd

for año in ["2011", "2013", "2015", "2017"]:
    print(año)
    if año == "2011" or año == "2013":
        ambos = 3
        jefe = 4
        pareja = 5

    elif año == "2015" or año == "2017":
        ambos = 4
        jefe = 5
        pareja = 6

    datos = pd.read_csv(f"Datos_limpios/casen_{año}.csv")
    df = pd.DataFrame(datos)
    df["nv"] = 99  # nueva variable
    diccionario = {}

    for index_1, row_1 in df.iterrows():
        diccionario[row_1["folio"], row_1["nucleo"]] = []

    for index_1, row_1 in df.iterrows():
        diccionario[row_1["folio"], row_1["nucleo"]].append([row_1, index_1])

    print("diccionario cargado")
    print(df.head(5))

    for i in diccionario.keys():     #Hay que ajustarlo para los cuestionarios de distintos años
        for j in diccionario[i]:     # Por ejemplo en 2011 y 2017 los numero indican cosas distintas
            for k in diccionario[i]:
                if (j[0]["pco2"] == 1 or j[0]["pco2"] == 2) and k[0]["pco2"] == ambos:
                    if j[0]["nv"] > j[0]["edad"] - k[0]["edad"]:
                        df.at[j[1], "nv"] = j[0]["edad"] - k[0]["edad"]
                        j[0]["nv"] = j[0]["edad"] - k[0]["edad"]
                elif (j[0]["pco2"] == 1) and k[0]["pco2"] == jefe:
                    if j[0]["nv"] > j[0]["edad"] - k[0]["edad"]:
                        df.at[j[1], "nv"] = j[0]["edad"] - k[0]["edad"]
                        j[0]["nv"] = j[0]["edad"] - k[0]["edad"]
                elif (j[0]["pco2"] == 2) and k[0]["pco2"] == pareja:
                    if j[0]["nv"] > j[0]["edad"] - k[0]["edad"]:
                        df.at[j[1], "nv"] = j[0]["edad"] - k[0]["edad"]
                        j[0]["nv"] = j[0]["edad"] - k[0]["edad"]
    print(df.head(5))
    df.to_csv(f"Modelo jefes de hogar/casen_{año}.csv", index=False)
