N=input("Enter the value   : ")
n=0:N-1
xt=cos(8*pi*n/N)
xf=fft(xt)
figure
stem(n,xt)
title(' x(n)=')
xlabel('time n------>')
ylabel('amplitude----->')
figure
stem(n,xf)
title(' x(f)=')
xlabel('frequency f------>')
ylabel('amplitude----->')
