%% Exact solution for the Example exactSolCase1
% p_{1,0} = 0.4, p_{2,0} = 0.7
% r_0 = 0
% mu = [0.25,0.2]
% rMax = [Inf,0.3]
% f^{in}(t) = f(0.4);

function [road] = exactSolCase1(E,L,a,b,N,T,mu,rMax,r0,p0,CFL,f)

    % Compute grid variables
    [ h,~,~,NT,tt ] = grid_variables( L,N,T,CFL );
    
    % Initialization of roads and buffers
    [ road ] = initialization( E,NT,L,N,a,b,h,mu,rMax,p0,r0 );
    
    % Compute shock speeds
    road.s{1} = (f(p0(1))-mu(2))/(p0(1)-(5+sqrt(5))/10);
    road.s{2} = (f(p0(2))-mu(2))/(p0(2)-(5-sqrt(5))/10);
    
    % Compute solution
     for tn = 2:length(tt)
         for xi = 1:length(road.xV{1})
             
            if (road.xV{1}(xi) < road.s{1}*tt(tn))
                road.rho{1}(xi,tn) = p0(1);
            else
                road.rho{1}(xi,tn) = (5+sqrt(5))/10;
            end
         end
         
         for xi = 1:length(road.xV{2})
             if (road.xV{2}(xi) < road.s{2}*tt(tn))
                 road.rho{2}(xi,tn) = (5-sqrt(5))/10;
             else
                 road.rho{2}(xi,tn) = p0(2); 
             end
         end
     end
     
end