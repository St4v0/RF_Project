function end_pos = forward_kinematics(L_q)
% angles des liaisons pivots en RAD
Q1 = L_q(1);
Q2 =L_q(2);
Q3 =L_q(3);
Q4 =L_q(4);
Q5 =L_q(5);

d1 = 1; %0.079;
L1 = 1; %0.121;
L2 = 1; %0.121;
L3 = 1; %0.142;

%calculate the matrixes
T_01 = create_T_ij_matrice(0 , 0    , 0  ,0);
T_12 = create_T_ij_matrice(0 , 90 ,   d1 ,Q1);
T_23 = create_T_ij_matrice(L1, 0    , 0  ,Q2);
T_34 = create_T_ij_matrice(L2, 0    , 0  ,Q3);
T_45 = create_T_ij_matrice(0 , -90,   0  ,Q4);
T_56 = create_T_ij_matrice(0 , 0    , L3 ,Q5);


T_16 = T_12 * T_23  *T_34 *T_45 *T_56;

%T_16(ligne, colonne)

%compute euler angles from rotation matrix:
if (abs(T_16(3,1)) ~= 1)
    Euler_theta = -asin(T_16(3,1));
    Euler_psi = atan2(T_16(3,2)/cos(Euler_theta),T_16(3,3)/cos(Euler_theta));
    Euler_phi = atan2(T_16(2,1)/cos(Euler_theta),T_16(1,1)/cos(Euler_theta));
else
    Euler_phi = 0;
    if (T_16(3,1) == -1)
        Euler_theta = pi/2;
        Euler_psi = Euler_phi + atan2(T_16(1,2),T_16(1,3));
    else
        Euler_theta = -pi/2;
        Euler_psi = -Euler_phi + atan2(-T_16(1,2),-T_16(1,3));
    end

end

end_pos = [T_16(1,4) T_16(2,4) T_16(3,4) Euler_phi Euler_theta Euler_psi];

end