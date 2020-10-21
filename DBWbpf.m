clc;
clear all;
close all;
fs=2000;          %Sampling frequency
fs1=200*2/fs;     %pass band edge frequency
fp1=800*2/fs;     %Stop band edge frequency
rs=35;            %Pass band attenuation
rp=2;             %Stop band attenuation

t=1/fs;           
[N,Wc]=cheb1ord((fs1),(fp1),2,35);     %determining the order and frequency
[b,a]=cheby1(N,2,fp1,'high')            %butterworth low pass filter
figure;
[h w]=freqz(b,a);
ay=20*log10(abs(h));                %H(jw) in db
ax=((w*fs)/(2*pi))                  %conversion into frequency
plot(ax,ay);                        %plotting the graph
title('Frequency response of Digital HIGH pass filter');
ylabel('H(jw) in db--->')
xlabel('f in hz--->')

N=fs;                               %DFT N Point 
n=0:N-1;                            %sampling points
f1=50;f2=100;f3=950;                %frequencies of input spectrum
x=cos(2*pi*f1*n/fs)+(2*cos(2*pi*f2*n/fs))+(2*sin(2*pi*f3*n/fs))    %given input spectrum
figure 
stem(n,x)                           %plotting the input spectrum
title('x(n)')
ylabel('amplitude--->')
xlabel('time smaples n-->')
k=0:999;
X=fft(x,N);                         %dft of input signal
figure
stem(k,abs(X(1:1000)))              %plotting the output spectrum
title('spectrum of input')
xlabel('frequency samples k --->')
ylabel('amplitude X(K)')

a3=filter(b,a,x)                  %filtering the signal using filter
X1=fft(a3,N)                        %dft of filtered response
figure
stem(k,abs(X1(1:1000)))             %plotting the the output spectrum
title('spectrum of output')
ylabel('aamplitude X1(K)')
xlabel('frequency samples k --->')