%% Numerical Solution

function [ road,tt ] = num_sol( E,L,a,b,N,T,eps,mu,rMax,r0,p0,CFL,f,sigma,fin,s,d,sB,dB,d1,method )

    % Compute grid variables
    [ h,tau,lambda,NT,tt ] = grid_variables( L,N,T,CFL );
    
    % Initialization of roads and buffers
    [ road ] = initialization( E,NT,L,N,a,b,h,mu,rMax,p0,r0 );  
    
    for tn = 1:NT-1
        for e = 1:E
            
            % Inflow
            [ road.inflow{e}(tn) ] = inflow( e,tn,road,f,sigma,fin,s,d,dB,d1 );
   
            % Outflow
            [ road.outflow{e}(tn) ] = outflow( e,tn,E,road,f,sigma,s,d,sB );
         
            % Solving the PDE according to the required method
            if (method == "LxF")
                [ road ] = LxF( e,tn,tau,h,road,f );
            elseif (method == "mod_LxF")
                [ road ] = mod_LxF( e,tn,tau,h,road,f );
            elseif (method == "Godunov")
                [ road ] = godunov( e,tn,tau,h,road,f,sigma,s,d );
            end

            % Explicit Euler Method: Solving ODE for buffer r
            [ road ] = exp_Euler( e,tn,tau,road,fin );

            % Condition: 0 <= r(t) <= rMax
            [ road ] = cond_r( e,tn,road,eps );
            
        end
    end
    
    
    
end

