h=cu(0,0,0,3,4,5);
xlabel('ac');
ylabel('bc');
zlabel('hc');
title('±‰¡øg');

function k=cu(x,y,z,a,b,c)
    k=0;
    t=0:0.01:1;
    f=zeros(1,101);
    g=ones(1,101);
    plot3(a*t+x*g,f+y*g,f+z*g);
    hold on;
    plot3(f+x*g,b*t+y*g,f+z*g);
    hold on;
    plot3(f+x*g,f+y*g,c*t+z*g);
    hold on;
    plot3(a*t+x*g,b*g+y*g,f+z*g);
    hold on;
    plot3(a*t+x*g,f+y*g,c*g+z*g);
    hold on;
    plot3(a*t+x*g,b*g+y*g,c*g+z*g);
    hold on;
    plot3(a*g+x*g,b*t+y*g,f+z*g);
    hold on;
    plot3(f+x*g,b*t+y*g,c*g+z*g);
    hold on;
    plot3(a*g+x*g,b*t+y*g,c*g+z*g);
    hold on;
    plot3(a*g+x*g,f+y*g,c*t+z*g);
    hold on;
    plot3(f+x*g,b*g+y*g,c*t+z*g);
    hold on;
    plot3(a*g+x*g,b*g+y*g,c*t+z*g);
    hold on;
end










































