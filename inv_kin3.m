function theta_inverse = inv_kin3(x, y, z, Psi,Wrist_angle,sigma)
    d1 =0.079;
    L1 =0.121;
    L2 =0.121;
    L3 =0.142;

    
    rho_prime = realsqrt(x^2 + y^2) - L3 * cosd(Psi);

    z_prime = z - d1 - (L3 * sind(Psi));

    gamma = atan2d(z_prime, rho_prime);

    N = realsqrt((z_prime)^2 + rho_prime^2);

    theta2 = gamma + sigma * acosd((N^2 + L1^2 - L2^2) / (2*L1*N)); 

    theta3 = atan2d((z_prime-L1*sind(theta2))/L2,(rho_prime-L1*cosd(theta2))/L2) - theta2;

    theta4 = Psi - theta2 - theta3;
    
    theta1 = atan2d(y, x);
    theta5 = Wrist_angle;
    theta_inverse = [theta1, theta2, theta3, theta4, theta5];

end