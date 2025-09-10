import random

def uniform_mutation(bitstring, mutation_rate):
    """
    Aplica mutación uniforme a una cadena de bits.
    Cada bit tiene una probabilidad `mutation_rate` de ser invertido.
    """
    mutated_bitstring = bitstring.copy()
    for i in range(len(mutated_bitstring)):
        if random.random() < mutation_rate:
            # Invertir el bit (0 a 1, 1 a 0)
            mutated_bitstring[i] = 1 - mutated_bitstring[i]
    return mutated_bitstring

# --- Demostración ---
chromosome = [1, 1, 1, 1, 1, 0, 0, 0, 0, 0]
# Una tasa de mutación del 10% significa que, en promedio, 1 de cada 10 bits mutará
mutation_rate = 0.1 

print("Cromosoma Original:", chromosome)
print(f"Tasa de Mutación: {mutation_rate}")
print("-" * 30)

# Aplicar mutación
mutated_chromosome = uniform_mutation(chromosome, mutation_rate)
print("Cromosoma Mutado:", mutated_chromosome)

# Ejecutar varias veces para ver la variabilidad
print("\nEjecutando la mutación 3 veces más:")
for i in range(3):
    mutated = uniform_mutation(chromosome, mutation_rate)
    print(f"  Intento {i+1}:", mutated)