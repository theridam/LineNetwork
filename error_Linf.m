%% L_inf norm at final time step

function [err_Linf] = error_Linf(E,roadApprox,roadExact)

    err_Linf = zeros(E+1,1);
    for e = 1 : E     
        err_Linf(e+1,1) = max(abs(roadApprox.rho{e}(:,end) - roadExact.rho{e}(:,end)));
    end
    err_Linf(1,1) = max(err_Linf(2:end,1));
    
end