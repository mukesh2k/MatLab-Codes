 clc;
 t=0:0.01:1; %range setting
 f=5;  %frequency
 m=randi([0,1],1,10);  %generating psedo random integers
 carrier_sig1=[];carrier_sig2=[];qpsk_sig=[];msg_sig=[];
 for i=1:length(m)
     if m(i)==0
         m(i)=-1;
         msg_sig=[msg_sig zeros(1,length(t/2))];  %appending zeros if m(i) is 0
     else
         msg_sig=[msg_sig ones(1,length(t/2))]; %appending ones if m(i) not 0
     end
 end
 for i=1:2:length(m)
     q1=m(i)*cos(2*pi*f*t);  %setting 2N th message signal as cos
     q2=m(i+1)*sin(2*pi*f*t);%setting 2N+1 th message signal as sin
     Q=q1+q2;   %combaining to make QPSK signal
     qpsk_sig=[qpsk_sig Q];
     carrier_sig1=[carrier_sig1 cos(2*pi*f*t)]; %carrier1 as cos wave
     carrier_sig2=[carrier_sig2 sin(2*pi*f*t)]; %carrier2 as sin wave
 end   
 figure
 plot(msg_sig);
 xlabel('time(s)');
 ylabel('amplitude');
 ylim([-0.5 1.5]);
 title('MESSAGE SIGNAL');
  figure
 plot(qpsk_sig);
 xlabel('time(s)');
 ylabel('amplitude');
 title('QPSK SIGNAL');
 noise_sig=awgn(qpsk_sig,3);   %adding white gaussian noise to message
  figure
 plot(noise_sig);
 xlabel('time(s)');
 ylabel('amplitude');
 title('QPSK SIGNAL WITH NOISE');
 
 %demodulation
 dem_sig1=(noise_sig).*(carrier_sig1);  %receiver signal of carrier1 with noise
  figure
 plot(dem_sig1);
 xlabel('time(s)');
 ylabel('amplitude');
 title('DEMODULATED SIGNAL1');
 
 dem_sig2=(noise_sig).*(carrier_sig2);  %receiver signal of carrier2 with noise
 figure
 plot(dem_sig2);
 xlabel('time(s)');
 ylabel('amplitude');
 title('DEMODULATED SIGNAL2');
  
 %GENERATION OF ORIGINAL MESSAGE SIGNAL
 demod_sig=[];
 for i=1:length(m)/2
     k1=sum(dem_sig1((1+(i-1)*length(t)):(i*length(t)))); %adding each range of sequence in received signal 1
     k2=sum(dem_sig2((1+(i-1)*length(t)):(i*length(t)))); %adding each range of sequence in received signal 2
     if k1>0
         demod_sig=[demod_sig ones(1,length(t))];
     else  %if k1 is greater than 0 it is 1 else 0
         demod_sig=[demod_sig zeros(1,length(t))];
     end
     if k2>0
         demod_sig=[demod_sig ones(1,length(t))];
     else  %if k2 is greater than 0 it is 1 else 0
          demod_sig=[demod_sig zeros(1,length(t))];
     end
 end
 figure
 plot(demod_sig);
 ylim([-0.5 1.5]);
 xlabel('time(s)');
 ylabel('amplitude');
 title('ORIGINAL MSG SIGNAL')