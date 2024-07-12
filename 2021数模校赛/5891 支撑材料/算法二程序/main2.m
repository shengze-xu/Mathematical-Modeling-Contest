%第二种公平条件下的排班规划算法
k=9;n=15;
%k=input('总天数：');
%n=input('总人数:');
n0=zeros(1,k);%第j天员工数量
m0=zeros(1,k);%到第j天已工作过员工数量
%W=input('工作天数：');%n*1
%w=input('已工作天数：');%n*1
%q=input('是否有驾驶资格：');%n*1
%t=input('历史事故次数：');%n*1
%A=input('已排A班次：');%n*1
%B=input('已排B班次：');
%C=input('已排C班次：');
%D=input('已排D班次：'); %部分注释内容修改后可适用于任何场景
W=[6;11;9;10;13;15;6;10;5;10;6;10;4;8;5];
w=[4;6;8;5;8;11;4;5;3;1;-2;-3;-5;-5;-6];
q=[1;1;1;1;1;1;1;0;0;0;1;0;1;0;1];
t=[0;0;0;1;1;2;1;2;1;0;0;0;0;0;0];
A=[2;1;1;1;2;1;1;1;0;0;0;0;0;0;0];
B=[0;1;2;1;1;1;1;0;0;0;0;0;0;0;0];
C=[0;0;1;1;0;1;0;1;1;0;0;0;0;0;0];
D=[0;0;0;0;1;1;0;0;1;0;0;0;0;0;0];
A1=zeros(n,k);B1=zeros(n,k);C1=zeros(n,k);D1=zeros(n,k);
x=zeros(n,k);
y=zeros(n,k);
z=zeros(n,k);
a1=zeros(1,k); %第j天总共要的人数
b1=zeros(1,k); c1=zeros(1,k); d1=zeros(1,k);
a=zeros(n,k);b=zeros(n,k);c=zeros(n,k);d=zeros(n,k);
for i=1:n
    for j=1:k
        if 1-w(i,1)<=j &&j<=W(i,1)-w(i,1)
            x(i,j)=1;
        end
    end
end
for j=1:k
    for i=1:n
        n0(1,j)=n0(1,j)+x(i,j);
    end
end
M=[0,0,0,0;0,0,0,0;0,0,0,0;0,0,0,0;2,0,0,0;2,0,0,0;2,0,0,0;2,2,0,0;2,2,0,0;2,2,0,0;2,2,2,0;2,2,2,0;2,2,2,2;2,2,2,2;2,2,2,2];
for j=1:k
    if n0(1,j)<=15
        a1(j)=M(n0(1,j),1);
        b1(j)=M(n0(1,j),2);
        c1(j)=M(n0(1,j),3);
        d1(j)=M(n0(1,j),4);
    end
end
for i=1:n
    for j=1:k
        z(i,j)=isZero(w(i,1)+1)*w(i,1);
        for l=1:j
            z(i,j)=z(i,j)+x(i,l);
        end
    end
end
for j=1:k
    for i=1:n
        m0(1,j)=m0(1,j)+isZero(z(i,j));
    end
end   %数据预处理
fmin=100000;
ff0min=100000;
f1min=100000;
f2min=100000;
f3min=100000;
amin=a;bmin=b;cmin=c;dmin=d;
for cic=1:1000000 %搜索次数，10000,100000,1000000
    ss=1;
    a=zeros(n,k);b=zeros(n,k);c=zeros(n,k);d=zeros(n,k);
    for j=1:k
       x1=zeros(n0(j),1);
       cnt=1;
       for i=1:n
           if x(i,j)>0
               x1(cnt,1)=i;
               cnt=cnt+1;
           end
       end 
       yy(j)=a1(j)+b1(j)+c1(j)+d1(j);
       ri=randperm(n0(j),yy(j));
       if a1(j)==2
           a(x1(ri(1),1),j)=1;
           a(x1(ri(2),1),j)=1;
       end
       if b1(j)==2
           b(x1(ri(3),1),j)=1;
           b(x1(ri(4),1),j)=1;
       end
       if c1(j)==2
           c(x1(ri(5),1),j)=1;
           c(x1(ri(6),1),j)=1;
       end
       if d1(j)==2
           d(x1(ri(7),1),j)=1;
           d(x1(ri(8),1),j)=1;
       end %在满足基本排班需求下的随机量取值
       if dot(a(:,j),q)<a1(j)/2 || dot(b(:,j),q)<b1(j)/2 || dot(c(:,j),q)<c1(j)/2 || dot(d(:,j),q)<d1(j)/2
           ss=0;
       end %约束条件
    end
    if ss==1
        result=g(n,k,A,B,C,D,a,b,c,d,z,m0,a1,b1,c1,d1,t,w,W);
        if result<fmin
            fmin=result;
            ff0min=ff0(n,k,A,B,C,D,a,b,c,d,z,m0,w,W);
            f1min=f1(n,k,A,B,C,D,a,b,c,d,a1,b1,c1,d1);
            f2min=f2(n,k,a,b,c,d,A,B,C,D);
            f3min=f3(n,k,a,b,c,d,t,a1,b1,c1,d1);
            amin=a;
            bmin=b;
            cmin=c;
            dmin=d;
        end
    end %判断目标函数最小值
end
disp(fmin);
disp(ff0min);
disp(f1min);
disp(f2min);
disp(f3min);
disp(amin);
disp(bmin);
disp(cmin);
disp(dmin);