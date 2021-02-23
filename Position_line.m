clear all
close all
clc

%% base coordinate 
radiusBase=290;
baselength=sqrt(3)*radiusBase; 
dist_vertex=130;
PBase1=[0,0];
PBase2=[baselength,0];
PBase3=[baselength/2,sqrt(3)*baselength/2];

%% link lenth (mm)
%lenth of first part arm from a, b and c edge
aa1=170;
bb1=170;
cc1=170;
%length of second part arm
L=130;

%%
%input the cartesian coordinate
xc=300;
yc=150;
alpha=0.1;
    
phi_1=alpha+pi/6;
phi_2=alpha+5*pi/6;
phi_3=alpha+3*pi/2;
     
%coordinate of three Base vertexs of the platform
pp1=[xc-dist_vertex*cos(phi_1),yc-dist_vertex*sin(phi_1)];
pp2=[xc+dist_vertex*cos(phi_2-pi),yc+dist_vertex*sin(phi_2-pi)];
pp3=[(xc-dist_vertex*cos(2*pi-phi_3)),yc+dist_vertex*sin(2*pi-phi_3)];
    
%parameter for theta1
c1=atan((yc-dist_vertex*sin(phi_1))/(xc-dist_vertex*cos(phi_1)));
d1=acos((aa1^2-L^2+norm(pp1-PBase1)*norm(pp1-PBase1))/(2*aa1*norm(pp1-PBase1)));
theta1=c1+d1;
    
%parameter for theta2
c2=atan2(pp2(2)-PBase2(2),pp2(1)-PBase2(1));
d2=acos((bb1^2-L^2+norm(pp2-PBase2)*norm(pp2-PBase2))/(2*bb1*norm(pp2-PBase2)));
theta2=c2+d2;
    
%parameter for theta3
c3=atan2(pp3(2)-PBase3(2),pp3(1)-PBase3(1));
d3=acos((cc1^2-L^2+norm(pp3-PBase3)*norm(pp3-PBase3))/(2*cc1*norm(pp3-PBase3)));
theta3=c3+d3;
    
%two position of M
M1=[aa1*cos(theta1),aa1*sin(theta1)]
M2=[baselength+bb1*cos(theta2),bb1*sin(theta2)];
M3=[baselength/2+cc1*cos(theta3),sqrt(3)*baselength/2+cc1*sin(theta3)];
    
%computed length for the second arm
L1=norm(M1-pp1);
L2=norm(M2-pp2);
L3=norm(M3-pp3);



if(L1-130<1e-5&&L2-130<1e-5&&L3-130<1e-5) 
%%plot the desired point
plot(xc, yc, 'mo')
hold on
%%plotting the base%%
xb=[PBase1(1) PBase2(1) PBase3(1) PBase1(1)]
yb=[PBase1(2) PBase2(2) PBase3(2) PBase1(2)]
plot(xb, yb , 'linewidth', 2)
hold on
%%plotting the top%%
xt=[pp1(1) pp2(1) pp3(1) pp1(1)];
yt=[pp1(2) pp2(2) pp3(2) pp1(2)];
plot(xt, yt , 'linewidth', 2)
hold on
%%plotting the line for first armABC%%
%for a
xa1=[PBase1(1) M1(1)];
ya1=[PBase1(2) M1(2)];
plot(xa1, ya1, 'linewidth', 2)
hold on 
%for b 
xa2=[PBase2(1) M2(1)];
ya2=[PBase2(2) M2(2)];
plot(xa2, ya2, 'linewidth', 2)
hold on
%for c
xa3=[PBase3(1) M3(1)];
ya3=[PBase3(2) M3(2)];
plot(xa3, ya3, 'linewidth', 2)
hold on


%%plotting the second arm%%
xb1=[M1(1) pp1(1)];
yb1=[M1(2) pp1(2)];
plot(xb1, yb1, 'linewidth', 2)
hold on 
%for b 
xb2=[M2(1) pp2(1)];
yb2=[M2(2) pp2(2)];
plot(xb2, yb2, 'linewidth', 2)
hold on
%for c
xb3=[M3(1) pp3(1)];
yb3=[M3(2) pp3(2)];
plot(xb3, yb3, 'linewidth', 2)
hold on
else
    disp("Workspace cannot be reached");
end


