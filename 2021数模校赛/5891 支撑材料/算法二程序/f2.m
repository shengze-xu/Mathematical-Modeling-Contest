function y = f2(n,k,a,b,c,d,A,B,C,D)
    N=zeros(n,1);
    aa=zeros(n,1);bb=zeros(n,1);cc=zeros(n,1);dd=zeros(n,1);
    dt2=zeros(n,1);
    for i=1:n
        N(i,1)=A(i,1)+B(i,1)+C(i,1)+D(i,1);
        aa(i,1)=A(i,1);bb(i,1)=B(i,1);cc(i,1)=C(i,1);dd(i,1)=D(i,1);
        for j=1:k
            N(i,1)=N(i,1)+a(i,j)+b(i,j)+c(i,j)+d(i,j);
            aa(i,1)=aa(i,1)+a(i,j);bb(i,1)=bb(i,1)+b(i,j);
            cc(i,1)=cc(i,1)+c(i,j);dd(i,1)=dd(i,1)+d(i,j);
        end
        N(i,1)=N(i,1)*1.0/4;
        dt2(i,1)=sqrt(0.25*((aa(i,1)-N(i,1))^2+(bb(i,1)-N(i,1))^2+(cc(i,1)-N(i,1))^2+(dd(i,1)-N(i,1))^2));
    end
    N0=zeros(n,1);dt20=zeros(n,1);
    for i=1:n
        N0(i,1)=(A(i,1)+B(i,1)+C(i,1)+D(i,1))*1.0/4;
        dt20(i,1)=sqrt(0.25*((A(i,1)-N(i,1))^2+(B(i,1)-N(i,1))^2+(C(i,1)-N(i,1))^2+(D(i,1)-N(i,1))^2));
    end
    fenzi=0;fenmu=0;
    for i=1:n
        fenzi=fenzi+dt2(i,1);fenmu=fenmu+dt20(i,1);
    end
    y=fenzi*1.0/fenmu;
end

