% Aim of the script is to calculate the error and convergence order of
% three different numerical methods for Case 2(ii)

% Initialization
E     = 2;         % total number of roads
L     = [1,1];     % vector with length of each road
a     = [-1,0];    % vecotr with starting point of each road
b     = [0,1];     % vector with end point of each road
N     = [200,200]; % vector with total number of space dicretizaton points
T     = 1.8;       % time horizon
eps   = 1.e-10;    % accuracy
sigma = 0.5;       % f^max = f(sigma)
CFL   = 0.5;       % coefficient of CFL condition

%% Case 2(ii):
% Road 1: Constant density, zero buffer
% Road 2: Shock with positive speed and buffer decreases simulanteously
%         until buffer is empty, then second shock with positive speed 
%         starts at the junction and buffer remains zero
mu   = [0.25, 0.2];            
rMax = [Inf, 0.3];             
r0   = [0,0.15];                
p0   = [0.1,0.45];             
fin  = @(tn) f(0.1);

%% Calculate numerical solution by different methods
[ roadLxF,tt ] = num_sol( E,L,a,b,N,T,eps,mu,rMax,r0,p0,CFL,@f,sigma,fin,@s,@d,@sB,@dB,@d1,"LxF");
[ roadmod_LxF,~ ] = num_sol( E,L,a,b,N,T,eps,mu,rMax,r0,p0,CFL,@f,sigma,fin,@s,@d,@sB,@dB,@d1,"mod_LxF");
[ roadG,~ ] = num_sol( E,L,a,b,N,T,eps,mu,rMax,r0,p0,CFL,@f,sigma,fin,@s,@d,@sB,@dB,@d1,"Godunov");

[roadE] = exactSolCase2(E,L,a,b,N,T,mu,rMax,r0,p0,CFL,@f);

%% Plot 

% Plot three numerical solutions and the exact solution
%plot3approx1exact(roadLxF,roadmod_LxF,roadG,roadE,tt,T)

% Plot three numerical solutions and the exact solution for the last time step
 plot3approx1exact_lastTimeStep(roadLxF,roadmod_LxF,roadG,roadE,tt,T)


% %% Write to csv. file
% header_1 = {'x','LxF','Godunov','Mod LxF','Exact'};
% data_2_road2 = [roadLxF.xV{2}', roadLxF.rho{2}(:,end), roadG.rho{2}(:,end), roadmod_LxF.rho{2}(:,end),roadE.rho{2}(:,end)];
% header_2 = {'time','LxF','Godunov','Mod LxF','Exact'};
% data_2_r2 = [tt'  roadLxF.r{2}, roadG.r{2}, roadmod_LxF.r{2},roadE.r{2}];
% csvwrite_with_headers('Case2road2.csv',data_2_road2,header_1);
% csvwrite_with_headers('Case2r2.csv',data_2_r2,header_2);


% %% PART 2: Calculate the error and estimate the order of the methods
% % Calculate errors Linf, L1, L2 for N = 10*2^n, n=n1:n2
% n1 = 0;
% n2 = 6;
% n = n1:n2;
% [ eLinf_LxF,eLinf_mod_LxF,eLinf_G,eL1_LxF,eL1_mod_LxF,eL1_G,eL2_LxF,eL2_mod_LxF,eL2_G] = error_calculation_Case2( n1,n2,E,L,a,b,T,eps,mu,rMax,r0,p0,CFL,@f,sigma,fin,@s,@d,@sB,@dB,@d1 );
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
% csvwrite_with_headers('L1_error_Case2.csv',data_L1,header);
% 
% % Order estimate (vector)
% data_L1_pv = [n' , [0;pv_LxF] , [0;pv_G] , [0;pv_mod_LxF] ];
% csvwrite_with_headers('L1_order_stepwise_Case2.csv',data_L1_pv,header);
% 
% % Order estimate (mean) in csv files
% header_p = {'p'};
% data_L1_p = [p_LxF,p_G,p_mod_LxF];
% csvwrite_with_headers('L1_order_Case2.csv',round(data_L1_p,2)',header_p);


