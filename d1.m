%% Demand function (road 1)

function [ g ] = d1( fin,r,mu )

    g = mu*(r>0)+min(fin,mu)*(r<=0);

end