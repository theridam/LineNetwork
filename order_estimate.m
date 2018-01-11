%%  Order (=convergence rate) estimate

function [ p ] = order_estimate( h, error )
    
    p = polyfit(log(h),log(error),1);
    p = p(1);

end