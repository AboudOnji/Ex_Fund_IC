def sumar(a, b):
    '''Devuelve la suma de a y b.'''
    return a + b

resultado = sumar(5, 3)
print(resultado) # Salida: 8

# Funciones pueden devolver múltiples valores (como una tupla)
def dividir_y_resto(dividendo, divisor):
    cociente = dividendo // divisor
    resto = dividendo % divisor
    return cociente, resto

c, r = dividir_y_resto(10, 3)
print(f'Cociente: {c}, Resto: {r}') # Cociente: 3, Resto: 1