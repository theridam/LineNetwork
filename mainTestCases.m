% Script shows different cases related to the proof of Lemma (Existence,
% Uniqueness of solution at a junction with bounded buffer)

% Initialization
E     = 2;         % total number of roads
L     = [1,1];     % vector with length of each road
a     = [-1,0];    % vecotr with starting point of each road
b     = [0,1];     % vector with end point of each road
N     = [100,100]; % vector with total number of space dicretizaton points
T     = 5;         % time horizon
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
%% Case 1(ii): 
% Zero Wave and zero buffer
% mu    = [0.25, 0.2];                      
% rMax  = [Inf, 0.3];                       
% r0    = [0,0];                            
% p0    = [(5-sqrt(5))/10,(5-sqrt(5))/10];  
% fin  = @(tn) f((5-sqrt(5))/10);
%% Case 1(iv): 
% Road 1: Constant density, zero buffer
% Road 2: Shock with positive speed, rarefaction at the end of the road,
%         zero buffer
% mu   = [0.25, 0.2];            
% rMax = [Inf, 0.3];             
% r0   = [0,0];                  
% p0   = [(5-sqrt(5))/10,0.7];  
% fin  = @(tn) f((5-sqrt(5))/10);
%% Case 2(ii):
% Road 1: Constant density, zero buffer
% Road 2: Shock with positive speed and buffer decreases simulanteously
%         until buffer is empty, then second shock with positive speed 
%         starts at the junction and buffer remains zero
% mu   = [0.25, 0.2];            
% rMax = [Inf, 0.3];             
% r0   = [0,0.1];                
% p0   = [0.1,0.4];             
% fin  = @(tn) f(0.1);
%% Case 4(iii): 
% Road 1: Rarefaction with negative speed, zero buffer
% Road 2: Rarefaction with positive speed, zero buffer
% mu   = [0.25, 0.3];            
% rMax = [Inf, 0.3];             
% r0   = [0,0];                
% p0   = [0.6,0.3];             
% fin  = @(tn) f(0.6);


%% Calculate numerical solution by different methods
[ roadLxF,tt ] = num_sol( E,L,a,b,N,T,eps,mu,rMax,r0,p0,CFL,@f,sigma,fin,@s,@d,@sB,@dB,@d1,"LxF");
[ roadmod_LxF,~ ] = num_sol( E,L,a,b,N,T,eps,mu,rMax,r0,p0,CFL,@f,sigma,fin,@s,@d,@sB,@dB,@d1,"mod_LxF");
[ roadG,~ ] = num_sol( E,L,a,b,N,T,eps,mu,rMax,r0,p0,CFL,@f,sigma,fin,@s,@d,@sB,@dB,@d1,"Godunov");

%% Plot three numerical solutions
plot3approx(roadLxF,roadmod_LxF,roadG,tt,T)

%% Plot three numerical solutions for the last time step
%plot3approx_lastTimeStep(roadLxF,roadmod_LxF,roadG,tt,T)

%% Plot one numerical solution
%plot1approx(roadLxF,tt,T)

