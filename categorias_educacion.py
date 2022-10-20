import pandas as pd

datos = pd.read_csv("Modelo jefes de hogar/casen_2011.csv")
df = pd.DataFrame(datos)

df = df.replace({'e6a': {
    1: 1, 2: 1, 3: 1, 4: 1, 5: 1, 6: 1,
    7: 2, 8: 2, 9: 2, 10: 2,
    11: 3, 12: 3,
    13: 4
}})

# 1 sería menos que media
# 2 sería media
# 3 sería universitaria
# 4 sería postgrado

df.to_csv("Modelo jefes de hogar/casen_2011.csv", index=False)
