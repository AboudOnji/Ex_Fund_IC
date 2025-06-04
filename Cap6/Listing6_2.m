% --- Modelo de Clasificación k-NN en MATLAB ---

% 1. Generar Datos Sintéticos
rng(1); % Para reproducibilidad

% Datos para la Clase 1 (ej: 'Tipo A')
numMuestrasClase1 = 50;
mediaClase1 = [2, 3];
covClase1 = [1, 0.5; 0.5, 1]; % Matriz de covarianza
datosClase1 = mvnrnd(mediaClase1, covClase1, numMuestrasClase1);
etiquetasClase1 = repmat({'Clase A'}, numMuestrasClase1, 1);

% Datos para la Clase 2 (ej: 'Tipo B')
numMuestrasClase2 = 50;
mediaClase2 = [6, 7];
covClase2 = [1.5, -0.5; -0.5, 1.5];
datosClase2 = mvnrnd(mediaClase2, covClase2, numMuestrasClase2);
etiquetasClase2 = repmat({'Clase B'}, numMuestrasClase2, 1);

% Combinar datos y etiquetas
X_clas = [datosClase1; datosClase2]; % Matriz de características
Y_clas = [etiquetasClase1; etiquetasClase2]; % Vector de etiquetas (como cell array de strings)

% 2. Entrenar el Modelo k-NN
% fitcknn(X, Y, 'NumNeighbors', k) entrena un modelo k-NN.
% 'NumNeighbors' especifica el valor de 'k'.
k = 5;
modeloKNN = fitcknn(X_clas, Y_clas, 'NumNeighbors', k);

fprintf('Modelo k-NN entrenado con k = %d\n', k);

% 3. Visualizar los Datos de Entrenamiento
figure;
gscatter(X_clas(:,1), X_clas(:,2), Y_clas, 'rb', 'xo'); % 'r' y 'b' para colores, 'x' y 'o' para marcadores
xlabel('Característica 1');
ylabel('Característica 2');
title(['Datos de Entrenamiento para Clasificación (k-NN, k=', num2str(k), ')']);
legend('Clase A', 'Clase B', 'Location', 'best');
grid on;
hold on;

% (Opcional) Visualizar Regiones de Decisión
% Esto puede ser computacionalmente intensivo para datasets grandes
% Creamos una malla de puntos para cubrir el espacio de características
xLim = xlim;
yLim = ylim;
[xGrid, yGrid] = meshgrid(linspace(xLim(1), xLim(2), 100), ...
                          linspace(yLim(1), yLim(2), 100));
puntosMalla = [xGrid(:), yGrid(:)];

% Predecir la clase para cada punto de la malla
etiquetasMallaPredichas = predict(modeloKNN, puntosMalla);

% Visualizar las regiones de decisión
gscatter(xGrid(:), yGrid(:), etiquetasMallaPredichas, 'rb', '.', 1, 'off'); % 'off' para no añadir a leyenda
alpha(0.1); % Transparencia para las regiones

% 4. Clasificar Nuevos Puntos de Datos (Ejemplo)
nuevosPuntos = [3, 4;  % Se espera que sea Clase A
                7, 6]; % Se espera que sea Clase B

etiquetasPredichasNuevos = predict(modeloKNN, nuevosPuntos);

fprintf('\nClasificación de nuevos puntos:\n');
for i = 1:size(nuevosPuntos, 1)
    fprintf('Punto [%.1f, %.1f] -> Clase Predicha: %s\n', ...
            nuevosPuntos(i,1), nuevosPuntos(i,2), etiquetasPredichasNuevos{i});
end

% Graficar los nuevos puntos con su predicción
scatter(nuevosPuntos(strcmp(etiquetasPredichasNuevos, 'Clase A'), 1), ...
        nuevosPuntos(strcmp(etiquetasPredichasNuevos, 'Clase A'), 2), ...
        100, 'm', 'p', 'filled', 'DisplayName', 'Nuevo (Pred. A)'); % 'p' para pentagrama
scatter(nuevosPuntos(strcmp(etiquetasPredichasNuevos, 'Clase B'), 1), ...
        nuevosPuntos(strcmp(etiquetasPredichasNuevos, 'Clase B'), 2), ...
        100, 'c', 'p', 'filled', 'DisplayName', 'Nuevo (Pred. B)'); % 'c' para cyan

legend('show');
hold off;

% 5. Evaluar el Modelo (Ejemplo: Re-sustitución y Matriz de Confusión)
% Error de re-sustitución (prediciendo en los mismos datos de entrenamiento)
errorResustitucion = resubLoss(modeloKNN);
exactitudResustitucion = 1 - errorResustitucion;
fprintf('\nExactitud de re-sustitución: %.2f%%\n', exactitudResustitucion * 100);

% Matriz de confusión (para datos de entrenamiento en este caso)
% Idealmente, se usa un conjunto de prueba separado.
Y_pred_entrenamiento = predict(modeloKNN, X_clas);
C = confusionmat(Y_clas, Y_pred_entrenamiento);
disp('Matriz de Confusión (sobre datos de entrenamiento):');
disp(C);
% En la matriz C, C(i,j) es el número de observaciones de la clase i
% que son clasificadas como clase j.
% La diagonal principal contiene las clasificaciones correctas.

% --- Fin del Código ---