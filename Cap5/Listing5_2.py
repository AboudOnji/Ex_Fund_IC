def calcular_promedio_python(n1, n2, n3):
    
    # Verificar que las entradas sean numéricas (ejemplo básico)
    if not all(isinstance(n, (int, float)) for n in [n1, n2, n3]):
        raise TypeError("Todas las entradas deben ser números.")

    suma_numeros = n1 + n2 + n3
    promedio = suma_numeros / 3
    return promedio

# Ejemplo de uso en Python:
# >>> p = calcular_promedio_python(10, 20, 30)
# >>> print(p)
# 20.0
# >>> print(calcular_promedio_python(5, 7, 9))
# 7.0