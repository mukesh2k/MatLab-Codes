clc
close all
clear all
x=input('enter the sequence, x(n)=')
xo=input("position of origin,  ");xo=xo-1;
h=input('enter the sequence, h(n)=')
ho=input("position of origin,  ");ho=ho-1;
m=length(x);
n=length(h);
ma=max(m,n)
figure
stem(-xo:m-xo-1,x)
title(' x(n)=')
xlabel('time n------>')
ylabel('amplitude----->')
figure
stem(-ho:n-ho-1,h)
title(' h(n)=')
xlabel('time n------>')
ylabel('amplitude----->')
l=m+n-1;   %length of convolved signal
v=convp(x,h,l,m,n)  %calling function
figure
stem(-xo-ho:m-xo+n-ho-1-1,v,'r')
grid on;
title('output Y(n) Linear Convolution ')
xlabel('time n------>')
ylabel('amplitude----->')

function Y=convp(x,h,l,m,n)
X=zeros(1,l);   %array of L zeros
H=zeros(1,l);   %array of L zeros
X(1:m)=x;       %replacing zeros with the input array
H(1:n)=h;       %replacing zeros with the input array
for i=1:l
    Y(i)=0;
    for j=1:i   %convolving
        Y(i)=Y(i)+X(j)*H(i-j+1);
    end
end
end