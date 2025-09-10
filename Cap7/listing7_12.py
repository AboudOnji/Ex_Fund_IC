import random

def one_point_crossover(p1, p2):
    """Función auxiliar para realizar un cruce de un punto."""
    crossover_point = random.randint(1, len(p1) - 1)
    child = p1[:crossover_point] + p2[crossover_point:]
    return child

def headless_chicken_mutation(parent_chromosome):
    """
    Aplica el operador de macromutación "gallina sin cabeza".
    Cruza el padre con un individuo completamente aleatorio.
    """
    chromosome_length = len(parent_chromosome)
    
    # 1. Generar un individuo completamente aleatorio ("la gallina sin cabeza")
    random_individual = [random.randint(0, 1) for _ in range(chromosome_length)]
    
    print(f"  Individuo Aleatorio Generado: {random_individual}")
    
    # 2. Cruzar el padre con el individuo aleatorio
    mutated_offspring = one_point_crossover(parent_chromosome, random_individual)
    
    return mutated_offspring

# --- Demostración ---
# Un padre que podría estar estancado en un óptimo local
parent = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

print("Cromosoma Padre Original:", parent)
print("-" * 30)

# Aplicar la macromutación
# El resultado será una mezcla del padre y un individuo aleatorio
mutated_child = headless_chicken_mutation(parent)

print("\nDescendiente Mutado:", mutated_child)