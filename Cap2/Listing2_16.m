% Sintaxis: switch expresion\_switch
%              case valor\_caso1
%                 bloque1
%              case {valor\_caso2a, valor\_caso2b} % Múltiples valores
%                 bloque2
%              otherwise
%                 bloque\_otro
%           end
diaNum = 3;
switch diaNum
    case 1
        diaNombre = 'Lunes'
    case {2, 3, 4, 5} % Múltiples casos pueden agruparse en una celda
        diaNombre = 'Dia laboral entre semana'
    case 6
        diaNombre = 'Sabado'
    case 7
        diaNombre = 'Domingo'
    otherwise
        diaNombre = 'Dia invalido'
end
% diaNombre será 'Dia laboral entre semana'