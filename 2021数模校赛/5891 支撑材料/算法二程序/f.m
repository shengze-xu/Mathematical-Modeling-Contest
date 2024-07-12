function y = f(n,k,A,B,C,D,a,b,c,d,z,m0,a1,b1,c1,d1,t,w)
lambda=[0.8,0.16,0.032,0.008];
ff=[f0(n,k,A,B,C,D,a,b,c,d,z,m0,w),f1(n,k,A,B,C,D,a,b,c,d,a1,b1,c1,d1),f2(n,k,a,b,c,d,A,B,C,D),f3(n,k,a,b,c,d,t,a1,b1,c1,d1)];
y=dot(ff,lambda);
end

