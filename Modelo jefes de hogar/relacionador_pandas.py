import pandas as pd
import warnings
warnings.simplefilter(action='ignore', category=FutureWarning)


def col_names(año, datos):
    if año < 2014:
        datos.columns = ["region", "sexo", "edad", "nhijos", "ephijo",
                        "ytrabaj", "ytrabajh", "horas", "tsec", "esc"
                        , "folio", "ecivil", "pco2", "nucleo", "nv"]
    else:
        datos.columns = ["region", "sexo", "edad", "nhijos", "ephijo",
                        "ytrabaj", "ytrabajh", "horas", "tsec", "esc"
                        , "folio", "ecivil", "pco2", "nucleo", "nv"]
    datos = datos[["region", "sexo", "edad", "nhijos", "ephijo",
                    "ytrabaj", "ytrabajh", "horas", "tsec", "esc"
                    , "ecivil", "nv"]]
    return datos


def relacionador(año_1, año_2, sexo):
    archivo_1 = f"casen_{año_1}.csv"
    archivo_2 = f"casen_{año_2}.csv"
    datos_1 = pd.read_csv(archivo_1)
    datos_2 = pd.read_csv(archivo_2)

    datos_1 = col_names(año_1, datos_1)
    datos_2 = col_names(año_2, datos_2)

    mujeres_1 = datos_1[datos_1['sexo'] == sexo]
    mujeres_2 = datos_2[datos_2['sexo'] == sexo]

    print(mujeres_1.head())
    print(mujeres_2.head())

    resultado = pd.DataFrame(columns=["region", "sexo", "edad", "nhijos", "ephijo",
                                      "ytrabaj", "ytrabajh", "horas", "tsec", "esc"
                                      , "folio", "ecivil", "pco2", "nucleo", "nv"])

    id = 1
    for i in range(15):
        for h in range(4):
            alternativa_1 = mujeres_1.query(f'(region == {i + 1}) & (esc == {h + 1})'
                                            f' & (nhijos == 0) & (edad > 9)')
            alternativa_2 = mujeres_1.query(f'(region == {i + 1})  &  (edad > 15)')
            print("resultados")
            print(i, h)
            for index_1, j in alternativa_1.iterrows():
                alternativa_3 = alternativa_2.query(f'(edad == {j["edad"] + (año_2 - año_1)})  '
                                                    f'& (esc == {j["esc"]} | esc == {j["esc"]} + 1)'
                                                    f'& (nv >= {j["edad"]})')
                alternativa_4 = alternativa_2.query(f'(edad == {j["edad"] + (año_2 - año_1)})  '
                                                    f'& (esc == {j["esc"]} | esc == {j["esc"]} + 1)'
                                                    f'& (nhijos == 0)')

                original = j
                original["id"] = id

                if len(alternativa_3) >= 2:
                    con_hijos = alternativa_3.sample(n=2)
                    con_hijos["id"] = id
                else:
                    con_hijos = alternativa_3.sample(n=len(alternativa_3))
                    con_hijos["id"] = id

                if len(alternativa_4) >= 2:
                    sin_hijos = alternativa_4.sample(n=2)
                    sin_hijos["id"] = id
                else:
                    sin_hijos = alternativa_4.sample(n=len(alternativa_4))
                    sin_hijos["id"] = id

                resultado = resultado.append(original)
                resultado = resultado.append(con_hijos, ignore_index=True)
                resultado = resultado.append(sin_hijos, ignore_index=True)

                print(id)
                id += 1

    resultado.to_csv(f"{año_1}_{año_2}_sexo{sexo}.csv", index=False)


relacionador(2011, 2013, 1)
relacionador(2013, 2015, 1)
relacionador(2015, 2017, 1)
relacionador(2011, 2015, 1)
relacionador(2011, 2017, 1)
relacionador(2013, 2017, 1)
