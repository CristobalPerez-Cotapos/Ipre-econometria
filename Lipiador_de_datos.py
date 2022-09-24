import pandas as pd

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

df = load_large_dta("datos_brutos/casen_2011.dta")

datos_limpios = pd.DataFrame(df, columns=["region", "sexo", "edad", "s7", "s8", "ytrabaj", "ytrabhaj",
                                          "o10", "o27", "e6a", "folio", "ecivil", "pco2"])
datos_limpios.fillna(0, inplace=True)

datos_limpios.to_csv("Datos_limpios/casen_2011.csv", index=False)