import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns # Opcional, para gráficos más estilizados

# Ejemplo con Matplotlib
x = np.linspace(0, 2 * np.pi, 100)
y_sin = np.sin(x)
y_cos = np.cos(x)

plt.figure(figsize=(8, 5)) # Crear figura y establecer tamaño
plt.plot(x, y_sin, label='sin(x)', color='blue', linestyle='--')
plt.plot(x, y_cos, label='cos(x)', color='red', marker='o', markersize=3)
plt.title('Funciones Seno y Coseno')
plt.xlabel('x (radianes)')
plt.ylabel('Valor de la función')
plt.legend()
plt.grid(True)
plt.show() # Muestra el gráfico

# Ejemplo con Seaborn (requiere datos en un DataFrame de Pandas a menudo)
# data_df = pd.DataFrame({'x': x, 'sin_x': y_sin, 'cos_x': y_cos})
# sns.lineplot(data=data_df, x='x', y='sin_x', label='sin(x)')
# sns.lineplot(data=data_df, x='x', y='cos_x', label='cos(x)')
# plt.show()