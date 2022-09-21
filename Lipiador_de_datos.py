import pandas as pd
import numpy as np

def load_large_dta(fname):
    import sys

    reader = pd.read_stata(fname, iterator=True, convert_categoricals=False)
    df = pd.DataFrame()

    try:
        chunk = reader.get_chunk(100*1000)
        while len(chunk) > 0:
            df = df.append(chunk, ignore_index=False)
            chunk = reader.get_chunk(100*1000)
            print(".")
            sys.stdout.flush()
    except (StopIteration, KeyboardInterrupt):
        pass

    print("\nloaded {} rows".format(len(df)))

    return df

df = load_large_dta("Datos brutos/Casen 2017.dta")

datos_limpios = pd.DataFrame(df, columns=["region", "sexo", "edad", "s4", "s5", "yoprcor", "yoprcorh",
                                          "o10", "o26", "e6a"])
print(datos_limpios.head())
datos_limpios.fillna(0, inplace=True)
print(datos_limpios.head())

datos_limpios.to_csv("casen_2017.csv", index=False)