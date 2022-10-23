import pandas as pd

df1 = pd.DataFrame(
    [
        ['AA', 10],
        ['BB', 20],
        ['CC', 30],
        ['DD', 40],
    ],
    columns=['ID', 'B'],
)
df2 = pd.DataFrame(
    [
        ['BB', 30, 0],
        ['DD', 35, 0],
    ], columns=['ID', 'C', 'D']
)

df3 = df1.join(df2, )


