clc;
clear all;
close all;

fs=2000;                            %given parameters
ws1=[2*pi*20,2*pi*45000];
wp1=[2*pi*50,2*pi*20000];
ws=ws1/fs;
wp=wp1/fs;
rs=35;
rp=2;
t=1/fs;

[N,Wc]=buttord(wp1,ws1,rp,rs,'s');          %finding order and cutoff frequecy
[b,a]=butter(N,Wc,'bandpass','s')                %b,a coefficients of numerator and denominator 
w=0:10000;
                %analog transfer function
[H w]=freqs(b,a,w);
plot(w,20*log10(abs(H)));                   %plotting magnitude of analog response in db
title('Frequency response of analog filter');
ylabel('H(jw) in db--->')
xlabel('w in rad/sec--->')

                %analog to digital transformation
                %using bilinear transformation
Os=(2/t)*tan(ws/2);         %for bilinear transformation
Op=(2/t)*tan(wp/2);
[n,Wn] = buttord(Op,Os,rp,rs,'s') 
[bt,at] = butter(n,Wn,'low','s')
[bd,ad]=bilinear(bt,at,fs)   %transformation analog to digital
figure
freqz(bd,ad,256,fs);        %plotting the graph
title('digital LPF using bilinear transformation');



fs=2000;
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

a3=filter(bd,ad,x)                  %filtering the signal using filter
X1=fft(a3,N)                        %dft of filtered response
figure
stem(k,abs(X1(1:1000)))             %plotting the the output spectrum
title('spectrum of output')
ylabel('aamplitude X1(K)')
xlabel('frequency samples k --->')
clc;
clear all;
close all;

fs=2000;                            %given parameters
wp1=2*pi*200;
ws1=2*pi*800;
ws=ws1/fs;
wp=wp1/fs;
rs=35;
rp=2;
t=1/fs;

[N,Wc]=buttord(wp1,ws1,rp,rs,'s');          %finding order and cutoff frequecy
[b,a]=butter(N,Wc,'low','s')                %b,a coefficients of numerator and denominator 
w=0:10000;
                %analog transfer function
[H w]=freqs(b,a,w);
plot(w,20*log10(abs(H)));                   %plotting magnitude of analog response in db
title('Frequency response of analog filter');
ylabel('H(jw) in db--->')
xlabel('w in rad/sec--->')

                %analog to digital transformation
                %using bilinear transformation
Os=(2/t)*tan(ws/2);         %for bilinear transformation
Op=(2/t)*tan(wp/2);
[n,Wn] = buttord(Op,Os,rp,rs,'s') 
[bt,at] = butter(n,Wn,'low','s')
[bd,ad]=bilinear(bt,at,fs)   %transformation analog to digital
figure
freqz(bd,ad,256,fs);        %plotting the graph
title('digital LPF using bilinear transformation');



fs=2000;
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

a3=filter(bd,ad,x)                  %filtering the signal using filter
X1=fft(a3,N)                        %dft of filtered response
figure
stem(k,abs(X1(1:1000)))             %plotting the the output spectrum
title('spectrum of output')
ylabel('aamplitude X1(K)')
xlabel('frequency samples k --->')