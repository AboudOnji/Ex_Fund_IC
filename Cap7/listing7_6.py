import random
import numpy as np

def fitness_based_gene_scanning(parents, fitness_scores):
    """
    Realiza un cruce por escaneo de genes basado en la aptitud.
    Crea un hijo seleccionando cada gen de uno de los padres,
    con una probabilidad proporcional a la aptitud de cada padre.
    """
    num_parents = len(parents)
    num_genes = len(parents[0])
    child = [0.0] * num_genes

    # Normalizar las puntuaciones de aptitud para obtener probabilidades
    fitness_sum = sum(fitness_scores)
    selection_probs = [score / fitness_sum for score in fitness_scores]

    # Para cada gen, seleccionar un padre del cual heredar
    for i in range(num_genes):
        # Elegir un padre basado en las probabilidades de aptitud (ruleta)
        chosen_parent_idx = np.random.choice(num_parents, p=selection_probs)
        # Copiar el gen del padre elegido al hijo
        child[i] = parents[chosen_parent_idx][i]
        
    return child

# --- Demostración ---
# Tres padres, cada uno con 5 genes (variables de punto flotante)
parent1 = [0.1, 0.5, 1.2, 2.5, 3.1]
parent2 = [0.2, 0.7, 1.8, 2.1, 3.5]
parent3 = [0.3, 0.6, 1.5, 2.9, 3.3]

parents = [parent1, parent2, parent3]

# Aptitudes asociadas a cada padre (mayor es mejor)
# El padre 3 es el más apto, por lo que tiene más probabilidad de donar sus genes
fitness = [10.0, 15.0, 25.0]

print("Padres:")
for i, p in enumerate(parents):
    print(f"  P{i+1}: {p}, Aptitud: {fitness[i]}")

print("-" * 30)

# Generar un hijo
child1 = fitness_based_gene_scanning(parents, fitness)
print("Hijo generado por Escaneo de Genes:")
print("  Hijo 1:", [round(gene, 2) for gene in child1])

# Ejecutar varias veces para ver la variabilidad
print("\nGenerando 3 hijos más para ver la variabilidad:")
for i in range(3):
    child = fitness_based_gene_scanning(parents, fitness)
    print(f"  Hijo {i+2}:", [round(gene, 2) for gene in child])