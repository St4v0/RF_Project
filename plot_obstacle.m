function [X,Y,Z] = plot_obstacle(r)


hold on
axis equal
set(gca,'XLim',[0 0.3],'YLim',[-0.3 0.3],'ZLim',[0 0.4])
set(gcf,'Visible','on')
xlabel('x (m)') ; ylabel('y (m)') ; zlabel('z (m)') ;
view(147,25)
grid on


[X,Y,Z] = cylinder(r);
h = 10;
Z = Z*h;

surf(Z,Y,X,'FaceColor','interp')

end
