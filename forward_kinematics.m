function end_pos = forward_kinematics(L_q)
% angles des liaisons pivots en RAD
Q1 = L_q(1);
Q2 =L_q(2);
Q3 =L_q(3);
Q4 =L_q(4);
Q5 =L_q(5);

d1 =0.079;
L1 =0.121;
L2 =0.121;
L3 =0.142;

%calculate the matrixes
T_01 = create_T_ij_matrice(0 , 0    , 0  ,0);
T_12 = create_T_ij_matrice(0 , 90 ,   d1 ,Q1);
T_23 = create_T_ij_matrice(L1, 0    , 0  ,Q2);
T_34 = create_T_ij_matrice(L2, 0    , 0  ,Q3);
T_45 = create_T_ij_matrice(0 , -90,   0  ,Q4);
T_56 = create_T_ij_matrice(0 , 0    , L3 ,Q5);


T_16 = T_12 * T_23  *T_34 *T_45 *T_56;

%T_16(ligne, colonne)

PSI = Q2+Q3+Q4;
WRIST_ANGLE = Q5;

xt = cosd(Q1)*((L3*cosd(Q2+Q3+Q4))+(L2*cosd(Q2+Q3))+(L1*cosd(Q2)));
yt = sind(Q1)*((L3*cosd(Q2+Q3+Q4))+(L2*cosd(Q2+Q3))+(L1*cosd(Q2)));
zt = (L3*sind(Q2+Q3+Q4))+(L2*sind(Q2+Q3))+(L1*sind(Q2))+d1;

end_pos = [xt yt zt PSI WRIST_ANGLE];

%end_pos = [T_16(1,4) T_16(2,4) T_16(3,4) PSI WRIST_ANGLE];

end