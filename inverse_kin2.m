function thetas2 = inverse_kin2(x,y,z,psi,theta)
d1 = 0.079;
L1 = 0.121;
L2 = 0.121;
L3 = 0.142;

gho = pi/2 - psi;

theta1 = atan2(y,x);

R   = L3*cos(-gho);
Pxw = x - R*cos(theta1);
Pyw = y - R*sin(theta1);
Pzw = z + L3*sin(gho);
Rw  = sqrt(Pxw^2+Pyw^2);
N   = sqrt((Pzw-L3)^2 + Rw^2);

gamma = atan2(Rw,Pzw-L3);
X=(N^2+L1^2-L2^2);
Y=(2*L1*N);
frac=(N^2+L1^2-L2^2)/(2*L1*N);
mu = acos((N^2+L1^2-L2^2)/(2*L1*N));

theta2 = gamma+mu;
theta3 = acos((N^2-L1^2-L2^2)/(2*L1*L2));
theta4 = psi-theta2-theta3;
theta5 = theta;

thetas2=[theta1 theta2 theta3 theta4 theta5];
end