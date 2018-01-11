%% Plot THREE numerical solutions only for the LAST time step: 
% first row: density on road 1 and road 2
% second row: buffer in front of road 1 and road 2

function [] = plot3approx_lastTimeStep(road1,road2,road3,tt,T)

    figure
   
    % Use LaTex font
    set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
    set(groot, 'defaultLegendInterpreter','latex');
    
    % Plot p_1, p_2, r_1, r_2
    s1 = subplot(2,2,1);
    s2 = subplot(2,2,2);
    s3 = subplot(2,2,3);
    s4 = subplot(2,2,4);
  
    plot(s1,road1.xV{1},road1.rho{1}(:,end),road2.xV{1},road2.rho{1}(:,end),road3.xV{1},road3.rho{1}(:,end))
    axis(s1,[-1 0 0 1])
    xlabel(s1,'x','Interpreter','latex')
    ylabel(s1,'density $\rho_1$','Interpreter','latex')
        
    plot(s2,road1.xV{2},road1.rho{2}(:,end),road2.xV{2},road2.rho{2}(:,end),road3.xV{2},road3.rho{2}(:,end))
    axis(s2,[0 1 0 1])
    xlabel(s2,'x','Interpreter','latex')
    ylabel(s2,'density $\rho_2$','Interpreter','latex')
        
    plot(s3,tt,road1.r{1},tt,road2.r{1},tt,road3.r{1},'.','MarkerSize',3)
    box(s3,'on')
    axis(s3,[0,T,0,road1.rMax{2}]);
    xlabel(s3,'t','Interpreter','latex')
    ylabel(s3,'buffer $r_1$','Interpreter','latex')
        
    plot(s4,tt,road1.r{2},tt,road2.r{2},tt,road3.r{2},'.','MarkerSize',3)
    box(s4,'on')
    axis(s4,[0,T,0,road1.rMax{2}]);
    xlabel(s4,'t','Interpreter','latex')
    ylabel(s4,'buffer $r_2$','Interpreter','latex')

end