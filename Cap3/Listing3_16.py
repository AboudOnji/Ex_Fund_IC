import pandas as pd

# Crear un DataFrame desde un diccionario
datos = {'Nombre': ['Ana', 'Luis', 'Eva', 'Juan'],
         'Edad': [28, 34, 29, 42],
         'Ciudad': ['Madrid', 'Barcelona', 'Valencia', 'Sevilla']}
df = pd.DataFrame(datos)

print(df)
print(df['Edad'].mean()) # Media de la columna 'Edad'
print(df[df['Edad'] > 30]) # Filtrar filas