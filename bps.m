%chebyshov high pass filter analog to digital
clc;
clear all;
close all;
fs=2000;          %Sampling frequency
fs1=200;     %pass band edge frequency
fp1=800;     %Stop band edge frequency
rs=35;            %Pass band attenuation
rp=2;             %Stop band attenuation
t=1/fs;           
[N,Wc]=cheb1ord((2*pi*fs1),(2*pi*fp1),2,35,'s');     %determining the order and frequency
[b,a]=cheby1(N,2,2*pi*fp1,'high','s')                %cheby high pass filter
w=0:10000;
              
[H w]=freqs(b,a,w);
plot(w,20*log10(abs(H)));                       %plotting magnitude of analog response in db
title('Frequency response of analog filter');
ylabel('H(jw) in db--->')
xlabel('w in rad/sec--->')


                        %analog to digital

[b1,a1]=bilinear(b,a,fs)            %using bilinear transformation for analog to digital
figure;
[h wt]=freqz(b1,a1);
ay=20*log10(abs(h));                %H(jw) in db
ax=((wt*fs)/(2*pi))                  %conversion into frequency
plot(ax,ay);                        %plotting the graph
title('Frequency response of Digital HIGH pass filter');
ylabel('H(jw) in db--->')
xlabel('f in hz--->')

N=fs;                               %DFT N Point 
n=0:N-1;                            %sampling points
f1=50;f2=150;f3=950;                %frequencies of input spectrum
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

a3=filter(b1,a1,x)                  %filtering the signal using filter
X1=fft(a3,N)                        %dft of filtered response
figure
stem(k,abs(X1(1:1000)))             %plotting the the output spectrum
title('spectrum of output')
ylabel('aamplitude X1(K)')
xlabel('frequency samples k --->')