% --- Demostración de Cruce Diagonal ---
% Tres padres para un cruce con n=2 puntos
parent1 = [1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8];
parent2 = [2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8];
parent3 = [3.1, 3.2, 3.3, 3.4, 3.5, 3.6, 3.7, 3.8];

fprintf('Padre 1: %s\n', mat2str(parent1));
fprintf('Padre 2: %s\n', mat2str(parent2));
fprintf('Padre 3: %s\n', mat2str(parent3));
disp('--------------------');

% Generar 3 hijos a partir de 3 padres
[children] = diagonal_crossover(parent1, parent2, parent3);

fprintf('Cruce Diagonal:\n');
fprintf('Hijo 1: %s\n', mat2str(children(1,:)));
fprintf('Hijo 2: %s\n', mat2str(children(2,:)));
fprintf('Hijo 3: %s\n', mat2str(children(3,:)));


% --- Definición de la Función ---

function [children] = diagonal_crossover(p1, p2, p3)
    % Realiza un cruce diagonal con 3 padres y 2 puntos de cruce.
    % Devuelve 3 hijos.
    
    n = length(p1);
    parents = [p1; p2; p3];
    num_parents = size(parents, 1);
    
    % Seleccionar n = num_parents - 1 puntos de cruce
    points = sort(randi([1, n-1], 1, num_parents - 1));
    
    % Añadir los extremos para definir los segmentos
    all_points = [0, points, n];
    
    children = zeros(num_parents, n);
    
    % Construir cada hijo
    for i = 1:num_parents
        child = [];
        for j = 1:(length(all_points)-1)
            % El índice del padre se desplaza diagonalmente
            parent_idx = mod(i + j - 2, num_parents) + 1;
            
            % Extraer el segmento del padre correspondiente
            start_idx = all_points(j) + 1;
            end_idx = all_points(j+1);
            segment = parents(parent_idx, start_idx:end_idx);
            
            child = [child, segment];
        end
        children(i, :) = child;
    end
end