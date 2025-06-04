function prom = calcularPromedioMatlab(n1, n2, n3)

    % Verificar que se proporcionen tres argumentos
    if nargin ~= 3
        error('Se requieren exactamente tres números de entrada.');
    end

    % Calcular la suma
    suma_numeros = n1 + n2 + n3;

    % Calcular el promedio
    prom = suma_numeros / 3;

    % Opcionalmente, mostrar el resultado si no se asigna a una variable de salida
    if nargout == 0
        disp(['El promedio es: ', num2str(prom)]);
    end
end

% Ejemplo de uso en la Ventana de Comandos de MATLAB:
% >> p = calcularPromedioMatlab(10, 20, 30)
% p =
%     20
% >> calcularPromedioMatlab(5, 7, 9)
% El promedio es: 7