rosenbrock = @(x) 100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;

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