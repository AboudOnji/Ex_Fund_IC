t = 0:pi/20:2*pi;
y1 = sin(t);
y2 = cos(t);
figure;
plot(t, y1, 'r--o', t, y2, 'b:p'); % Línea roja discontinua con círculos para y1
                                     % Línea azul punteada con pentagramas para y2
legend('sin(t)', 'cos(t)');
figure;
plot(t, y1, 'r-o', 'LineWidth', 2, 'MarkerSize', 8, ...
        'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'g');
