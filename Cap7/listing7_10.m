% --- Demostración de Mutación en Orden ---
chromosome = [1, 1, 1, 1, 1, 0, 0, 0, 0, 0];
% Tasa de mutación alta para asegurar que ocurran cambios en el segmento
mutation_rate = 0.5; 

fprintf('Cromosoma Original: %s\n', mat2str(chromosome));
fprintf('Tasa de Mutación dentro del segmento: %.2f\n', mutation_rate);
disp('---------------------------------');

% Aplicar mutación
mutated_chromosome = inorder_mutation(chromosome, mutation_rate);
fprintf('Cromosoma Mutado: %s\n', mat2str(mutated_chromosome));


% --- Definición de la Función ---

function [mutated_child] = inorder_mutation(child, mutation_rate)
    % Realiza una mutación en orden (inorder).
    % La mutación solo ocurre dentro de un segmento aleatorio del cromosoma.
    
    n = length(child);
    mutated_child = child; % Copiar el cromosoma original
    
    % Seleccionar dos puntos aleatorios y ordenarlos para definir el segmento
    points = sort(randi([1, n], 1, 2));
    start_point = points(1);
    end_point = points(2);
    
    fprintf('Segmento de mutación seleccionado: de %d a %d\n', start_point, end_point);
    
    % Iterar solo sobre el segmento seleccionado
    for i = start_point:end_point
        if rand() < mutation_rate
            % Invertir el bit
            mutated_child(i) = 1 - mutated_child(i);
        end
    end
end