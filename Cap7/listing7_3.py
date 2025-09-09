import random

def one_point_crossover(p1, p2):
    """Realiza un cruce de un punto entre dos padres."""
    # Asegurarse de que los padres tengan la misma longitud
    assert len(p1) == len(p2), "Los padres deben tener la misma longitud"
    
    # Seleccionar un punto de cruce aleatorio (excluyendo los extremos)
    crossover_point = random.randint(1, len(p1) - 1)
    
    # Crear los hijos intercambiando los segmentos
    child1 = p1[:crossover_point] + p2[crossover_point:]
    child2 = p2[:crossover_point] + p1[crossover_point:]
    
    return child1, child2

def two_point_crossover(p1, p2):
    """Realiza un cruce de dos puntos entre dos padres."""
    assert len(p1) == len(p2), "Los padres deben tener la misma longitud"
    
    # Seleccionar dos puntos de cruce distintos y ordenarlos
    point1 = random.randint(1, len(p1) - 1)
    point2 = random.randint(1, len(p1) - 1)
    
    start = min(point1, point2)
    end = max(point1, point2)
    
    # Crear los hijos intercambiando el segmento central
    child1 = p1[:start] + p2[start:end] + p1[end:]
    child2 = p2[:start] + p1[start:end] + p2[end:]
    
    return child1, child2

def uniform_crossover(p1, p2, swap_prob=0.5):
    """Realiza un cruce uniforme entre dos padres."""
    assert len(p1) == len(p2), "Los padres deben tener la misma longitud"
    child1, child2 = [], []
    for i in range(len(p1)):
        # Decidir si se intercambian los bits en esta posición
        if random.random() < swap_prob:
            child1.append(p2[i])
            child2.append(p1[i])
        else:
            child1.append(p1[i])
            child2.append(p2[i])
    return child1, child2

# --- Demostración ---
parent1 = [1, 1, 1, 1, 1, 0, 0, 0, 0, 0]
parent2 = [0, 0, 0, 0, 0, 1, 1, 1, 1, 1]

print("Padre 1:", parent1)
print("Padre 2:", parent2)
print("-" * 20)

# Cruce de un punto
c1_1, c2_1 = one_point_crossover(parent1, parent2)
print("Cruce de un punto:")
print("Hijo 1:", c1_1)
print("Hijo 2:", c2_1)
print("-" * 20)

# Cruce de dos puntos
c1_2, c2_2 = two_point_crossover(parent1, parent2)
print("Cruce de dos puntos:")
print("Hijo 1:", c1_2)
print("Hijo 2:", c2_2)
print("-" * 20)

# Cruce uniforme
c1_3, c2_3 = uniform_crossover(parent1, parent2)
print("Cruce uniforme:")
print("Hijo 1:", c1_3)
print("Hijo 2:", c2_3)