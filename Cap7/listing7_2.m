rosenbrock = @(x) 100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;
% Dibujar la función de Rosenbrock
x1 = linspace(-2, 2, 100);
x2 = linspace(-1, 3, 100);
[X1, X2] = meshgrid(x1, x2);
Z = zeros(size(X1)); % Inicializamos la matriz Z con ceros
for i = 1:size(X1, 1)
    for j = 1:size(X1, 2)
        % En cada punto (i, j), calculamos el valor de la función.
        Z(i, j) = rosenbrock([X1(i, j); X2(i, j)]);
    end
end
figure; % Crea una nueva ventana para la figura
surf(X1, X2, Z);
title('Función de Rosenbrock (Gráfica de Superficie 3D)');
xlabel('x_1');
ylabel('x_2');
zlabel('f(x_1, x_2)');
colorbar; % Muestra una barra de colores para los valores de Z
disp('Mostrando la gráfica de superficie 3D...');

% Dibujar la función de Rosenbrock en 2D (curvas de nivel-contour)
figure; % Crea otra ventana para la segunda figura
contour(X1, X2, Z, 50); % El '50' indica el número de curvas de nivel a dibujar
title('Función de Rosenbrock (Curvas de Nivel)');
xlabel('x_1');
ylabel('x_2');
colorbar; % Muestra la escala de colores
hold on; % Mantiene la gráfica actual para añadir más elementos
% Marcamos el punto mínimo global de la función, que está en (1,1)
plot(1, 1, 'r*', 'MarkerSize', 10, 'LineWidth', 2);
legend('Curvas de Nivel', 'Mínimo Global (1,1)');
hold off;
disp('Mostrando la gráfica de curvas de nivel...');
% =================================================
% Algoritmo Evolutivo (1+1)-ES para minimizar la función de Rosenbrock
% =================================================
% --- Parámetros ---
n_vars = 2;       % Número de variables de decisión
n_gens = 1000;    % Número de generaciones
sigma = 0.5;      % Desviación estándar de la mutación
lim_inf = -2.048;
lim_sup = 2.048;

% --- Algoritmo (1+1)-ES ---
% Inicialización
rng('default'); % Para reproducibilidad
padre_x = unifrnd(lim_inf, lim_sup, [1, n_vars]);
padre_aptitud = rosenbrock(padre_x);
fprintf('Inicial -> x: [%.4f, %.4f], aptitud: %.4f\n', padre_x(1), padre_x(2), padre_aptitud);

for gen = 1:n_gens
    % Mutación
    hijo_x = padre_x + normrnd(0, sigma, [1, n_vars]);
    % Asegurarse de que el hijo esté dentro de los límites (clipping)
    hijo_x(hijo_x > lim_sup) = lim_sup;
    hijo_x(hijo_x < lim_inf) = lim_inf;
    
    % Evaluación
    hijo_aptitud = rosenbrock(hijo_x);
    
    % Selección (determinista, extintiva para el peor)
    if hijo_aptitud < padre_aptitud
        padre_x = hijo_x;
        padre_aptitud = hijo_aptitud;
    end
end

fprintf('Final -> x: [%.4f, %.4f], aptitud: %.4f\n', padre_x(1), padre_x(2), padre_aptitud);