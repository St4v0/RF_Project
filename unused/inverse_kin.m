function thetas = inverse_kin(x,y,z,psi,theta)
d1 =0.079;
L1 =0.121;
L2 =0.121;
L3 =0.142;
rho_prime = sqrt(x*x+y*y)-L3*cos(psi);
z_prime = z-d1-L3*sin(psi);

P = -2*L1*rho_prime;
Q = -2*L1*z_prime;
R = rho_prime^2+z_prime^2+L1^2-L2^2;

sigma = 1;
gamma = atan2(-z_prime,rho_prime));


theta1 = atan2(y,x);

theta2 = gamma+sigma*acos(-R/(2*L1*sqrt(rho_prime^2+z_prime^2)));

theta3 = atan2((z_prime-L1*sin(theta2))/L2,(rho_prime-L1*cos(theta2))/L2)-theta2;
theta4 = psi-theta2-theta3;
theta5 = theta;

theta1 = rad2deg(theta1);
theta2 = rad2deg(theta2);
theta3 = rad2deg(theta3);
theta4 = rad2deg(theta4);
theta5 = rad2deg(theta5);


thetas=[theta1 theta2 theta3 theta4 theta5];
end