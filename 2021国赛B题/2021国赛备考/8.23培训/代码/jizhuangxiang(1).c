#include<stdio.h>
#include<math.h>
double ab[4][2]={1.05,1.05,1.32,0.64,0.98,0.42,1.5,1};
double h[4]={1.05,0.84,0.52,1};//���� 
double AB[4][2]={1.356,2.338,2.891,2.338,1.36,2.338,2.135,2.643};
double H[4]={1.8,2.338,1.9,2.0};//��װ�� 
int x[4]={2,6,7,10};
int y[4]={3,4,6,7};
int main()
{
	int a=0;
	double ae,be,he,ac,bc,hc;
	int i,j;
	int n=0;//����������� 
	int m=0;
	int l=0;
	int s=0;//��¼���ż�װ��
	double v=0;//��¼��ǰ��װ����������� 
	double v2=0;
	for(a=0;a<4;a++)
	{
	n=0;
	m=0;
	s=0;
	v=0;
	ae=ab[a][0];
	be=ab[a][1];
	he=h[a];


	for(i=0;i<4;i++)
	{
		n=0;
		l=0;
		v2=0;
		ac=AB[i][0];
		bc=AB[i][1];
		hc=H[i];
		for(j=0;ae*j<ac;j++)
		{
			if(j*(int)(bc/be)+(int)((ac-ae*j)/be)*(int)(bc/ae)>n)
				n=j*(int)(bc/be)+(int)((ac-ae*j)/be)*(int)(bc/ae);
		}
		for(j=0;ae*j<bc;j++)
		{
			if(j*(int)(ac/be)+(int)((bc-ae*j)/be)*(int)(ac/ae)>n)
				n=j*(int)(ac/be)+(int)((bc-ae*j)/be)*(int)(ac/ae);
		}
		l=n*(int)(hc/he);
		if(i==1||i==0)
		{
			v2=l*he*ae*be/(ac*bc*hc);
			printf("��%d�ֻ�����ڵ�%d��������ʱ������%d�������������Ϊ%lf\n",x[a],y[i],l,v2);
		}
		if(i==2||i==3)
		{
			v2=n*ae*be/(ac*bc);
			printf("��%d�ֻ�����ڵ�%d��������ʱ������%d�������������Ϊ%lf�����ø߶�Ϊ%lf\n",x[a],y[i],l,v2,he*(int)(hc/he));
		}
		
		
		if(i==1||i==0)
		{
		if(n*(int)(hc/he)*(ae*be*he)/(ac*bc*hc)>v)
		{
			v=n*(int)(hc/he)*ae*be*he/(ac*bc*hc);
			m=n*(int)(hc/he);
			s=i;
		}
		}
		if(i==2||i==3)
		{
		if(n*(int)(hc/he)*(ae*be*he)/(ac*bc*he*(int)(hc/he))>v)
		{
			v=n*(int)(hc/he)*ae*be*he/(ac*bc*he*(int)(hc/he));
			m=n*(int)(hc/he);
			s=i;
		}	
		}
	} 
	printf("��%d�ֻ�������ż�װ��ѡ��Ϊ%d�ż�װ�䣬����װ%d�����ֻ�����������Ϊ%lf\n",x[a],y[s],m,v);
	}
} 
