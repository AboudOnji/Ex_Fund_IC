% Archivo: factorialRecursivo.m
function f = factorialRecursivo(n)
% FACTORIALRECURSIVO Calcula el factorial de n usando recursión.
    if n < 0 || floor(n) ~= n
        error('n debe ser un entero no negativo.');
    elseif n == 0 || n == 1
        f = 1; % Condición base
    else
        f = n * factorialRecursivo(n-1); % Llamada recursiva
    end
end