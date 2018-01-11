%% L2 norm at final time step

function [err_2] = error_L2(E,h,roadApprox,roadExact) 

    err_2 = zeros(E+1,1);
    tmp = zeros(E,1);
    for e = 1 : E
        err_2(e+1,1) = sqrt(h(e)*sum((roadApprox.rho{e}(:,end) - roadExact.rho{e}(:,end)).^2));
        tmp(e,1) = h(e)*sum((roadApprox.rho{e}(:,end) - roadExact.rho{e}(:,end)).^2);
    end
    err_2(1,1) = sqrt(sum(tmp(:,1)));
end