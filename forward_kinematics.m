function end_pos = forward_kinematics(L_q)
theta1 = L_q(1);
theta2 = L_q(2);
theta3 = L_q(3);
theta4 = L_q(4);
theta5 = L_q(5);

d1 =0.079;
L1 =0.121;
L2 =0.121;
L3 =0.142;

PSI = theta2+theta3+theta4;
WRIST_ANGLE = theta5;

xt = cosd( theta1 )*( ( L1*cosd( theta2 ) ) + ( L2*cosd( theta2 + theta3 ) ) + ( L3*cosd( theta2 + theta3 + theta4 ) ) );
yt = sind( theta1 )*( ( L1*cosd( theta2 ) ) + ( L2*cosd( theta2 + theta3 ) ) + ( L3*cosd( theta2 + theta3 + theta4 ) ) );
zt = ( L3*sind( theta2 + theta3 + theta4 ) ) + ( L2*sind( theta2 + theta3 ) ) + ( L1*sind( theta2 ) ) + d1;


end_pos = [xt yt zt PSI WRIST_ANGLE];

end