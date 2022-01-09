function [maliste,drawing] = plot_links(thetas)
% angles des liaisons pivots en RAD
theta1 = thetas(1);
theta2 = thetas(2);
theta3 = thetas(3);
theta4 = thetas(4);
theta5 = thetas(5);

d1 =0.079;
L1 =0.121;
L2 =0.121;
L3 =0.142;
%max height 0.463

%calculate the matrixes
T_12 = create_T_ij_matrice(0 , 90  ,   d1 ,theta1);
T_23 = create_T_ij_matrice(L1, 0    , 0  ,theta2);
T_34 = create_T_ij_matrice(L2, 0    , 0  ,theta3);
T_45 = create_T_ij_matrice(0 , -90  ,   0  ,theta4);
T_56 = create_T_ij_matrice(0 , 0    , L3 ,theta5);

T_13 = T_12 * T_23;
T_14 = T_12 * T_23  *T_34;
T_15 = T_12 * T_23  *T_34 *T_45;
T_16 = T_12 * T_23  *T_34 *T_45 *T_56;

x2 = cosd(theta1)*((L1*cosd(theta2)));
y2 = sind(theta1)*((L1*cosd(theta2)));
z2 = (L3*(L1*sind(theta2)))+d1;

x3 = cosd(theta1)*((L2*cosd(theta2+theta3))+(L1*cosd(theta2)));
y3 = sind(theta1)*((L2*cosd(theta2+theta3))+(L1*cosd(theta2)));
z3 = ((L2*sind(theta2+theta3))+(L1*sind(theta2)))+d1;

xt = cosd(theta1)*((L3*cosd(theta2+theta3+theta4))+(L2*cosd(theta2+theta3))+(L1*cosd(theta2)));
yt = sind(theta1)*((L3*cosd(theta2+theta3+theta4))+(L2*cosd(theta2+theta3))+(L1*cosd(theta2)));
zt = (L3*sind(theta2+theta3+theta4))+(L2*sind(theta2+theta3))+(L1*sind(theta2))+d1;


xt = cosd(theta1)*((L3*cosd(theta2+theta3+theta4))+(L2*cosd(theta2+theta3))+(L1*cosd(theta2)));
yt = sind(theta1)*((L3*cosd(theta2+theta3+theta4))+(L2*cosd(theta2+theta3))+(L1*cosd(theta2)));
zt = (L3*sind(theta2+theta3+theta4))+(L2*sind(theta2+theta3))+(L1*sind(theta2))+d1;


x_list = [0 0 x2 x3 xt xt];
y_list = [0 0 y2 y3 yt yt];
z_list = [0 d1 z2 z3 zt zt];

maliste = [x_list ; y_list; z_list];
hold on
axis equal
set(gca,'XLim',[0 0.3],'YLim',[-0.3 0.3],'ZLim',[0 0.4])
set(gcf,'Visible','on')
title('3D Workspace') ; xlabel('x (m)') ; ylabel('y (m)') ; zlabel('z (m)') ;
view(147,25)
grid on

drawing = plot3(x_list,y_list,z_list,'k-o');
plot3(x_list(end),y_list(end),z_list(end),'r-x');

end
