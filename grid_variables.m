%% Compute grid variables

function [ h,tau,lambda,NT,tt ] = grid_variables( L,N,T,CFL )

    h      = L./(N);               % step size in space
    tau    = min(CFL*h);           % step size in time, satisfying the CFL condition
    lambda = min(tau./h);          % grid constant
    NT     = floor( ( T/tau )+1 ); % total number of time steps 
    tt     = 0:tau:T;              % time grid

end