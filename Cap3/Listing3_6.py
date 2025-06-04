# Iterar sobre una lista
frutas = ['manzana', 'banana', 'cereza']
for fruta in frutas:
    print(fruta)

# Iterar usando range()
for i in range(5): # i tomará valores de 0 a 4
    print(i)

# Iterar con índice y valor usando enumerate()
for indice, fruta in enumerate(frutas):
    print(f'Índice {indice}: {fruta}')