%% L1 norm at final time step

function [err_1] = error_L1(E,h,roadApprox,roadExact) 

    err_1 = zeros(E+1,1);
    for e = 1:E
        err_1(e+1,1) = h(e)*sum(abs(roadApprox.rho{e}(:,end) - roadExact.rho{e}(:,end)));
    end
    err_1(1,1) = sum(err_1(2:end,1));
    
end