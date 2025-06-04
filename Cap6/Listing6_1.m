% --- Modelo de Regresión Lineal Simple en MATLAB ---

% 1. Generar Datos Sintéticos
rng(0); % Para reproducibilidad de los resultados
X = (1:0.5:20)'; % Variable independiente (entrada), ej: tamaño de un motor
% Suponemos una relación lineal Y = 2*X + 5 con algo de ruido
Y_real = 2*X + 5;
ruido = 5*randn(size(X)); % Ruido gaussiano
Y = Y_real + ruido; % Variable dependiente (salida), ej: potencia del motor

% 2. Ajustar el Modelo de Regresión Lineal
% polyfit(X, Y, n) ajusta un polinomio de grado 'n' a los datos (X,Y).
% Para regresión lineal simple, n = 1 (una línea recta).
% Devuelve los coeficientes del polinomio p = [p1 p2 ... pn+1]
% En nuestro caso, p(1) será la pendiente (m) y p(2) será la ordenada al origen (b).
coeficientes = polyfit(X, Y, 1);
m_estimada = coeficientes(1);
b_estimada = coeficientes(2);

fprintf('Ecuación de regresión estimada: Y = %.2fX + %.2f\n', m_estimada, b_estimada);

% 3. Predecir Valores Usando el Modelo Ajustado
Y_predicha = m_estimada*X + b_estimada;
% Alternativamente, usando polyval:
% Y_predicha = polyval(coeficientes, X);

% 4. Visualizar los Resultados
figure; % Crea una nueva figura
scatter(X, Y, 'filled', 'DisplayName', 'Datos Originales'); % Grafica los puntos de datos
hold on; % Mantiene la gráfica actual para añadir más elementos
plot(X, Y_predicha, 'r-', 'LineWidth', 2, 'DisplayName', 'Línea de Regresión'); % Grafica la línea de regresión
plot(X, Y_real, 'g--', 'LineWidth', 1.5, 'DisplayName', 'Relación Real (sin ruido)'); % Grafica la relación real (opcional)
hold off; % Libera la gráfica

xlabel('Variable Independiente (X)');
ylabel('Variable Dependiente (Y)');
title('Modelo de Regresión Lineal Simple');
legend('show');
grid on;

% 5. Evaluar el Modelo (Ejemplo: Error Cuadrático Medio - MSE)
MSE = mean((Y - Y_predicha).^2);
fprintf('Error Cuadrático Medio (MSE): %.2f\n', MSE);

% --- Fin del Código ---