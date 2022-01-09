function [X,Y,Z] = plot_obstacle(r)
% angles des liaisons pivots en RAD

hold on
axis equal
set(gca,'XLim',[0 0.3],'YLim',[-0.3 0.3],'ZLim',[0 0.4])
set(gcf,'Visible','on')
title('3D Workspace') ; xlabel('x (m)') ; ylabel('y (m)') ; zlabel('z (m)') ;
view(147,25)
grid on


[X,Y,Z] = cylinder(r);

%Specify a height of 20 by modifying the Z coordinate. Plot the cylinder.

h = 10;
Z = Z*h;
surf(Z,Y,X)

end
