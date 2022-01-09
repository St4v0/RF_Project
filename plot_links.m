function maliste = plot_links(thetas)
% angles des liaisons pivots en RAD
theta1 = thetas(1);
theta2 = thetas(2);
theta3 = thetas(3);
theta4 = thetas(4);
theta5 = thetas(5);

d1 = 1; %0.079;
L1 = 1; %0.121;
L2 = 1; %0.121;
L3 = 1; %0.142;
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

x_list = [0 T_12(1,4) T_13(1,4) T_14(1,4) T_15(1,4) T_16(1,4)];
y_list = [0 T_12(2,4) T_13(2,4) T_14(2,4) T_15(2,4) T_16(2,4)];
z_list = [0 T_12(3,4) T_13(3,4) T_14(3,4) T_15(3,4) T_16(3,4)];

maliste = [x_list ; y_list; z_list];


plot3(x_list,y_list,z_list)
axis equal
title('3D Workspace') ; xlabel('x (m)') ; ylabel('y (m)') ; zlabel('z (m)') ;


end
