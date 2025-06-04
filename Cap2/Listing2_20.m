% Archivo: mostrarArgumentos.m
function mostrarArgumentos(varargin)
% MOSTRARARGUMENTOS Muestra todos los argumentos de entrada pasados.
    disp(['Numero de argumentos de entrada: ', num2str(nargin)]);
    for k = 1:nargin
        disp(['Argumento ', num2str(k), ':']);
        disp(varargin{k});
    end
end

% En la Ventana de Comandos:
% >> mostrarArgumentos(10, 'hola', [1 2; 3 4])
% Numero de argumentos de entrada: 3
% Argumento 1:
%     10
% Argumento 2:
% hola
% Argumento 3:
%      1     2
%      3     4