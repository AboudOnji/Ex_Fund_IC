t = 0:0.1:2*pi;
y1 = sin(t);
y2 = 0.01*cos(t);
figure;
plotyy(t, y1, t, y2);
title('Gráfico con Doble Eje Y');
xlabel('t');
ylabel(gca, 'Eje Izquierdo: sin(t)'); % gca obtiene el handle del eje actual
% Para el segundo ylabel, se necesita obtener el handle del segundo eje
% ax = plotyy(...); ylabel(ax(2), 'Eje Derecho: 0.01*cos(t)');