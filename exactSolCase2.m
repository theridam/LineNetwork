%% Exact solution for the Example exactSolCase2
% p_{1,0} = 0.1, p_{2,0} = 0.45
% r_0 = 0.15
% mu = [0.25,0.2]
% rMax = [Inf,0.3]
% f^{in}(t) = f(0.1);

function [road] = exactSolCase2(E,L,a,b,N,T,mu,rMax,r0,p0,CFL,f)

    % Compute grid variables
    [ h,~,~,NT,tt ] = grid_variables( L,N,T,CFL );
    
    % Initialization of roads and buffers
    [ road ] = initialization( E,NT,L,N,a,b,h,mu,rMax,p0,r0 );
    
    % Compute shock speeds
    road.s{2}(1) = (f(p0(2))-mu(2))/(p0(2)-(5-sqrt(5))/10);
    road.s{2}(2) = (mu(2)-f(p0(1)))/(((5-sqrt(5))/10)-p0(1));
    
    % Compute t s.t. r(t)=0 
    tbar = r0(2)/0.11;
    
    % Compute solution
     for tn = 2:length(tt)

         road.rho{1}(:,tn) = 0.1;

         for xi = 1:length(road.xV{2})
             if ( road.xV{2}(xi) < road.s{2}(2)*(tt(tn)-tbar) )
                 road.rho{2}(xi,tn) = p0(1);
             elseif ( road.s{2}(2)*(tt(tn)-tbar) <= road.xV{2}(xi) && road.xV{2}(xi) < road.s{2}(1)*tt(tn) )
                 road.rho{2}(xi,tn) = (5-sqrt(5))/10; 
             elseif ( road.xV{2}(xi) > road.s{2}(1)*tt(tn) )
                 road.rho{2}(xi,tn) = p0(2); 
             end
         end
         
         if (tt(tn) < tbar)
             road.r{2}(tn) = road.r{2}(tn-1)-0.11*(tt(tn)-tt(tn-1));
         else
             road.r{2}(tn) = 0;
         end
     end
     
end