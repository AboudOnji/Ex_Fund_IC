A = [1 2; 3 4]; B = [5 6; 7 8];
C_sum = A + B;
C_prod = A * B;
C_dot_prod = A .* B;
C_inv_A = A \ eye(size(A)); % Similar a inv(A)
C_A_sq = A^2; % A*A
C_A_elem_sq = A.^2; % Eleva al cuadrado cada elemento