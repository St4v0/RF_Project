function thetas = calctheta (Xc,Yc,alpha,oui)
Sa = 170;
L = 130;
Rplat = 130;
Rbase =290;

basex = [0 sqrt(3)*Rbase sqrt(3)*Rbase/2 0];
basey = [0 0 3/2*Rbase 0];

phi = [alpha+30; alpha+150; alpha+270];

for i = 1:3
    PP(:,i) = [Xc-Rplat*cosd(phi(i));Yc-Rplat*sind(phi(i))];
    c(:,i) = atan2d(PP(2,i)-basey(i), PP(1,i)-basex(i));
    
    PBPP(:,i) = ((PP(1,i)-basex(i))^2 + (PP(2,i)-basey(i))^2);
    d(:,i) = acosd((Sa^2-L^2+PBPP(i))/(2*Sa*realsqrt(PBPP(i))));
    
    theta1(:,i) = c(i)+d(i);
    theta2(:,i) = c(i)-d(i);

    M(:,i) = [Sa*cosd(theta1(:,i));Sa*sind(theta1(:,i))];
    psi(:,i) = atan2d(PP(2,i)-M(2,i)/L,PP(1,i)-M(1,i)/L);
   
end
arm1 = [[basex(1),  basex(1)+M(1, 1), PP(1, 1)]; [basey(1),  basey(1)+M(2,1), PP(2,1)]];
arm2 = [[basex(2),  basex(2)+M(1, 2), PP(1, 2)]; [basey(2),  basey(2)+M(2,2), PP(2,2)]];
arm3 = [[basex(3),  basex(3)+M(1, 3), PP(1, 3)]; [basey(3),  basey(3)+M(2,3), PP(2,3)]];

plat = [PP(1,1) PP(1,2) PP(1,3) PP(1,1); PP(2,1) PP(2,2) PP(2,3) PP(2,1)];

if oui == 0   
    hold on
    set(gcf,'Visible','on','Position', [10 10 600 400])

    plot(basex,basey)
    plot(arm1(1,:),arm1(2,:))
    plot(arm2(1,:),arm2(2,:))
    plot(arm3(1,:),arm3(2,:))
    plot(plat(1,:),plat(2,:))
    plot(Xc,Yc)

    hold off
    
elseif oui == 1
    hold on
    set(gcf,'Visible','on','Position', [10 10 600 400])

%     plot(basex,basey,'b')
%     plot(plat(1,:),plat(2,:),'x')
    
    hold off
end

thetas = plat;
end