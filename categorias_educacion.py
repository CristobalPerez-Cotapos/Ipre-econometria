import pandas as pd

for ano in [2011, 2013, 2015, 2017]:
    print(ano)
    datos = pd.read_csv(f"Modelo jefes de hogar/casen_{ano}.csv")
    df = pd.DataFrame(datos)


    # Esto es para 2011 y 2013
    if ano < 2014:
        df = df.replace({'e6a': {
            1: 1, 2: 1, 3: 1, 4: 1, 5: 1, 6: 1,
            7: 2, 8: 2, 9: 2, 10: 2,
            11: 3, 12: 3,
            13: 4
        }})
    else:
        # Esto es para 2015 y 2017
        df = df.replace({'e6a': {
            1: 1, 2: 1, 3: 1, 4: 1, 5: 1, 6: 1, 7: 1,
            8: 2, 9: 2, 10: 2, 11: 2,
            12: 3, 13: 3, 14: 3, 15: 3,
            16: 4, 17: 4
        }})

    # 1 sería menos que media
    # 2 sería media
    # 3 sería universitaria
    # 4 sería postgrado


    df = df.replace({'nv': {
        99: 0
    }})

    df.to_csv(f"Modelo jefes de hogar/casen_{ano}.csv", index=False)
