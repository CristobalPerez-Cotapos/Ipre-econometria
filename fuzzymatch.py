import pandas as pd


for i in [2011, 2013, 2015, 2017]:
    archivo = f"Modelo jefes de hogar/casen_{i}.csv"

    datos = pd.read_csv(archivo)
    df = pd.DataFrame(datos)

    if i == 2011:
        df["ytrabaj"] += 1
        df["ytrabhaj"] += 1
    else:
        df["yoprcor"] += 1
        df["yoprcorh"] += 1


    df.to_csv(archivo, index=False)
