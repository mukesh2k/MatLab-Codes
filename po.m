clc;
clear all;
close all;
f=1000
t=0:1/f:4;
A=20;
fs=8000;
msg_sig=A*sin(2*pi*t);
subplot(3,2,1);
plot(msg_sig);
xlabel('time');
ylabel('amplitude');
title('MESSAGE SIGNAL');

n=10;
n=0:1/fs:4;
samp_sig=A*sin(2*pi*f*n*0.01);
subplot(3,2,2);
stem(n(1:4*f),samp_sig(1:4*f));
xlabel('n');
ylabel('amplitude');
title('SAMPLED SIGNAL');

encoded=[];
sampled=samp_sig;
for i=1:f*4
    if (samp_sig(i)>=-20 & samp_sig(i)<-10)
        sampled(i)=-20;
    end
    if (samp_sig(i)>=-10 & samp_sig(i)<0)
        sampled(i)=-10;
        encoded=[encoded [-A A]];
    end
    if (samp_sig(i)>=0 & samp_sig(i)<10)
        sampled(i)=10;
        encoded=[encoded [A -A]];
    end
    if (samp_sig(i)>=10 & samp_sig(i)<20)
        sampled(i)=20;
        encoded=[encoded [A A]];
    end
  
end
subplot(3,2,3);
stem(sampled);
xlabel('n');
ylabel('amplitude');
title('SAMPLED SIGNAL');
subplot(3,2,4);
plot(encoded);
xlabel('time');
ylabel('amplitude');
title('ENCODED SIGNAL');

demod=[];
%decoding

decoded=[];
j=1;
for i=1:2:4*f
    if encoded(i)==0 & encoded(i+1)==0 
        demod(j)=-20;
    end
    if encoded(i)==0 & encoded(i+1)==1
        demod(j)=-10;
    end
    if encoded(i)==1 & encoded(i+1)==0
        demod(j)=10;
    end
    if encoded(i)==1 & encoded(i+1)==1 
        demod(j)=20;
    end
 
    j=j+1;
end
subplot(3,2,5);
stem(demod);
xlabel('n');
ylabel('amplitude');
title('DECODED SIGNAL');
subplot(3,2,6);
plot(demod);
xlabel('time');
ylabel('amplitude');
title('DEMODULATED SIGNAL');

    

    
