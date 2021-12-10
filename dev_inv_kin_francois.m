q1 = 0;
q2 = 90;
q3 = 0;
q4 = -90;
q5 = 0;
L_q = [q1 q2 q3 q4 q5];


pos = forward_kinematics(L_q)

%Inverse Kinematics
inv_mat=inverse_kin( 0,0,0.4630,pi/2,0)
