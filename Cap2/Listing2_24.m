% Ejemplo de ezplot para una función implícita
figure;
ezplot('x^2 + 3*y^2 - 5'); % Grafica x^2 + 3*y^2 = 5
axis([-4 4 -4 4]);
title('Elipse: x^2 + 3*y^2 = 5');

% Ejemplo de ezplot para una curva paramétrica 
figure;
ezplot('sin(3*t)*cos(t)', 'sin(3*t)*sin(t)', [0, pi]);
title('Curva Paramétrica');