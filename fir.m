clc;clear all; close all hidden;
fc=3e3;fs=20e3; %fc 
wc=(2*fc)/fs
M=31
n=M-1
% i=input("one r two")
% if i==1
%     fs=input("enter the stopband");
%     fp=input("enter passband");
%      if fp>fs 
%     st1="high";
%      else
%          st1="low"
%      end
%  end
% else
%     fs1=input("enter the stopband1")
%     fs2=input("enter the stopband2")
%     fp1=input("enter the passband1")
%     fp2=input("enter the passband2")
%      if fp1>fs1 
%     st1="bandpass";
%      else
%          st1="stop"
%      end
% end
% rp=input("passband attenuation")
% rs=input("stopband attenuation")
%  if i==1
%      [n wc]=buttord(fp,fs,rp,rp)
%  else
%      [n wc]=buttord([fp1,fp2],[fs1,fs2],rp,rs)
%  end
%  h=
%     
%  
     
h=fir1(n,wc,'low',rectwin(M));
freqz(h)
title('rectangular')
figure
stem(h)
title('h(n)-Time domain rectangular low pass');xlabel('n-->');ylabel('amp-->');
figure

h1=fir1(n,wc,'low',hanning(M));
title('hanning')
freqz(h)
title('hanning')
figure
freqz(h)
title('h(n)-Time domain hanning low pass');xlabel('n-->');ylabel('amp-->');

fc=250;fs=1000;
wc=(2*fc)/fs
M=7
n=M-1
h=fir1(n,wc,'high',hanning(M));
figure
stem(h)
 title('h(n)-Time domain hamming highpass');xlabel('n-->');ylabel('amp-->');
 figure
 freqz(h)
title('hamming high pass')
 
fc=[100 200];fs=1000;
wc=(2*fc)/fs
M=47
n=M-1
h=fir1(n,wc,'bandpass',blackman(M));
figure
stem(h)
 title('h(n)-Time domain blackman bandpass');xlabel('n-->');ylabel('amp-->');
 figure 
 freqz(h)
title('blackman band pass')

 fc=[100 200];fs=1000;
wc=(2*fc)/fs
M=47
n=M-1
h=fir1(n,wc,'stop',blackman(M));
figure
stem(h)
 title('h(n)-Time domain blackman bandstop');xlabel('n-->');ylabel('amp-->');
  figure 
 freqz(h)
title('blackman band stop')