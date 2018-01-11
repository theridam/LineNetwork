%% Initialization of roads and buffers
   
function [ road ] = initialization( E,NT,L,N,a,b,h,mu,rMax,p0,r0 )       
    for e=1:E
        road.L{e}        = L(e);             % length of the road e
        road.NP{e}       = N(e);             % total number of space discret. points of road e
        road.x{e}        = a(e):h(e):b(e);   % spacial grid 
        road.xV{e}       = a(e)+0.5*h(e):h(e):b(e)-0.5*h(e); % spacial grid used for finite volume methods
        
        road.rho{e}      = zeros(N(e),NT);   % density of road e at all discret. points
        road.rho{e}(:,1) = p0(e)*ones(N(e),1); % inital density
       
        road.r{e}        = zeros(NT,1);      % buffer in front of road e at all time steps
        road.r{e}(1,1)   = r0(e);            % initial buffer load
        road.rMax{e}     = rMax(e);          % max capacity of buffer
        road.mu{e}       = mu(e);            % buffer rate
        
        road.inflow{e}   = zeros(NT,1);      % inflow q^(in)_e for all tn   
        road.outflow{e}  = zeros(NT,1);      % outflow q^(out)_e for all tn
    end
end