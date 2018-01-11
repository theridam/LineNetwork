%% Demand function (buffer) 
function [ g ] = dB( rho,r,mu,f,sigma,d )

    g = mu*(r>0)+min(d(f,sigma,rho),mu)*(r<=0);

end