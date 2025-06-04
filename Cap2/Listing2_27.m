s = 0;
for i = 1:100000
    s = s + (1/2^i + 1/3^i);
end

% Rápido (vectorizado)
i_vec = 1:100000;
s_vec = sum(1./(2.^i_vec) + 1./(3.^i_vec));