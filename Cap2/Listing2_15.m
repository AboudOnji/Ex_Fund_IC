% Sintaxis: if condicion1
%              bloque1
%           elseif condicion2
%              bloque2
%           else
%              bloque3
%           end

nota = 75;
if nota >= 90
    calificacion = 'A'
elseif nota >= 80
    calificacion = 'B'
elseif nota >= 70
    calificacion = 'C'
else
    calificacion = 'F'
end
% calificacion será 'C'