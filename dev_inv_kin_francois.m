q1 = 0;
q2 = 0;
q3 = 0;
q4 = 0;
q5 = 0;
L_q = [q1 q2 q3 q4 q5];
pos = forward_kinematics(L_q);

%Inverse Kinematics
inv_mat=inverse_kin(0,0,0.3,90,0)

