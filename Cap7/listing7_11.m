% --- Demostración de Mutacion Gaussiana ---
chromosome = [1.25, -0.5, 3.8, -2.1, 0.0];
mutation_rate = 0.2; % Probabilidad de que un gen mute
mutation_strength = 0.5; % Desviación estándar (sigma) del ruido Gaussiano
bounds = [-5.0, 5.0]; % Límites inferior y superior para las variables

fprintf('Cromosoma Original: %s\n', mat2str(chromosome, 3));
fprintf('Tasa de Mutación (por gen): %.2f\n', mutation_rate);
fprintf('Fuerza de Mutación (sigma): %.2f\n', mutation_strength);
disp('---------------------------------');

% Aplicar mutación
mutated_chromosome = gaussian_mutation(chromosome, mutation_rate, mutation_strength, bounds);
fprintf('Cromosoma Mutado:   %s\n', mat2str(mutated_chromosome, 3));

% --- Definición de la Función ---

function [mutated_child] = gaussian_mutation(child, mut_rate, mut_strength, bounds)
    % Realiza una mutación Gaussiana en un cromosoma de punto flotante.
    
    n = length(child);
    mutated_child = child; % Copiar el cromosoma original
    
    % Iterar sobre cada gen del cromosoma
    for i = 1:n
        % Decidir si este gen debe mutar
        if rand() < mut_rate
            % Generar ruido Gaussiano
            noise = normrnd(0, mut_strength);
            % Añadir el ruido al gen
            mutated_child(i) = mutated_child(i) + noise;
            
            % Asegurarse de que el nuevo valor esté dentro de los límites
            if mutated_child(i) > bounds(2)
                mutated_child(i) = bounds(2);
            elseif mutated_child(i) < bounds(1)
                mutated_child(i) = bounds(1);
            end
        end
    end
end