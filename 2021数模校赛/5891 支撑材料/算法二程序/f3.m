function y = f3(n,k,a,b,c,d,t,a1,b1,c1,d1)
    fenzi=0;fenmu=0;
    for j=1:k
        fenmu=fenmu+3*(a1(1,j)+b1(1,j)+c1(1,j)+d1(1,j));
        for i1=1:n-1
            for i2=i1+1:n
                fenzi=fenzi+(a(i1,j)*a(i2,j)+b(i1,j)*b(i2,j)+c(i1,j)*c(i2,j)+d(i1,j)*d(i2,j))*(t(i1,1)+t(i2,1))*(t(i1,1)+t(i2,1)-1)*(t(i1,1)+t(i2,1)-2);
            end
        end
    end
    y=fenzi*1.0/fenmu;
end

