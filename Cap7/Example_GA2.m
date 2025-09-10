%=================================================
% Optimization using Genetic Algorithm (GA)
%=================================================
% Objective Function: ps_example(x) (provided by MATLAB)
% Constraints: Different cases
% Author: Aboud BARSEKH-ONJI (D.sc.) 
% Email:aboud.barsekh@anahauc.mx
% Date: June 2023
%=================================================
% Crear una malla de puntos para la evaluación
xi = linspace(-6, 2, 300);
yi = linspace(-4, 4, 300);
[X, Y] = meshgrid(xi, yi);
Z = ps_example([X(:), Y(:)]);
Z = reshape(Z, size(X));

% Graficar la superficie
surf(X, Y, Z, 'MeshStyle', 'none');
colormap('jet');
view(-26, 43);
xlabel('x(1)');
ylabel('x(2)');
title('ps_example(x)');

% Caso 1: Aplicación simple
rng default 
% Llamada a la función ga
x = ga(@ps_example, 2)

% Caso 2: Con restricciones de desigualdad
A = [-1, -1; 
     -1,  1];
b = [-1; 5];
fun = @ps_example;
x = ga(fun, 2, A, b)

% Caso 3: Con restricciones de desigualdad e igualdad lineales
A = [-1, -1];
b = -1;
Aeq = [-1, 1];
beq = 5;
rng default
x = ga(fun, 2, A, b, Aeq, beq)

% Caso 4: Con restricciones no lineales
rng default
nonlcon = @ellipsecons;
x = ga(fun, 2, [], [], [], [], [], [], nonlcon)

function [c, ceq] = ellipsecons(x)
    c = 2*x(1)^2 + x(2)^2 - 3;
    ceq = (x(1)+1)^2 - (x(2)/2)^4;
end