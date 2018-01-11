%% Error calculation for three methods and thre norms

function [ eLinf_LxF,eLinf_mod_LxF,eLinf_G,eL1_LxF,eL1_mod_LxF,eL1_G,eL2_LxF,eL2_mod_LxF,eL2_G] = error_calculation( n1,n2,E,L,a,b,T,eps,mu,rMax,r0,p0,CFL,f,sigma,fin,s,d,sB,dB,d1 )

m = n2-n1+1;

eLinf_LxF = zeros(E,m);
eLinf_mod_LxF = zeros(E,m);
eLinf_G = zeros(E,m);

eL1_LxF = zeros(E,m);
eL1_mod_LxF = zeros(E,m);
eL1_G = zeros(E,m);

eL2_LxF = zeros(E,m);
eL2_mod_LxF = zeros(E,m);
eL2_G = zeros(E,m);

for n=n1:n2
    n
    N=10*2^n*ones(1,2); 
    h      = L./(N);
    
    % Calculate numerical solutions
    [ roadLxF,~ ]    = num_sol( E,L,a,b,N,T,eps,mu,rMax,r0,p0,CFL,f,sigma,fin,s,d,sB,dB,d1,"LxF");
    [ roadmod_LxF,~ ] = num_sol( E,L,a,b,N,T,eps,mu,rMax,r0,p0,CFL,f,sigma,fin,s,d,sB,dB,d1,"mod_LxF");
    [ roadG,~ ]       = num_sol( E,L,a,b,N,T,eps,mu,rMax,r0,p0,CFL,f,sigma,fin,s,d,sB,dB,d1,"Godunov");

    % Calculate exact solution
    [roadE] = exactSolCase1(E,L,a,b,N,T,mu,rMax,r0,p0,CFL,f);

    % Calculate the errors
    eLinf_LxF(1:E+1,n-n1+1)     = error_Linf(E,roadLxF,roadE);
    eLinf_mod_LxF(1:E+1,n-n1+1) = error_Linf(E,roadmod_LxF,roadE);
    eLinf_G(1:E+1,n-n1+1)       = error_Linf(E,roadG,roadE);

    eL1_LxF(1:E+1,n-n1+1)     = error_L1(E,h,roadLxF,roadE);
    eL1_mod_LxF(1:E+1,n-n1+1) = error_L1(E,h,roadmod_LxF,roadE);
    eL1_G(1:E+1,n-n1+1)       = error_L1(E,h,roadG,roadE);

    eL2_LxF(1:E+1,n-n1+1)     = error_L2(E,h,roadLxF,roadE);
    eL2_mod_LxF(1:E+1,n-n1+1) = error_L2(E,h,roadmod_LxF,roadE);
    eL2_G(1:E+1,n-n1+1)       = error_L2(E,h,roadG,roadE);
end

end