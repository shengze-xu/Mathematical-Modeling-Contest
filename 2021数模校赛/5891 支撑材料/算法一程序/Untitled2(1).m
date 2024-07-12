
%初始条件，后续会有w{i}，表示过去了i-1天的员工基本量情况
x=1;
%规划的天数
n=zeros(1,x);
%n为x天内各天在岗员工人数变化
N=zeros(1,x);
%N为每天班次
for i=1:(x+1)
    w{i+1}=w{i};
    for j=1:15
        if(w{i}(j,1)>0&&w{i}(j,2)>w{i}(j,3))
            w{i+1}(j,3)=w{i+1}(j,3)+1;
        end
    end
end
%各天的工作人员已工作天数变化赋值
for i=1:x
    for j=1:15
        if(w{i}(j,1)>0&&w{i}(j,3)>=0&&w{i}(j,2)>w{i}(j,3))
            n(1,i)=n(1,i)+1;
        end
    end
    N(1,i)=transnumber(n(1,i));
end
%规划天内每日工作人员变化与班数变化
for i=1:x
    arr{i}=zeros(15,9);
end
%排班矩阵初始化（后四列为排班有效值，其他都写0，便于矩阵加减）

%主函数
%A
if(N(1)==1)
    f=100000000000;
    i1=1;
    while(i1<=14)
        if(w{1}(i1,3)<0||w{1}(i1,3)==w{1}(i1,2))
            i1=i1+1;
            continue;
        end
        i2=i1+1;
        while(i2<=15)
            if(w{1}(i2,3)<0||w{1}(i2,3)==w{1}(i2,2))
                i2=i2+1;
                continue;
            end
            if(w{1}(i2,4)==0&&w{1}(i1,4)==0)
                i2=i2+1;
                continue;
            end   
            for i=1:x
                arr{i}=zeros(15,9);
            end
            arrt=arr;
            arr{1}(i1,6)=1;
            arr{1}(i2,6)=1;
                    w{3}=w{2};
                    w{2}=w{2}+arr{1};
                    M=F(1,w)*1+(1-f1(1,w))*0+f2(1,w)*0+(1-f3(1,arr,w))*0;
                    w{2}=w{3};
                    if(M>f)
                        arr=arrt;
                    else
                        f=M;
                        brr=arr;
                    end
            i2=i2+1;
        end
        i1=i1+1;
    end
end

%AB
if(N(1)==2)
    f=100000000000;
    i1=1;
    while(i1<=14)
        if(w{1}(i1,3)<0||w{1}(i1,3)==w{1}(i1,2))
            i1=i1+1;
            continue;
        end
        i2=i1+1;
        while(i2<=15)
            if(w{1}(i2,3)<0||w{1}(i2,3)==w{1}(i2,2))
                i2=i2+1;
                continue;
            end
            if(w{1}(i2,4)==0&&w{1}(i1,4)==0)
                i2=i2+1;
                continue;
            end   
            j1=1;
            while(j1<=14)
                if(w{1}(j1,3)<0||w{1}(j1,3)==w{1}(j1,2)||j1==i1||j1==i2)
                    j1=j1+1;
                    continue;
                end   
                j2=j1+1;
                while(j2<=15)
                    for i=1:x
                        arr{i}=zeros(15,9);
                    end
                    arrt=arr;
                    if(w{1}(j2,3)<0||w{1}(j2,3)==w{1}(j2,2)||j2==i1||j2==i2)
                        j2=j2+1;
                        continue;
                    end
                    if(w{1}(j2,4)==0&&w{1}(j1,4)==0)
                        j2=j2+1;
                        continue;
                    end  
                    arr{1}(i1,6)=1;
                    arr{1}(i2,6)=1;
                    arr{1}(j1,7)=1;
                    arr{1}(j2,7)=1;
                    w{3}=w{2};
                    w{2}=w{2}+arr{1};
                    M=F(1,w)*0.8+(1-f1(1,w))*0.16+f2(1,w)*0.032+(1-f3(1,arr,w))*0.008;
                    w{2}=w{3};
                    if(M>f)
                        arr=arrt;
                    else
                        f=M;
                        brr=arr;
                    end
                    j2=j2+1;
                end  
                j1=j1+1;
            end
            i2=i2+1;
        end
        i1=i1+1;
    end
end

%ABC
if(N(1)==3)
    f=100000000000;
    i1=1;
    while(i1<=14)
        if(w{1}(i1,3)<0||w{1}(i1,3)==w{1}(i1,2))
            i1=i1+1;
            continue;
        end
        i2=i1+1;
        while(i2<=15)
            if(w{1}(i2,3)<0||w{1}(i2,3)==w{1}(i2,2))
                i2=i2+1;
                continue;
            end
            if(w{1}(i2,4)==0&&w{1}(i1,4)==0)
                i2=i2+1;
                continue;
            end   
            j1=1;
            while(j1<=14)
                if(w{1}(j1,3)<0||w{1}(j1,3)==w{1}(j1,2)||j1==i1||j1==i2)
                    j1=j1+1;
                    continue;
                end   
                j2=j1+1;
                while(j2<=15)
                    for i=1:x
                        arr{i}=zeros(15,9);
                    end
                    arrt=arr;
                    if(w{1}(j2,3)<0||w{1}(j2,3)==w{1}(j2,2)||j2==i1||j2==i2)
                        j2=j2+1;
                        continue;
                    end
                    if(w{1}(j2,4)*w{1}(j1,4)==0)
                        j2=j2+1;
                        continue;
                    end  
                    k1=1;
                    while(k1<=14)
                        if(w{1}(k1,3)<0||w{1}(k1,3)==w{1}(k1,2)||k1==i1||k1==i2||k1==j1||k1==j2)
                            k1=k1+1;
                            continue;
                        end   
                        k2=k1+1;
                        while(k2<=15)
                            for i=1:x
                                arr{i}=zeros(15,9);
                            end
                            arrt=arr;
                            if(w{1}(k2,3)<0||w{1}(k2,3)==w{1}(k2,2)||k2==i1||k2==i2||k2==j1||k2==j2||k2==k1)
                                k2=k2+1;
                                continue;
                            end
                            if(w{1}(k2,4)==0&&w{1}(k1,4)==0)
                                k2=k2+1;
                                continue;
                            end  
                            for i=1:x
                                arr{i}=zeros(15,9);
                            end
                            arrt=arr;
                            arr{1}(i1,6)=1;
                            arr{1}(i2,6)=1;
                            arr{1}(j1,7)=1;
                            arr{1}(j2,7)=1;
                            arr{1}(k1,7)=1;
                            arr{1}(k2,7)=1;
                            w{3}=w{2};
                    w{2}=w{2}+arr{1};
                    M=F(1,w)*1+(1-f1(1,w))*0+f2(1,w)*0+(1-f3(1,arr,w))*0;
                    w{2}=w{3};
                            if(M>f)
                                arr=arrt;
                            else
                                f=M;
                                brr=arr;
                            end
                            k2=k2+1;
                        end  
                        k1=k1+1;
                    end
                    j2=j2+1;
                end  
                j1=j1+1;
            end
            i2=i2+1;
        end
        i1=i1+1;
    end
end

%ABCD
if(N(1)==4)
    f=100000000000;
    i1=1;
    while(i1<=14)
        if(w{1}(i1,3)<0||w{1}(i1,3)==w{1}(i1,2))
            i1=i1+1;
            continue;
        end
        i2=i1+1;
        while(i2<=15)
            if(w{1}(i2,3)<0||w{1}(i2,3)==w{1}(i2,2))
                i2=i2+1;
                continue;
            end
            if(w{1}(i2,4)==0&&w{1}(i1,4)==0)
                i2=i2+1;
                continue;
            end   
            j1=1;
            while(j1<=14)
                if(w{1}(j1,3)<0||w{1}(j1,3)==w{1}(j1,2)||j1==i1||j1==i2)
                    j1=j1+1;
                    continue;
                end   
                j2=j1+1;
                while(j2<=15)
                    for i=1:x
                        arr{i}=zeros(15,9);
                    end
                    arrt=arr;
                    if(w{1}(j2,3)<0||w{1}(j2,3)==w{1}(j2,2)||j2==i1||j2==i2)
                        j2=j2+1;
                        continue;
                    end
                    if(w{1}(j2,4)==0&&w{1}(j1,4)==0)
                        j2=j2+1;
                        continue;
                    end  
                    k1=1;
                    while(k1<=14)
                        if(w{1}(k1,3)<0||w{1}(k1,3)==w{1}(k1,2)||k1==i1||k1==i2||k1==j1||k1==j2)
                            k1=k1+1;
                            continue;
                        end   
                        k2=k1+1;
                        while(k2<=15)
                            for i=1:x
                                arr{i}=zeros(15,9);
                            end
                            arrt=arr;
                            if(w{1}(k2,3)<0||w{1}(k2,3)==w{1}(k2,2)||k2==i1||k2==i2||k2==j1||k2==j2||k2==k1)
                                k2=k2+1;
                                continue;
                            end
                            if(w{1}(k2,4)==0&&w{1}(k1,4)==0)
                                k2=k2+1;
                                continue;
                            end  
                            for i=1:x
                                arr{i}=zeros(15,9);
                            end
                            l1=1;
                            while(l1<=14)
                                if(w{1}(l1,3)<0||w{1}(l1,3)==w{1}(l1,2)||l1==i1||l1==i2||l1==j1||l1==j2||l1==k1||l1==k2)
                                    l1=l1+1;
                                    continue;
                                end   
                                l2=l1+1;
                                while(l2<=15)
                                    for i=1:x
                                        arr{i}=zeros(15,9);
                                    end
                                    arrt=arr;
                                    if(w{1}(l2,3)<0||w{1}(l2,3)==w{1}(l2,2)||l2==i1||l2==i2||l2==j1||l2==j2||l2==k1||l2==k2)
                                        l2=l2+1;
                                        continue;
                                    end
                                    if(w{1}(l2,4)==0&&w{1}(l1,4)==0)
                                        l2=l2+1;
                                        continue;
                                    end  
                                    for i=1:x
                                        arr{i}=zeros(15,9);
                                    end
                                    arrt=arr;
                                    arr{1}(i1,6)=1;
                                    arr{1}(i2,6)=1;
                                    arr{1}(j1,7)=1;
                                    arr{1}(j2,7)=1;
                                    arr{1}(k1,7)=1;
                                    arr{1}(k2,7)=1;
                                    arr{1}(l1,7)=1;
                                    arr{1}(l2,7)=1;
                                    w{3}=w{2};
                                    w{2}=w{2}+arr{1};
                                    M=F(1,w)*0.8+(1-f1(1,w))*0.16+f2(1,w)*0.032+(1-f3(1,arr,w))*0.008;
                                    w{2}=w{3};
                                    if(M>f)
                                        arr=arrt;
                                    else
                                        f=M;
                                        brr=arr;
                                    end
                                    l2=l2+1;
                                end  
                                l1=l1+1;
                            end
                            k2=k2+1;
                        end  
                        k1=k1+1;
                    end
                    j2=j2+1;
                end  
                j1=j1+1;
            end
            i2=i2+1;
        end
        i1=i1+1;
    end
end

w{2}=w{2}+brr{1};
a=f1(1,w);
b=f2(1,w);
c=f3(1,brr,w);
d=F(1,w);


%下列为用到函数
function y=bool(x)
if x>0
    y=1;
else
    y=0;
end
end
%判断有无函数bool

function y=transnumber(x)
if(x>=5&&x<=7)
    y=1;
elseif(x>=8&&x<=10)
    y=2;
elseif(x>=11&&x<=12)
    y=3;
else
    y=4;
end
end
%人数求出排班数

function y=f1(x,w)
n=zeros(1,x);
%n为x天内各天在岗员工人数变化
N=zeros(1,x);
%N为每天班次
for i=1:x
    for j=1:15
        if(w{i}(j,1)>0&&w{i}(j,3)>=0&&w{i}(j,2)>w{i}(j,3))
            n(1,i)=n(1,i)+1;
        end
    end
    N(1,i)=transnumber(n(1,i));
end
NA=0;
for i=1:x
    NA=NA+N(1,i);
    %总班数
end
NB=NA;
%符合已经有专班经验员工的班数
for k=1:x
    for i=1:14
        for j=(i+1):15
            NB=NB-(w{k+1}(i,6)-w{k}(i,6))*(1-bool(w{k}(i,6)))*(w{k+1}(j,6)-w{k}(j,6))*(1-bool(w{k}(i,6)))-(w{k+1}(i,7)-w{k}(i,7))*(1-bool(w{k}(i,7)))*(w{k+1}(j,7)-w{k}(j,7))*(1-bool(w{k}(i,7)))-(w{k+1}(i,8)-w{k}(i,8))*(1-bool(w{k}(i,8)))*(w{k+1}(j,8)-w{k}(j,8))*(1-bool(w{k}(i,8)))-(w{k+1}(i,9)-w{k}(i,9))*(1-bool(w{k}(i,9)))*(w{k+1}(j,9)-w{k}(j,9))*(1-bool(w{k}(i,9)));
        end
    end
end
y=NB/NA;
end
%条件1目标函数

function y=f2(x,w)
n=zeros(1,x);
%n为x天内各天在岗员工人数变化
N=zeros(1,x);
%N为每天班次
for i=1:x
    for j=1:15
        if(w{i}(j,1)>0&&w{i}(j,3)>=0&&w{i}(j,2)>w{i}(j,3))
            n(1,i)=n(1,i)+1;
        end
    end
    N(1,i)=transnumber(n(1,i));
end
n0=0;
%最后一天参加工作至少一天人数的初始化
n1=0;
%第一天参加工作
var0=0;
var1=0;
%方差均值初始化
for i=1:15
    if(w{x+1}(i,3)>0)
        n0=n0+1;
    end
    if(w{1}(i,3)>0)
        n1=n1+1;
    end
end
for i=1:15
    var0=var0+var([w{x+1}(i,6), w{x+1}(i,7), w{x+1}(i,8), w{x+1}(i,9)]);
end
var0=var0/n0;
for i=1:15
    var1=var1+var([w{1}(i,6), w{1}(i,7), w{1}(i,8), w{1}(i,9)]);
end
var1=var1/n1;
y=var0/var1;
end
%条件2 目标函数

function y=f3dis(i,j,x,arr,w)
if((arr{x}(i,6)*arr{x}(j,6)>0||arr{x}(i,7)*arr{x}(j,7)>0||arr{x}(i,8)*arr{x}(j,8)>0||arr{x}(i,9)*arr{x}(j,9)>0)&&(w{1}(i,5)<=1||w{1}(j,5)<=1||(w{1}(i,5)>=2&&w{1}(i,5)<=3&&w{1}(j,5)>=2&&w{1}(j,5)<=3)))
    y=1;
else
    y=0;
end
end
%条件3成立判断函数

function y=f3(x,arr,w)
n=zeros(1,x);
%n为x天内各天在岗员工人数变化
N=zeros(1,x);
%N为每天班次
for i=1:x
    for j=1:15
        if(w{i}(j,1)>0&&w{i}(j,3)>=0&&w{i}(j,2)>w{i}(j,3))
            n(1,i)=n(1,i)+1;
        end
    end
    N(1,i)=transnumber(n(1,i));
end
NA=0;
for i=1:x
    NA=NA+N(1,i);
    %总班数
end
NB=0;
%符合的班数
for k=1:x
    for i=1:14
        for j=(i+1):15
            NB=NB+f3dis(i,j,x,arr,w);
        end
    end
end
y=NB/NA;
end
%f3目标函数

function y=F(x,w)
n=zeros(1,x);
%n为x天内各天在岗员工人数变化
N=zeros(1,x);
%N为每天班次
for i=1:x
    for j=1:15
        if(w{i}(j,1)>0&&w{i}(j,3)>=0&&w{i}(j,2)>w{i}(j,3))
            n(1,i)=n(1,i)+1;
        end
    end
    N(1,i)=transnumber(n(1,i));
end
y=0;
ratio=zeros(15,x);
%比例数存放矩阵
for i=1:15
    for j=1:x
        if(w{j+1}(i,3)>0)
            ratio(i,j)=(w{j+1}(i,6)+w{j+1}(i,7)+w{j+1}(i,8)+w{j+1}(i,9))/w{j+1}(i,3);
        else
            ratio(i,j)=0;
        end
    end
end
Q=zeros(1,x);
%定义每天ratio的方差
for i=1:x
    a=0;
    b=0;
    for j=1:15
        if(ratio(j,i)>0)
            a=a+1;
            b=b+ratio(j,i);
        end
    end
    for j=1:15
        Q(i)=Q(i)+(ratio(j,i)-b/a)^2/a;\
    end
end
for i=1:x
    y=y+Q(i);
end
y=(y/x)^0.5;
end
%最重要先决条件






    















