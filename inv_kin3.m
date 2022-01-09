function theta_re = inv_kin3(xinv, yinv, zinv, Psi,Wrist_angle)
    d1=1;
    L1=1;
    L2=1;
    L3=1;

    Theta1 = atan2d(yinv, xinv);
    R = L3*cosd(Psi);
%     xPrime = xinv - (R*cosd(Theta1));
%     yPrime = yinv - (R*sind(Theta1));
    zPrime = zinv - (L3 * sind(Psi));

    rPrime = realsqrt(xinv^2 + yinv^2) - R;
    N = realsqrt((zPrime - d1)^2 + rPrime^2);
    gamma = atan2d((zPrime - d1), rPrime);
    Theta2_a = gamma - acosd((N^2 + L1^2 - L2^2) / (2*L1*N));
    Theta2_b = gamma + acosd((N^2 + L1^2 - L2^2) / (2*L1*N));

    Theta3_a = +acosd((N^2 - L1^2 - L2^2)/(2*L1*L2));
    Theta3_b = -1*acosd((N^2 - L1^2 - L2^2)/(2*L1*L2));
    Theta4_a = Psi - Theta2_a - Theta3_a;
    Theta4_b = Psi - Theta2_b - Theta3_b;
    
    theta_re = [Theta1, Theta2_a, Theta3_a, Theta4_a, Wrist_angle];

               %Theta1, Theta2_b, Theta3_b, Theta4_b;]

end