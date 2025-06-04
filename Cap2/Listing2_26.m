[X, Y] = meshgrid(-3:0.2:3, -2:0.2:2); % Cuadrícula más fina
Z = (X.^2 - 2*X) .* exp(-X.^2 - Y.^2 - X.*Y);
figure;
subplot(1,2,1);
mesh(X, Y, Z);
title('Superficie de Malla (mesh)');
xlabel('X'); ylabel('Y'); zlabel('Z');
axis([-3 3 -2 2 -0.7 1.5]);

subplot(1,2,2);
surf(X, Y, Z);
title('Superficie Sólida (surf)');
xlabel('X'); ylabel('Y'); zlabel('Z');
axis([-3 3 -2 2 -0.7 1.5]);
colorbar; % Muestra la barra de colores