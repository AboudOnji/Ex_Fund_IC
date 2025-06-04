from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import accuracy_score
from sklearn.datasets import load_iris # Ejemplo de dataset

# Cargar un dataset de ejemplo
iris = load_iris()
X, y = iris.data, iris.target

# Dividir datos en entrenamiento y prueba
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

# Crear y entrenar un clasificador k-NN
knn = KNeighborsClassifier(n_neighbors=3)
knn.fit(X_train, y_train)

# Realizar predicciones
y_pred = knn.predict(X_test)

# Evaluar el modelo
print(f'Precisión del k-NN: {accuracy_score(y_test, y_pred):.2f}')
# Salida (ejemplo): Precisión del k-NN: 1.00