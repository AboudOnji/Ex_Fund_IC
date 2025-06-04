import numpy as np

# Crear un array de NumPy
a = np.array([1, 2, 3, 4, 5])
b = np.array([[1, 2], [3, 4]]) # Array 2D (matriz)

print(a.shape)  # Salida: (5,)
print(b.ndim)   # Salida: 2 (número de dimensiones)
print(b.dtype)  # Salida: int32 (o int64, depende del sistema)

# Operaciones vectorizadas
c = a * 2       # Multiplica cada elemento por 2
d = a + a       # Suma elemento a elemento

# Funciones universales (ufuncs)
print(np.sin(a))
print(np.mean(b, axis=0)) # Media de las columnas de b