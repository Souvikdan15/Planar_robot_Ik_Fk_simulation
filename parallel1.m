clc;
clear all;
close all;

orientation=deg2rad(0);
xip=0;
yip=0;

nn=0;

for xip=0:2:506
    for yip=0:2:499
        
        nn=nn+1;
        
        ip=[orientation xip yip];
        op=IPK(ip);
        
        if imag(op)==0
            master(nn,:)=[xip yip op];
            
        end
        end
end
    scatter(master(:,1),master(:,2),'.');
    axis('equal')
    function output=IPK(input)
    
    alpha=input(1);
    xin=input(2);
    yin=input(3);
    
    radiusBase=290;
    baselength=sqrt(3)*radiusBase;
    radiusplatform= 130;
    platformlength= sqrt(3)*radiusplatform;
    
    ll1=170;
    ll2=130;
    aa=baselength;
    hh=platformlength;
    
    ca=cos(alpha);
    sa=sin(alpha);
    r3=sqrt(3);
    
    e11=(-2*ll1)*(yin-(hh*sa/2)-(r3*hh*ca/6));
    e21=(-2*ll1)*(xin-(hh*ca/2)+(r3*hh*sa/6));
    e31=(xin-(hh*ca/2)+(r3*hh*sa/6))^2+(yin-(hh*sa/2)-(r3*hh*ca/6))^2+ll1^2-ll2^2;
    
    e12=(-2*ll1)*(yin+(hh*sa/2)-(r3*hh*ca/6));
    e22=(-2*ll1)*(xin+(hh*ca/2)+(r3*hh*sa/6)-aa);
    e32=(xin+(hh*ca/2)+(r3*hh*sa/6)-aa)^2+(yin+(hh*sa/2)-(r3*hh*ca/6))^2+ll1^2-ll2^2;
    
    e13=(-2*ll1)*(yin+(r3*hh*ca/3)-(r3*aa/2));
    e23=(-2*ll1)*(xin-(r3*hh*sa/3)-(aa/2));
    e33=(xin-(r3*hh*sa/3)-(aa/2))^2+(yin+(r3*hh*ca/3)-(r3*aa/2))^2+ll1^2-ll2^2;
    
    theta1=2*atan((-e11+sqrt(e11^2+e21^2-e31^2))/(e31-e21));
    theta2=2*atan((-e12+sqrt(e12^2+e22^2-e32^2))/(e32-e22));
    theta3=2*atan((-e13+sqrt(e13^2+e23^2-e33^2))/(e33-e23));
    
    output=[theta1 theta2 theta3];
    
    end
    
    
