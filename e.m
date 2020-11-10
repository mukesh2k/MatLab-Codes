fs=2300000  %sampling frequency
N=fs; %DFT N Point
n=0:N-1; %sampling points
f1=2000   %input signal frequency
f2=3000
f3=5000
f4=18000
f5=20000
x=cos(2*pi*100000*N/fs)*(1+(cos(2*pi*f2*n/fs)+cos(2*pi*f3*n/fs)+cos(2*pi*n*f4/fs)+cos(2*pi*f1*n/fs)+cos(2*pi*n*f5/fs))) %given input spectrum
figure
stem(n,x) %plotting the input spectrum
title('x(n)')
ylabel('amplitude--->')
xlabel('time smaples n-->')
k=0:20000;
X=fft(x,N); %dft of input signal
figure
stem(k,abs(X(1:20000+1))) %plotting the output spectrum
title('spectrum of input')
xlabel('frequency samples k --->')
ylabel('amplitude X(K)')
fs=2300000; %sampling frequency
fp1=980000; % lower passband edge frequency
fp2=1020000; % upper passband edge frequency
fs1=950000; % lower stopband edge frequency
fs2=1080000; % upper stopband edge frequency
rp=3; % passband attenuation
rs=20; % stopband attenuation
fp=[fp1 fp2]/fs
fst=[fs1 fs2]/fs %normalizing
[N,Wp]=buttord(fp,fst,rp,rs) %determining order and cutoff frequency
[b,a]=butter(N,Wp,'bandpass') %coefficients of num and den
[h ws]=freqz(b,a,fs) %frequency response of digital filters
figure
semilogx((ws*fs)/pi,20*log10(abs(h)));
title('Frequency response of Digital Bandpass filter');
ylabel('|H(z)| in db--->')
xlabel('f in hz--->')
fs=2300000 %sampling frequency for amplified signal
N=fs; %DFT N Point
a3=filter(b,a,x) %filtering the signal using filter
X1=fft(a3,N) %dft of filtered response
k=0:2300000-1
figure
stem(k,abs(X1)) %plotting the the output spectrum
title('spectrum of output')
ylabel('aamplitude X1(K)')
xlabel('frequency samples k --->')
