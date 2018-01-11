% Aim of the script is to calculate the error and convergence order of
% three different numerical methods for Case 1(i)

% Initialization
E     = 2;         % total number of roads
L     = [1,1];     % vector with length of each road
a     = [-1,0];    % vecotr with starting point of each road
b     = [0,1];     % vector with end point of each road
N     = [100,100]; % vector with total number of space dicretizaton points
T     = 6;         % time horizon
eps   = 1.e-10;    % accuracy
sigma = 0.5;       % f^max = f(sigma)
CFL   = 0.5;       % coefficient of CFL condition


%% Case 1(i): 
% Road 1: Shock with negative speed, zero buffer until shock reachs a_1,
%         then, r-1 increases
% Road 2: Shock with positive speed, rarefaction at the end of the road
mu   = [0.25,0.2];        
rMax = [Inf,0.3];        
r0   = [0,0];            
p0   = [0.4,0.7];        
fin  = @(tn) f(0.4);

%% PART 1: Calculate and plot numerical solutions and exact solution for Case 1(i)
% Calculate numerical solution by different methods
% important: set "q = f(road.rho{e}(NNP,ti));" in outflow.m (consider a
%            constant outflow on the last road and not a maximal outflow)
[ roadLxF,tt ] = num_sol( E,L,a,b,N,T,eps,mu,rMax,r0,p0,CFL,@f,sigma,fin,@s,@d,@sB,@dB,@d1,"LxF");
[ roadmod_LxF,~ ] = num_sol( E,L,a,b,N,T,eps,mu,rMax,r0,p0,CFL,@f,sigma,fin,@s,@d,@sB,@dB,@d1,"mod_LxF");
[ roadG, ] = num_sol( E,L,a,b,N,T,eps,mu,rMax,r0,p0,CFL,@f,sigma,fin,@s,@d,@sB,@dB,@d1,"Godunov");

% Calculate exact solution
 [roadE] = exactSolCase1(E,L,a,b,N,T,mu,rMax,r0,p0,CFL,@f);

% Plot the numerical solutions together with the exact solution
% (time-dependent)
% plot3approx1exact(roadLxF,roadmod_LxF,roadG,roadE,tt,T)

% Plot the numerical solution together with the exact solution
% (last time step)
 plot3approx1exact_lastTimeStep(roadLxF,roadmod_LxF,roadG,roadE,tt,T)
 
% Plot one of the approx solution 
% plot1approx_lastTimeStep(roadLxF,tt,T)
 
% % Write to csv. file
% header_1i = {'x','LxF','Godunov','Mod LxF','Exact'};
% data_1i_road1 = [roadLxF.xV{1}', roadLxF.rho{1}(:,end), roadG.rho{1}(:,end), roadmod_LxF.rho{1}(:,end),roadE.rho{1}(:,end)];
% data_1i_road2 = [roadLxF.xV{2}', roadLxF.rho{2}(:,end), roadG.rho{2}(:,end), roadmod_LxF.rho{2}(:,end),roadE.rho{2}(:,end)];
% csvwrite_with_headers('Case1iroad1.csv',data_1i_road1,header_1i);
% csvwrite_with_headers('Case1iroad2.csv',data_1i_road2,header_1i);


% %% PART 2: Calculate the error and estimate the order of the methods
% % Calculate errors Linf, L1, L2 for N = 10*2^n, n=n1:n2
% n1 = 0;
% n2 = 7;
% n = n1:n2;
% [ eLinf_LxF,eLinf_mod_LxF,eLinf_G,eL1_LxF,eL1_mod_LxF,eL1_G,eL2_LxF,eL2_mod_LxF,eL2_G] = error_calculation( n1,n2,E,L,a,b,T,eps,mu,rMax,r0,p0,CFL,@f,sigma,fin,@s,@d,@sB,@dB,@d1 );
% 
% %% Order Estimate stepwise (in L1 norm)
% % Calculate order (= convergence rate) estimate for each h
% h = 0.1*2.^(-n);
% [ pv_LxF ]     = order_estimate_stepwise( h, eL1_LxF(1,:)' );
% [ pv_G ]       = order_estimate_stepwise( h, eL1_G(1,:)' );
% [ pv_mod_LxF ] = order_estimate_stepwise( h, eL1_mod_LxF(1,:)' );
% 
% %% Order Estimate (polyfit)
% % Calculate order estimate
% [ p_LxF ] = order_estimate( h, eL1_LxF(1,:) );
% [ p_G ] = order_estimate( h, eL1_G(1,:) );
% [ p_mod_LxF ] = order_estimate( h, eL1_mod_LxF(1,:) );
% 
% 
% %% Write results to csv files
% % Error in L1 norm and order estimate (mean)
% header = {'n','LxF','Godunov','Mod LxF'};
% data_L1 = [n', eL1_LxF(1,:)',eL1_G(1,:)',eL1_mod_LxF(1,:)'];
% csvwrite_with_headers('L1_error.csv',data_L1,header);
% 
% % Order estimate (vector)
% data_L1_pv = [n' , [0;pv_LxF] , [0;pv_G] , [0;pv_mod_LxF] ];
% csvwrite_with_headers('L1_order_stepwise.csv',data_L1_pv,header);
% 
% % Order estimate (mean) in csv files
% header_p = {'p'};
% data_L1_p = [p_LxF,p_G,p_mod_LxF];
% csvwrite_with_headers('L1_order.csv',round(data_L1_p,2)',header_p);

