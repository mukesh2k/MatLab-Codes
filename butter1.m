clc
clear all
close all
fs=input('enter sampling frequency');
t=0:1/fs:10;
f1=input('f1');
f2=input('f2');
f3=input('f3');
x=cos(2*pi*f1*t)+2*cos(2*pi*f2*t)+2*sin(2*pi*f3*t);
figure
while 1==1 
disp('1.Butterworth 2.Chrbyshev');
sw1=input('Select filter');
switch sw1
    case 1
        rp=input('enter passband riple');
        rs=input('enter stopband ripple');
        wp=input('enter the passband frequency'); 
        ws=input('enter the stopband frequency');
        w1=(2*pi*wp)/fs; w2=(2*pi*ws)/fs;
        [N,wn]=buttord(w1/10000,w2/1000,rp,rs);
        [b,a]=butter(N,wn*1000,'low','s');
        [z,p]=tf2zp(b,a);
        freqz(z,p)
        [bd,ad]=bilinear(b,a,1)
        disp(N);disp(wn);disp(b);disp(a);
        freqz(bd,ad)
        y=filter(bd,ad,x)
        plot(y,x)
%         y=filtfilt(b,a,x);
%         X=fft(x);
%         Y=fft(y);
%         m1=abs(X);
%         m2=abs(Y);
%         subplot(121);
%         w0=[(0:length(m1)-1)/(length(m1)-1)]*fs;
%         stem(w0,m1);title('magnitude spectrum');xlabel('n');ylabel('Amplitude');
%         subplot(122);
%         w3=[(0:length(m2)-1)/(length(m2)-1)]*fs;
%         stem(w3,m2); title('magnitude spectrum of y');xlabel('n');ylabel('gain(db)');
%         figure();
%         freqz(b,a);
        break;
    case 2
        rp=input('enter passband riple');
        rs=input('enter stopband ripple');
        ws=input('enter the stopband frequency');
        w1=(2*wp)/fs; w2=(2*ws)/fs;
        [N,wn]=cheb1ord(w1,w2,rp,rs);
        [b,a]=cheby1(N,rp,wn,'low');
        disp(N);disp(wn);disp(b);disp(a);
        y=filtfilt(b,a,x);
        X=fft(x);
        Y=fft(y);
        m1=abs(X);
        m2=abs(Y);
        subplot(121);
        w0=[(0:length(m1)-1)/(length(m1)-1)]*fs;
        stem(w0,m1);title('magnitude spectrum');xlabel('n');ylabel('Amplitude');
        subplot(122);
        w3=[(0:length(m2)-1)/(length(m2)-1)]*fs;
        stem(w3,m2); title('magnitude spectrum of y');xlabel('n');ylabel('gain(db)');
        figure();
        freqz(b,a);
        break;
    otherwise
        disp("<<< Enter correctly>>>")
end
end
