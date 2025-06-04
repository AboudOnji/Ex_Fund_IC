# --- NOTA: para instlar las librerias necesarias, usa: pip install scikit-learn --- 
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap
from sklearn.datasets import make_blobs
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import accuracy_score, confusion_matrix
# Opcional: para dividir en entrenamiento y prueba
# from sklearn.model_selection import train_test_split

# 1. Generar Datos Sintéticos
np.random.seed(1) # Para reproducibilidad

# X_clas contendrá las características (2D en este caso)
# Y_clas contendrá las etiquetas de clase (0 o 1)
X_clas, Y_clas = make_blobs(n_samples=100, centers=2, n_features=2,
                            random_state=1, cluster_std=1.2)
# n_samples: número total de puntos
# centers: número de clases (o centros de los blobs)
# n_features: número de características por muestra
# random_state: para reproducibilidad
# cluster_std: desviación estándar de los clusters (controla la dispersión)

# Nota sobre la división de datos:
# X_train_cls, X_test_cls, Y_train_cls, Y_test_cls = train_test_split(
#     X_clas, Y_clas, test_size=0.3, random_state=42, stratify=Y_clas
# )
# Y entrenarías el modelo solo con X_train_cls, Y_train_cls.
# 'stratify=Y_clas' es útil para asegurar que las proporciones de clase sean similares en train/test.

# 2. Crear y Entrenar el Modelo k-NN
k = 5
modelo_knn = KNeighborsClassifier(n_neighbors=k)

# Entrenar el modelo con nuestros datos
modelo_knn.fit(X_clas, Y_clas)

print(f"Modelo k-NN entrenado con k = {k}")

# 3. Visualizar los Datos de Entrenamiento y Regiones de Decisión

# Crear un mapa de colores para la visualización
cmap_light = ListedColormap(['#FFAAAA', '#AAAAFF']) # Colores para regiones (Rojo claro, Azul claro)
cmap_bold = ListedColormap(['#FF0000', '#0000FF'])  # Colores para puntos (Rojo, Azul)

# Definir los límites de la gráfica y crear una malla
h = .02  # Tamaño del paso en la malla
x_min, x_max = X_clas[:, 0].min() - 1, X_clas[:, 0].max() + 1
y_min, y_max = X_clas[:, 1].min() - 1, X_clas[:, 1].max() + 1
xx, yy = np.meshgrid(np.arange(x_min, x_max, h),
                     np.arange(y_min, y_max, h))

# Predecir la clase para cada punto en la malla
Z = modelo_knn.predict(np.c_[xx.ravel(), yy.ravel()])
Z = Z.reshape(xx.shape) # Darle a Z la misma forma que la malla

plt.figure(figsize=(10, 6))
# Dibujar las regiones de decisión
plt.contourf(xx, yy, Z, cmap=cmap_light, alpha=0.8)

# Dibujar los puntos de entrenamiento
scatter = plt.scatter(X_clas[:, 0], X_clas[:, 1], c=Y_clas, cmap=cmap_bold,
                      edgecolor='k', s=50, label='Datos de Entrenamiento')

plt.xlabel('Característica 1')
plt.ylabel('Característica 2')
plt.title(f'Clasificación k-NN (k={k}) con Regiones de Decisión')
# Crear una leyenda manualmente para las clases
handles, labels = scatter.legend_elements()
# Asumiendo que las clases son 0 y 1, y queremos etiquetarlas como 'Clase 0' y 'Clase 1'
# Si usaste make_blobs con más centros, necesitarías ajustar esto.
# O si tus Y_clas son strings, esto sería más directo.
# Para este ejemplo, asumimos que Y_clas tiene 0s y 1s.
legend_labels = [f'Clase {i}' for i in np.unique(Y_clas)]
plt.legend(handles, legend_labels, title="Clases")
plt.grid(True)


# 4. Clasificar Nuevos Puntos de Datos (Ejemplo)
# Usaremos los centroides de los blobs generados como ejemplo de nuevos puntos
# make_blobs también devuelve los centros si se usa `return_centers=True`
# Por simplicidad, definiremos puntos visualmente cercanos a los clusters
nuevos_puntos_clas = np.array([[X_clas[Y_clas==0, 0].mean(), X_clas[Y_clas==0, 1].mean()], # Cerca del centroide de clase 0
                               [X_clas[Y_clas==1, 0].mean(), X_clas[Y_clas==1, 1].mean()], # Cerca del centroide de clase 1
                               [ (x_min+x_max)/2 , (y_min+y_max)/2 ] ]) # Un punto en el medio

etiquetas_predichas_nuevos_clas = modelo_knn.predict(nuevos_puntos_clas)
probabilidades_predichas_nuevos_clas = modelo_knn.predict_proba(nuevos_puntos_clas)


print("\nClasificación de nuevos puntos:")
for i, punto in enumerate(nuevos_puntos_clas):
    print(f"Punto [{punto[0]:.1f}, {punto[1]:.1f}] -> Clase Predicha: {etiquetas_predichas_nuevos_clas[i]}, "
          f"Probabilidades: {probabilidades_predichas_nuevos_clas[i]}")

# Graficar los nuevos puntos
plt.scatter(nuevos_puntos_clas[:, 0], nuevos_puntos_clas[:, 1],
            c=etiquetas_predichas_nuevos_clas, cmap=cmap_bold, # Usa el mismo colormap que los datos
            marker='P', s=200, edgecolor='black', linewidth=1.5, label='Nuevos Puntos (Predichos)')
# Añadir un texto para los nuevos puntos para que se vea en la leyenda si es necesario,
# o simplemente confiar en el marcador distinto.
# Para una leyenda más explícita de nuevos puntos, se podrían graficar por separado
# si se sabe su clase predicha.

# Actualizar leyenda para incluir "Nuevos Puntos" si es necesario de forma más explícita
# (El label en scatter ya podría ser suficiente dependiendo de cómo se quiera la leyenda)
current_handles, current_labels = plt.gca().get_legend_handles_labels()
# Si "Nuevos Puntos (Predichos)" no se añadió automáticamente a la leyenda por el scatter anterior,
# se puede añadir un handle "falso" o graficar un punto representativo.
# En este caso, el 'label' en el último scatter debería funcionar.
plt.legend(loc='best')
plt.show()


# 5. Evaluar el Modelo (sobre los datos de entrenamiento en este caso)
# Idealmente, se usa un conjunto de prueba.
Y_pred_entrenamiento_clas = modelo_knn.predict(X_clas)
accuracy = accuracy_score(Y_clas, Y_pred_entrenamiento_clas)
conf_matrix = confusion_matrix(Y_clas, Y_pred_entrenamiento_clas)

print(f"\nExactitud (Accuracy) sobre datos de entrenamiento: {accuracy*100:.2f}%")
print("Matriz de Confusión (sobre datos de entrenamiento):")
print(conf_matrix)
# La matriz de confusión C, donde C[i,j] es el número de observaciones
# conocidas por estar en el grupo i y predichas en el grupo j.