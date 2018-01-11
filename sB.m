%% Supply function (buffer) 
function [ e ] = sB( rho,r,mu,rMax,f,sigma,s )

    e = mu*(r<rMax-eps)+min(s(f,sigma,rho),mu)*(r>=rMax-eps);

end