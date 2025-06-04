A1 = [1 2; 3 4]; A2 = [5 6; 7 8];
A_3D = cat(3, A1, A2) % Crea un arreglo de 2x2x2
A_3D_alt = zeros(2,2,2); % Pre-asignar memoria
A_3D_alt(:,:,1) = A1
A_3D_alt(:,:,2) = A2