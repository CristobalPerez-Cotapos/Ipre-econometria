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

for año in ["2011", "2013", "2015", "2017"]:
    print(año)
    if año == "2011":
        lista = ["region", "sexo", "edad", "s7", "s8", "ytrabaj", "ytrabhaj",
                 "o10", "o27", "e6a", "folio", "ecivil", "pco2", "nucleo"]
    elif año == "2013":
        lista = ["region", "sexo", "edad", "s5", "s6", "yoprcor", "yoprcorh",
                 "o10", "o27", "e6a", "folio", "ecivil", "pco2", "nucleo"]
    elif año == "2015":
        lista = ["region", "sexo", "edad", "s4", "s5", "yoprcor", "yoprcorh",
                 "o10", "o26", "e6a", "folio", "ecivil", "pco2", "nucleo"]
    elif año == "2017":
        lista = ["region", "sexo", "edad", "s4", "s5", "yoprcor", "yoprcorh",
                 "o10", "o26", "e6a", "folio", "ecivil", "pco2", "nucleo"]

    df = load_large_dta(f"datos_brutos/casen_{año}.dta")

    datos_limpios = pd.DataFrame(df, columns=lista)
    datos_limpios.fillna(0, inplace=True)

    datos_limpios.to_csv(f"Datos_limpios/casen_{año}.csv", index=False)
