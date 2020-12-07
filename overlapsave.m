clear all
clc
hn=input("Enter h(n)   : ")
M=length(hn)
L=input("Enter the length  :  ")
R=L-M+1
b=input("Number of points from 0  :  ")
i=0:b
xn=2.^i
pn=xn
p=i
tim=1
xn=[zeros(1,M-1) xn]
t=round(((length(xn)-L)/(L-M+1)))+1
tim=t+1
xn=[xn zeros(1,R-mod(length(xn),2)) zeros(1,L) ]
k=1
l=1
h=L
for t=1:tim
        xf(:,t)=xn(l:h)';
        l=l+L-M-1;
        h=h+L-M-1;      
end
xn=xf
hn=[hn zeros(1,L-length(hn))]
for i=1:tim
    xn(:,i)=(fft((xn(:,i))))
end
xf=xn
for i=1:tim
    hf(:,i)=(fft(hn))
    yk(:,i)=hf(:,i).*xf(:,i)
    yn(:,i)=ifft(yk(:,i))
end
ys=[]
for i=1:tim
    ys=[ys yn(M:L,i)']
end
figure
stem(p,ys(p+1))
title(' overlapsave method x(n)=')
xlabel('time n------>')
ylabel('amplitude----->')
figure
stem(0:length(conv(pn,hn))-1,conv(pn,hn))
title(' x(n)=')
xlabel('time n------>')
ylabel('amplitude----->')