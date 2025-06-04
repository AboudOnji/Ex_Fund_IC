t = 0:pi/50:4*pi; % Dos ciclos para mejor visualización
x = sin(t);
y = cos(t);
z = t;
figure;
h = plot3(x, y, z, 'g-', 'LineWidth', 2);
title('Curva Helicoidal 3D');
xlabel('sin(t)'); ylabel('cos(t)'); zlabel('t');
grid on;
view(30, 45); % Cambia el punto de vista azimut=30, elevación=45