%%  Order (=convergence rate) estimate stepwise

function [ p ] = order_estimate_stepwise( h, error )
    
    p = zeros(length(h)-1,1);
    
    for i = 1:length(h)-1
        p(i,1) = (log(error(i+1,1)) - log(error(i,1))) / (log(h(i+1)) - log(h(i)));
    end

end

