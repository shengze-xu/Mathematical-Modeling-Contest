x=ta(0,15.35,0,32.19);
x=ta(10.63,11.15,0,15.89);
%x=ta(0.46,15.43,18.09,20.84);
x=ta(0.14,5.14,8.4,13.29);
%x=ta(7.78,9.68,16.22,24.22);
x=ta(0,20,0,40);
t=0:0.01:1;
b=ones(1,101);
hold on;
plot(3.67*b,16.15*t);
hold on;
plot(7.15*b,16.15*t);
scatter(13.57,4.56);
x=zeros(1,350);
y=zeros(1,350);
x(1)=13.57;
y(1)=4.56;
zeta=0;
for i=1:174
    zeta=zeta+pi/2/175;
    y(i+1)=y(i)+0.03*tan(pi/2-zeta);
    x(i+1)=x(i)-0.02;
end
for i=175:349
    zeta=zeta+pi/2/175;
    y(i+1)=y(i)+0.012*tan(pi/2-zeta);
    x(i+1)=x(i)-0.0235;
end
a=zeros(1,250);
b=zeros(1,250);
a(1)=x(350);
b(1)=y(350);
zeta=0;
for i=1:50
    zeta=zeta+pi/2/175;
    a(i+1)=a(i)+0.005;
    b(i+1)=b(i)-0.01*tan(pi/2-zeta);
end
for i=51:199
    a(i+1)=a(i)+0.005/4;
    b(i+1)=b(i)-0.01/4*tan(pi/2-zeta);
end
for i=200:249
    zeta=zeta-pi/2/175;
    a(i+1)=a(i)+0.005;
    b(i+1)=b(i)-0.01*tan(-pi/2/175+pi/2-zeta);
end
c=zeros(1,250);
d=zeros(1,250);
c(1)=a(250);
d(1)=b(250)*3/4;
zeta=0;
for i=1:50
    zeta=zeta+pi/2/175;
    c(i+1)=c(i)-0.005;
    d(i+1)=d(i)-0.01*tan(pi/2-zeta);
    if(d(i+1)<0)
        d(i+1)=0
    end
end
for i=51:199
    c(i+1)=c(i)-0.005/4;
    d(i+1)=d(i)-0.01/4*tan(pi/2-zeta);
    if(d(i+1)<0)
        d(i+1)=0
    end
end
for i=200:249
    zeta=zeta-pi/2/175;
    c(i+1)=c(i)-0.005;
    d(i+1)=d(i)-0.01*tan(-pi/2/175+pi/2-zeta);
    if(d(i+1)<0)
        d(i+1)=0
    end
end
k=ones(1,101);
plot(a,b);
%plot(c,d);
plot(a(250)*k,b(250)-b(250)*t);
%plot(c(250)*k,d(250)-d(250)*t);
plot(x,y);



function y=ta(a1,a2,b1,b2)
    t=0:0.01:1;
    b=ones(1,101);
    plot(a1*b+(a2-a1)*t,b1*b);
    hold on;
    plot(a1*b+(a2-a1)*t,b2*b);
    hold on;
    plot(a1*b,b1*b+(b2-b1)*t);
    hold on;
    plot(a2*b,b1*b+(b2-b1)*t);
    hold on;
    y=1;
end