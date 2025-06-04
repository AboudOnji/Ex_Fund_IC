import numpy as np

# Establecer la semilla para reproducibilidad
np.random.seed(0)

mu = 5.0     # Media deseada
sigma = 2.0  # Desviación estándar deseada

# Generar un único número aleatorio N(mu, sigma^2)
numero_gaussiano = np.random.normal(mu, sigma)
print(f"Número Gaussiano N({mu}, {sigma}^2): {numero_gaussiano}")

# Generar un array de 1x5 números aleatorios N(mu, sigma^2)
array_gaussiano = np.random.normal(mu, sigma, 5) # o size=(1,5) para 2D
print(f"Array Gaussiano N({mu}, {sigma}^2):")
print(array_gaussiano)

# Si se quiere N(0,1) y luego escalar (similar a randn de MATLAB):
# z_estandar = np.random.randn(5) # Genera 5 números N(0,1)
# array_gauss_manual = mu + sigma * z_estandar
# print("Array Gaussiano (manual desde N(0,1)):")
# print(array_gauss_manual)

# El módulo 'random' de Python estándar también tiene random.gauss(mu, sigma)
# import random
# numero_gauss_random_module = random.gauss(mu, sigma)
# print(f"Número Gaussiano con módulo random: {numero_gauss_random_module}")