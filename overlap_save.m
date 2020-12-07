clc;
clear all;
close all;
hn=[1 1];
xn=[1 0 1 0 1 0 1 0];
m=2;
l=3;
n=l+m-1;
x1=xn(1:l);
x2=xn(l+1:l+3);
x3=[xn(l+4:l+5),0];
z=zeros(1,2);
hn1=[hn,z];
hk=fft(hn1);
x1n=[0,x1];
x2n=[x1n(1,4),x2];
x3n=[x2n(1,4),x3];
x1k=fft(x1n);
x2k=fft(x2n);
x3k=fft(x3n);
y1k=x1k.*hk;
y2k=x2k.*hk;
y3k=x3k.*hk;
y1n=ifft(y1k);
y2n=ifft(y2k);
y3n=ifft(y3k);
yn1=y1n(l-1:l+1);
yn2=y2n(l-1:l+1);
yn3=y3n(l-1:l+1);
yn=[yn1,yn2,yn3];
stem(yn);
title('y(n)');




