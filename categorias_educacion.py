import pandas as pd

datos = pd.read_csv("Modelo jefes de hogar/casen_2017.csv")
df = pd.DataFrame(datos)

df = df.replace({'e6a': {
    1: 1, 2: 1, 3: 1, 4: 1, 5: 1, 6: 1, 7: 1,
    8: 2, 9: 2, 10: 2, 11: 2,
    12: 3, 13: 3, 14: 3, 15: 3,
    16: 4, 17: 4
}})

df = df.replace({'nv': {
    99: 0
}})

# 1 sería menos que media
# 2 sería media
# 3 sería universitaria
# 4 sería postgrado

df.to_csv("Modelo jefes de hogar/casen_2017.csv", index=False)
