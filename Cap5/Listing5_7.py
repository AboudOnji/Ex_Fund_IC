def funcion_objetivo(x):
    return -(x - 2)**2 # Maximizar -(x-2)^2, óptimo en x=2

def obtener_vecino(x_actual, paso):
    # Genera un vecino aleatorio sumando o restando un pequeño paso
    if random.random() < 0.5:
        return x_actual + paso
    else:
        return x_actual - paso

def hill_climbing(iteraciones_max, paso_inicial):
    actual_x = random.uniform(-5, 5) # Punto de inicio aleatorio
    actual_valor = funcion_objetivo(actual_x)
    
    for _ in range(iteraciones_max):
        vecino_x = obtener_vecino(actual_x, paso_inicial)
        vecino_valor = funcion_objetivo(vecino_x)
        
        if vecino_valor > actual_valor:
            actual_x = vecino_x
            actual_valor = vecino_valor
            # Opcional: reducir el tamaño del paso con el tiempo
    return actual_x, actual_valor