
 t=0:0.01:1;%range setting
 f=3;%frequency
 m=randi([0,1],1,10);%generating psedo random integers
 msg_sig=[];bpsk_sig=[];carrier_sig=[];
 for i=1:length(m)
     if m(i)==0 %if msg is 0 bpsk sin with phaseshift of pi
         msg_sig=[msg_sig zeros(1,length(t))];
         bpsk_sig=[bpsk_sig sin((2*pi*f*t)+pi)];
     else     %if msg is 0 bpsk sin without phaseshift
         msg_sig=[msg_sig ones(1,length(t))];
         bpsk_sig=[bpsk_sig sin(2*pi*f*t)];
     end    %carrier of sin wave
     carrier_sig=[carrier_sig sin(2*pi*f*t)];
 end
figure
 plot(carrier_sig);
 xlabel('time(s)');
 ylabel('amplitude');
 title('CARRIER SIGNAL');
 figure
 plot(msg_sig);
 xlabel('time(s)');
 ylabel('amplitude');
 title('MESSAGE SIGNAL');
 ylim([-0.5 1.5]);
 figure
 plot(bpsk_sig);
 xlabel('time(s)');
 ylabel('amplitude');
 title('BPSK SIGNAL');
 rec_sig=awgn(bpsk_sig,10);%adding white gaussian noise to message
 figure
 plot(rec_sig);
 xlabel('time(s)');
 ylabel('amplitude');
 title('RECIEVED SIGNAL');
 dem_sig=(rec_sig).*(carrier_sig); %received signal with carrier
figure
 plot(dem_sig);
 xlabel('time(s)');
 ylabel('amplitude');
 title('DEMODULATED SIGNAL');
 %GENERATION OF ORIGINAL MESSAGE SIGNAL
 demod_sig=[];
 for i=1:length(m)
     k=sum(dem_sig((1+(i-1)*length(t)):(i*length(t)))); %adding each range of sequence in received signal 1
     if k>0
         demod_sig=[demod_sig ones(1,length(t))];
     else%if k is greater than 0 it is 1 else 0
         demod_sig=[demod_sig zeros(1,length(t))];
     end
 end
 figure
 plot(demod_sig);
 ylim([-0.5 1.5]);
 xlabel('time(s)');
 ylabel('amplitude');
 title('ORIGINAL MSG SIGNAL');