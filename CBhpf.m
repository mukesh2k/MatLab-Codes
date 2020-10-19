clc;clear all;close all;
% fp=input('passband freq:')
% fs=input('stopband freq:')
% d2=input('attenuation:')
% pg=input('passband gain')
fp=200;fs=800;
Wp=2*pi*fp
Ws=2*pi*fs
Rs=30
Rp=2
[n,Wn] = cheb1ord(Wp,Ws,Rp,Rs,'s')
[z,p,k]=cheb1ap(n,Rp)
[b1,a1]=zp2tf(z,p,k)
[bt,at]=lp2hp(b1,a1,Wn)
n=0:2*Ws;
[y,k]=freqs(bt,at,n);
x=mag2db(abs(y));
plot(n/2,x)
grid on; title('magnitude response')
xlabel('f-->');ylabel('magnitude(dB)')
