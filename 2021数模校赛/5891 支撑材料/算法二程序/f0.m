function y = f0(n,k,A,B,C,D,a,b,c,d,z,m0,w)
    T=zeros(n,k); %比值
    dt=zeros(1,k); %方差
    ww=zeros(1,k); %权重
    for j=1:k
       for i=1:n
           T(i,j)=A(i,1)+B(i,1)+C(i,1)+D(i,1);
           for l=1:j
               T(i,j)=T(i,j)+a(i,l)+b(i,l)+c(i,l)+d(i,l);
           end
           T(i,j)=T(i,j)/(z(i,j)+0.00001);
       end
       average=0;
       for i=1:n
           average=average+T(i,j);
       end
       average=average/m0(1,j);
       for i=1:n
           dt(1,j)=dt(1,j)+isZero(z(i,j))*(T(i,j)-average)^2;
       end
       dt(1,j)=sqrt(dt(1,j)/m0(1,j));
    end
    for j=1:k
        ww(1,j)=(2*k+1-2*j)*1.0/(k^2);
    end
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
    fenzi=dot(dt,ww);
    y=fenzi*1.0/dt0;
end

