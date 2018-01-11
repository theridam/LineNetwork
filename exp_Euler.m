%% Explicit Euler method

function [ road ] = exp_Euler( e,tn,tau,road,fin )

    if (e==1)
        road.r{e}(tn+1) =  road.r{e}(tn) + tau * ( fin(tn) - road.inflow{e}(tn) );
    else
        road.r{e}(tn+1) =  road.r{e}(tn) + tau * ( road.outflow{e-1}(tn) - road.inflow{e}(tn) ); 
    end

end