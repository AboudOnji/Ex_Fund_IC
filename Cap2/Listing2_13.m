% Sintaxis: for variable = expresion\_vector
%              sentencias
%           end
s = 0;
for i = 1:10 % i toma valores de 1 a 10
    s = s + i;
end
% s contendrá 55

nombres = {'Ana', 'Luis', 'Eva'};
for k = 1:length(nombres)
    disp(nombres{k});
end