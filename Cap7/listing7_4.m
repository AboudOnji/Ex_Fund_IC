% --- Demostración de Operadores de Cruce ---
parent1 = [1, 1, 1, 1, 0, 0, 0, 0, 0, 0];
parent2 = [0, 0, 0, 0, 0, 1, 1, 1, 1, 1];

fprintf('Padre 1: %s\n', mat2str(parent1));
fprintf('Padre 2: %s\n', mat2str(parent2));
disp('--------------------');

% Cruce de un punto
[c1_1, c2_1] = one_point_crossover(parent1, parent2);
fprintf('Cruce de un punto:\n');
fprintf('Hijo 1: %s\n', mat2str(c1_1));
fprintf('Hijo 2: %s\n', mat2str(c2_1));
disp('--------------------');

% Cruce de dos puntos
[c1_2, c2_2] = two_point_crossover(parent1, parent2);
fprintf('Cruce de dos puntos:\n');
fprintf('Hijo 1: %s\n', mat2str(c1_2));
fprintf('Hijo 2: %s\n', mat2str(c2_2));
disp('--------------------');

% Cruce uniforme
[c1_3, c2_3] = uniform_crossover(parent1, parent2, 0.5);
fprintf('Cruce uniforme:\n');
fprintf('Hijo 1: %s\n', mat2str(c1_3));
fprintf('Hijo 2: %s\n', mat2str(c2_3));

% --- Definición de Funciones ---

function [child1, child2] = one_point_crossover(p1, p2)
    % Realiza un cruce de un punto entre dos padres.
    n = length(p1);
    % Seleccionar un punto de cruce aleatorio
    crossover_point = randi([1, n-1]);
    
    % Crear los hijos
    child1 = [p1(1:crossover_point), p2(crossover_point+1:end)];
    child2 = [p2(1:crossover_point), p1(crossover_point+1:end)];
end

function [child1, child2] = two_point_crossover(p1, p2)
    % Realiza un cruce de dos puntos entre dos padres.
    n = length(p1);
    % Seleccionar dos puntos de cruce y ordenarlos
    points = sort(randi([1, n-1], 1, 2));
    p1_start = points(1);
    p2_end = points(2);
    
    % Crear los hijos
    child1 = [p1(1:p1_start), p2(p1_start+1:p2_end), p1(p2_end+1:end)];
    child2 = [p2(1:p1_start), p1(p1_start+1:p2_end), p2(p2_end+1:end)];
end

function [child1, child2] = uniform_crossover(p1, p2, swap_prob)
    % Realiza un cruce uniforme entre dos padres.
    n = length(p1);
    child1 = p1;
    child2 = p2;
    
    % Crear una máscara aleatoria
    mask = rand(1, n) < swap_prob;
    
    % Intercambiar los bits según la máscara
    child1(mask) = p2(mask);
    child2(mask) = p1(mask);
end