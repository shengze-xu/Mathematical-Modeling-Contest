function y = ff0(n,k,A,B,C,D,a,b,c,d,z,m0,w,W)
    T=zeros(n,1);
    for i=1:n
        T(i,1)=A(i,1)+B(i,1)+C(i,1)+D(i,1);
        for j=1:k
            T(i,1)=T(i,1)+a(i,j)+b(i,j)+c(i,j)+d(i,j);
        end
        T(i,1)=T(i,1)*1.0/W(i,1);
    end
    average=0;
    for i=1:n
        average=average+T(i,1);
    end
    average=average/n;
    dt1=0;
    for i=1:n
        dt1=dt1+(T(i,1)-average)^2;
    end
    dt1=sqrt(dt1/n);
    T0=zeros(n,1);mm0=0;
    for i=1:n
        T0(i,1)=(A(i,1)+B(i,1)+C(i,1)+D(i,1))/(w(i,1)+0.00001);
        mm0=mm0+isZero(w(i,1));
    end
    dt0=0;
    average0=0;
    for i=1:n
        average0=average0+T0(i,1);
    end
    average0=average0/mm0;
    for i=1:n
        dt0=dt0+isZero(w(i,1))*(T0(i,1)-average0)^2;
    end
    dt0=sqrt(dt0/mm0);
    y=dt1/dt0;
end

