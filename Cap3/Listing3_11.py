def potencia(base, exponente=2): # exponente tiene un valor por defecto
    return base ** exponente

print(potencia(3))       # Salida: 9 (usa exponente=2)
print(potencia(3, 3))    # Salida: 27
print(potencia(exponente=4, base=2)) # Argumentos nombrados
                                     # Salida: 16