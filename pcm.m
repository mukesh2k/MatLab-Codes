clc;
clear all;
close all;
t=0:0.01:1;  %range for the message signal
A=1;
f=1;      %frequency  
msg_sig=A*sin(2*pi*f*t);  %message signal

plot(msg_sig);
xlabel('time');
ylabel('amplitude');
title('MESSAGE SIGNAL');
n=0:2:100;   %sampling range
samp_sig=A*sin(2*pi*f*n/100);
figure
stem(n,samp_sig);
xlabel('n');
ylabel('amplitude');
title('SAMPLED SIGNAL');
encoded=[];
sampled=samp_sig;
for i=1:length(samp_sig)  %encoding done based upon the values
    if (samp_sig(i)>=0 & samp_sig(i)<0.25)
        sampled(i)=0.125;
        encoded=[encoded [1 0 0]];
    end
    if (samp_sig(i)>=0.25 & samp_sig(i)<0.5)
        sampled(i)=0.375;
        encoded=[encoded [1 1 0]];
    end
    if (samp_sig(i)>=0.5 & samp_sig(i)<0.75)
        sampled(i)=0.625;
        encoded=[encoded [1 1 0]];
    end
    if (samp_sig(i)>=0.75 & samp_sig(i)<1)
        sampled(i)=0.875;
        encoded=[encoded [1 1 1]];
    end
    if (samp_sig(i)<0 & samp_sig(i)>=-0.25)
        sampled(i)=-0.125;
        encoded=[encoded [0 1 1]];
    end
    if (samp_sig(i)<-0.25 & samp_sig(i)>=-0.5)
        sampled(i)=-0.375;
        encoded=[encoded [0 1 0]];
    end
     if (samp_sig(i)<-0.5 & samp_sig(i)>=-0.75)
        sampled(i)=-0.625;
        encoded=[encoded [0 0 1]];
     end
     if (samp_sig(i)<-0.75 & samp_sig(i)>=-1)
        sampled(i)=-0.875;
        encoded=[encoded [0 0 0]];
    end
end
figure
stem(sampled);
xlabel('n');
ylabel('amplitude');
title('SAMPLED SIGNAL');
figure
plot(encoded);
xlabel('time');
ylabel('amplitude');
title('ENCODED SIGNAL');

demod=[];
%decoding

decoded=[];
j=1;
for i=1:3:153;   %decoding is done based on the each three values
    if encoded(i)==0 & encoded(i+1)==0 & encoded(i+2)==0
        demod(j)=-0.875;
    end
    if encoded(i)==0 & encoded(i+1)==0 & encoded(i+2)==1
        demod(j)=-0.625;
    end
    if encoded(i)==0 & encoded(i+1)==1 & encoded(i+2)==0
        demod(j)=-0.375;
    end
    if encoded(i)==0 & encoded(i+1)==1 & encoded(i+2)==1
        demod(j)=-0.125;
    end
    if encoded(i)==1 & encoded(i+1)==1 & encoded(i+2)==1
        demod(j)=0.875;
    end
    if encoded(i)==1 & encoded(i+1)==1 & encoded(i+2)==0
        demod(j)=0.625;
    end
    if encoded(i)==1 & encoded(i+1)==0 & encoded(i+2)==1
        demod(j)=0.375;
    end
    if encoded(i)==1 & encoded(i+1)==0 & encoded(i+2)==0
        demod(j)=0.125;
    end
    j=j+1;
end
figure
stem(0:50,demod);
xlabel('n');
ylabel('amplitude');
title('DECODED SIGNAL');
figure
plot(0:50,demod);
xlabel('time');
ylabel('amplitude');
title('DEMODULATED SIGNAL');