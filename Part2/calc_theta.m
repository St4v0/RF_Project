function thetas = calc_theta(Xc,Yc,alpha)
Sa = 170;
L = 130;
Rplat = 130;
Rbase =390;

Rsa = Sa + Rplat;

CPP1 = [-Rplat*cos(pi/6); -Rplat*sin(pi/6); 0];
CPP2 = [-Rplat*cos(5*pi/6); -Rplat*sin(5*pi/6); 0];
CPP3 = [-Rplat*cos(3*pi/2); -Rplat*sin(3*pi/2); 0];

BC = [Xc ; Yc; 0];
Rbc = [cos(alpha) -sin(alpha) 0; sin(alpha) cos(alpha) 0; 0 0 1];


BPP1 = Rbc*CPP1+BC;
BPP2 = Rbc*CPP2+BC;
BPP3 = Rbc*CPP1+BC;

BPB1= [-Rbase*cos(pi/6); -Rbase*sin(pi/6); 0];
BPB2= [-Rbase*cos(5*pi/6); -Rbase*sin(5*pi/6); 0];
BPB3= [-Rbase*cos(3*pi/6); -Rbase*sin(3*pi/2); 0];

xpp1=BPP1(1,1)-BPB1(1,1);
xpp2=BPP2(1,1)-BPB2(1,1);
xpp3=BPP3(1,1)-BPB3(1,1);

ypp1=BPP1(2,1)-BPB1(2,1);
ypp2=BPP2(2,1)-BPB2(2,1);
ypp3=BPP3(2,1)-BPB3(2,1);

xpp=[xpp1 xpp2 xpp3];
ypp=[ypp1 ypp2 ypp3];

e1=-2*ypp*Rsa
e2=-2*xpp*Rsa
e3=xpp.^2+ypp.^2+Rsa^2-L^2

t11=(-e1(1,1)+sqrt(e1(1,1)^2+e2(1,1)^2-e3(1,1)^2))/(e3(1,1)-e2(1,1))
t21=(-e1(1,1)-sqrt(e1(1,1)^2+e2(1,1)^2-e3(1,1)^2))/(e3(1,1)-e2(1,1));
t12=(-e1(1,2)+sqrt(e1(1,2)^2+e2(1,2)^2-e3(1,2)^2))/(e3(1,2)-e2(1,2))
t22=(-e1(1,2)-sqrt(e1(1,2)^2+e2(1,2)^2-e3(1,2)^2))/(e3(1,2)-e2(1,2));
t13=(-e1(1,3)+sqrt(e1(1,3)^2+e2(1,3)^2-e3(1,3)^2))/(e3(1,3)-e2(1,3))
t23=(-e1(1,3)-sqrt(e1(1,3)^2+e2(1,3)^2-e3(1,3)^2))/(e3(1,3)-e2(1,3));

theta11=2*atan(t11)
theta12=2*atan(t12)
theta13=2*atan(t13)

theta2=2*atan(t21);

thetas =[theta11 theta12 theta13];
end