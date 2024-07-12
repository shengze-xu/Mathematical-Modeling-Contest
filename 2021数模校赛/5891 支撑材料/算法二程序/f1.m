function y = f1(n,k,A,B,C,D,a,b,c,d,a1,b1,c1,d1)
    A1=zeros(n,k);B1=zeros(n,k);C1=zeros(n,k);D1=zeros(n,k);
    for j=1:k
        for i=1:n
            A1(i,j)=A(i,1);B1(i,j)=B(i,1);C1(i,j)=C(i,1);D1(i,j)=D(i,1);
            for l=1:j
                A1(i,j)=A1(i,j)+a(i,l);B1(i,j)=B1(i,j)+b(i,l);C1(i,j)=C1(i,j)+c(i,l);D1(i,j)=D1(i,j)+d(i,l);
            end
            A1(i,j)=isZero(A1(i,j));B1(i,j)=isZero(B1(i,j));C1(i,j)=isZero(C1(i,j));D1(i,j)=isZero(D1(i,j));
        end
    end
    U=0;
    for j=1:k
        for i1=1:n-1
            for i2=i1+1:n
                U=U+a(i1,j)*a(i2,j)*(1-A1(i1,j))*(1-A1(i2,j))+b(i1,j)*b(i2,j)*(1-B1(i1,j))*(1-B1(i2,j))+c(i1,j)*c(i2,j)*(1-C1(i1,j))*(1-C1(i2,j))+d(i1,j)*d(i2,j)*(1-D1(i1,j))*(1-D1(i2,j));
            end
        end
    end
    fenmu=0;
    for j=1:k
        fenmu=fenmu+(a1(1,j)+b1(1,j)+c1(1,j)+d1(1,j))/2;
    end
    y=U*1.0/fenmu;
end

