for num in range(1, 10):
    if num == 7:
        break # Termina el bucle cuando num es 7
    if num % 2 == 0:
        continue # Salta los números pares
    print(num)
# Salida: 1, 3, 5