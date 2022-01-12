function [mylist,drawing] = plot_links( thetas )

theta1 = thetas( 1 );
theta2 = thetas( 2 );
theta3 = thetas( 3 );
theta4 = thetas( 4 );
theta5 = thetas( 5 );

d1 =0.079;
L1 =0.121;
L2 =0.121;
L3 =0.142;
%max height 0.463

x1 = 0;
y1 = 0;
z1 = d1;

x2 = cosd( theta1 )*( ( L1*cosd( theta2 ) ) );
y2 = sind( theta1 )*( ( L1*cosd( theta2 ) ) );
z2 = ( ( L1*sind( theta2 ) ) ) + d1;

x3 = cosd( theta1 )*( ( L1*cosd( theta2 ) ) + ( L2*cosd( theta2 + theta3 ) ) );
y3 = sind( theta1 )*( ( L1*cosd( theta2 ) ) + ( L2*cosd( theta2 + theta3 ) ) );
z3 = ( ( L2*sind( theta2 + theta3 ) ) + ( L1*sind( theta2 ) ) ) + d1;

xt = cosd( theta1 )*( ( L1*cosd( theta2 ) ) + ( L2*cosd( theta2 + theta3 ) ) + ( L3*cosd( theta2 + theta3 + theta4 ) ) );
yt = sind( theta1 )*( ( L1*cosd( theta2 ) ) + ( L2*cosd( theta2 + theta3 ) ) + ( L3*cosd( theta2 + theta3 + theta4 ) ) );
zt = ( L3*sind( theta2 + theta3 + theta4 ) ) + ( L2*sind( theta2 + theta3 ) ) + ( L1*sind( theta2 ) ) + d1;

x_list = [0 x1 x2 x3 xt xt];
y_list = [0 y1 y2 y3 yt yt];
z_list = [0 z1 z2 z3 zt zt];

mylist = [x_list ; y_list; z_list];
hold on
axis equal
set( gca,'XLim',[0 0.3],'YLim',[-0.3 0.3],'ZLim',[0 0.4] )
set( gcf,'Visible','on','Position', [10 10 600 400] )
xlabel( 'x ( m )' ) ; ylabel( 'y ( m )' ) ; zlabel( 'z ( m )' ) ;
view( 147,25 )
grid on

drawing = plot3( x_list,y_list,z_list,'k-o' );
plot3( x_list( end ),y_list( end ),z_list( end ),'r-x' );

end
