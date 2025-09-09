import numpy as np

def rosenbrock(x):
    return 100 * (x[1] - x[0]**2)**2 + (1 - x[0])**2

# --- Parámetros ---
n_vars = 2        # Número de variables de decisión
n_gens = 1000     # Número de generaciones
sigma = 0.5       # Desviación estándar inicial de la mutación

# --- Algoritmo (1+1)-ES ---
# Inicialización
padre_x = np.random.uniform(-2.048, 2.048, n_vars)
padre_aptitud = rosenbrock(padre_x)
print(f'Inicial -> x: {padre_x}, aptitud: {padre_aptitud:.4f}')

for gen in range(n_gens):
    # Mutación
    hijo_x = padre_x + np.random.normal(0, sigma, n_vars)
    # Asegurarse de que el hijo esté dentro de los límites (clipping simple)
    hijo_x = np.clip(hijo_x, -2.048, 2.048)
    
    # Evaluación
    hijo_aptitud = rosenbrock(hijo_x)
    
    # Selección (determinista, extintiva para el peor)
    if hijo_aptitud < padre_aptitud:
        padre_x = hijo_x
        padre_aptitud = hijo_aptitud
        
print(f'Final -> x: {padre_x}, aptitud: {padre_aptitud:.4f}')