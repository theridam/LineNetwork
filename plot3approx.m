%% Plot THREE numerical solutions: 
% first row: density on road 1 and road 2
% second row: buffer in front of road 1 and road 2

function [] = plot3approx(road1,road2,road3,tt,T)

    figure
   
    % Use LaTex font
    set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
    set(groot, 'defaultLegendInterpreter','latex');
    
    % Plot p_1, p_2, r_1, r_2
    s1 = subplot(2,2,1);
    s2 = subplot(2,2,2);
    s3 = subplot(2,2,3);
    s4 = subplot(2,2,4);
  
    hold(s3,'on')
    hold(s4,'on')
   
    for tn=1:length( tt )
        plot(s1,road1.xV{1},road1.rho{1}(:,tn),road2.xV{1},road2.rho{1}(:,tn),road3.xV{1},road3.rho{1}(:,tn))
        axis(s1,[-1 0 0 1])
        xlabel(s1,'x','Interpreter','latex')
        ylabel(s1,'density $\rho_1$','Interpreter','latex')
        
        plot(s2,road1.xV{2},road1.rho{2}(:,tn),road2.xV{2},road2.rho{2}(:,tn),road3.xV{2},road3.rho{2}(:,tn))
        axis(s2,[0 1 0 1])
        xlabel(s2,'x','Interpreter','latex')
        ylabel(s2,'density $\rho_2$','Interpreter','latex')
        
        plot(s3,tt(tn),road1.r{1}(tn),tt(tn),road2.r{1}(tn),tt(tn),road3.r{1}(tn),'.','MarkerSize',3)
        box(s3,'on')
        axis(s3,[0,T,0,road1.rMax{2}]);
        xlabel(s3,'t','Interpreter','latex')
        ylabel(s3,'buffer $r_1$','Interpreter','latex')
        
        plot(s4,tt(tn),road1.r{2}(tn),tt(tn),road2.r{2}(tn),tt(tn),road3.r{2}(tn),'.','MarkerSize',3)
        box(s4,'on')
        axis(s4,[0,T,0,road1.rMax{2}]);
        xlabel(s4,'t','Interpreter','latex')
        ylabel(s4,'buffer $r_2$','Interpreter','latex')
         
        drawnow(); 
    end
    hold(s3,'off')
    hold(s4,'off')
end