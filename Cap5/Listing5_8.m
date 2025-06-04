function [x_opt, f_opt] = simulated_annealing_conceptual(func_obj, x_inicial, T_inicial, T_final, factor_enfriamiento, iter_por_temp)
    x_actual = x_inicial;
    f_actual = func_obj(x_actual);
    x_mejor = x_actual;
    f_mejor = f_actual;
    T = T_inicial;

    while T > T_final
        for i = 1:iter_por_temp
            x_candidato = generar_vecino(x_actual); % Genera un vecino
            f_candidato = func_obj(x_candidato);
            
            delta_E = f_candidato - f_actual;
            
            if delta_E < 0 % Si es mejor, aceptar
                x_actual = x_candidato;
                f_actual = f_candidato;
                if f_actual < f_mejor
                    x_mejor = x_actual;
                    f_mejor = f_actual;
                end
            else % Si es peor, aceptar con probabilidad
                prob_aceptar = exp(-delta_E / T);
                if rand() < prob_aceptar
                    x_actual = x_candidato;
                    f_actual = f_candidato;
                end
            end
        end
        T = T * factor_enfriamiento; % Enfriar
    end
    x_opt = x_mejor;
    f_opt = f_mejor;
end