% Lento (sin preasignación)
A = [];
for i = 1:1000
    A(i) = i^2; % MATLAB redimensiona A en cada iteración
end

% Rápido (con preasignación)
N = 1000;
A_pre = zeros(1, N);
for i = 1:N
    A_pre(i) = i^2;
end