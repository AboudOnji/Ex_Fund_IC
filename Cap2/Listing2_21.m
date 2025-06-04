t = 0:0.1:2*pi;
y_sin = sin(t);
figure; % Crea una nueva ventana de figura
plot(t, y_sin);
title('Curva Sinusoidal');
xlabel('t (radianes)');
ylabel('sin(t)');

y_cos = cos(t);
figure;
plot(t, y_sin, t, y_cos); % Grafica múltiples pares X,Y
title('Curvas Sinusoidal y Cosenoidal');
legend('sin(t)', 'cos(t)'); % Añade una leyenda