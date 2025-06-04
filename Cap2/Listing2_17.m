% Sintaxis: try
%              sentencias\_a\_intentar
%           catch ME % ME es un objeto que contiene información del error
%              sentencias\_manejo\_error
%           end
try
    resultado = 1 / 0; % Esto generará un error (división por cero)
    disp('Calculo realizado.'); % No se ejecutará
catch ME
    disp('Ocurrio un error:');
    disp(ME.message); % Muestra el mensaje de error
end
% Se mostrará el mensaje de error de división por cero.