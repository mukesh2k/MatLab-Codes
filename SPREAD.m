clc
t=0:0.01:1;%range setting
message=randi([0,1],1,10);%generating psedo random integers
figure
subplot(2,3,1);
stem(message);
title('MESSAGE');
msg_sig=[];
for i=1:length(message)
    if message(i)==1
        msg_sig=[msg_sig ones(1,length(t))]; %appending ones if m(i) is 1
    else  
        msg_sig=[msg_sig zeros(1,length(t))];  %appending zeros if m(i) is 0
        message(i)=-1;   %bipolar
    end
end
subplot(2,3,2);
plot(msg_sig);
xlabel('TIME');
ylabel('AMPLITUDE');
title('MESSAGE SIGNAL');
ylim([-0.5 1.5]);
%generation of PN sequence
PN=0; 
while (PN==0)
x=randi([0,1],1,3);
for i=1:7   %generating the psudo order sequence
    PN=[PN x(3)];
    temp3=x(3);
    temp1=x(1);
    x(3)=x(2);
    x(1)=xor(temp1,temp3);
    x(2)=temp1;
    PN=[PN temp3];
end
    %run property
    ind0=find(~PN);
    ind1=find(PN);
    if (length(ind1)-length(ind0))==1
        disp('balance property is satisfied');
        A=ind0(2)-ind0(1);
        B=ind0(3)-ind0(2);
        C=(ind1(2)-ind1(1))+(ind1(3)-ind1(2));
        D=(ind1(4)-ind1(3))+(ind1(3)-ind1(2));
        if(A==1||B==1)&&(C==2||D==2)
            R1=[]; R2=[]; R3=[]; R4=[];
            if A==1
                R1=[PN(ind0(1)) PN(ind0(2))]
                R2=[PN(ind0(3))]
            end
            if B==1
                R1=[PN(ind0(2)) PN(ind0(3))]
                R2=[PN(ind0(1))]
            end
            if C==2
                R3=[PN(ind1(1)) PN(ind1(2)) PN(ind1(3))]
                R2=[PN(ind1(4))]
            end
            if D==2
                R3=[PN(ind1(2)) PN(ind1(3)) PN(ind1(4))]
                R4=[PN(ind1(1))]
            end
            disp('Orthogonality is satisfied, hence PN sequence is valid');
        else
            disp('Orthogonality is not satisfied, hence PN sequence is valid');
            PN=0;
        end
    else
        disp('Balance property is not satisfied');
        PN=0;
    end
end    
PN_sig=[];
for i=1:length(PN)
    if PN(i)==1
        PN_sig=[PN_sig ones(1,length(t))];
    else
        PN_sig=[PN_sig zeros(1,length(t))];
        PN(i)=-1;
    end
end
subplot(2,3,3);
plot(PN_sig);
xlabel('TIME');
ylabel('AMPLITUDE');
title('PN SIGNAL');
ylim([-0.5 1.5]);
subplot(2,3,4);
stem(PN);
title('PN BITS');

ds=[]; PN_seq=[];
for j=1:length(message)
    ds=[ds message(j).*PN];
    PN_seq=[PN_seq PN];
end

%DSSS-BPSK

t=0:0.01:1;
f=2;
ds_sig=[]; carr_sig=[]; bpsk=[];
for i=1:length(ds)
     if ds(i)==1
         ds_sig=[ds_sig ones(1,length(t))];
         bpsk=[bpsk sin(2*pi*f*t)];
     else
         ds_sig=[ds_sig zeros(1,length(t))];
         bpsk=[bpsk sin(2*pi*f*t+pi)];
     end
     carr_sig=[carr_sig sin(2*pi*f*t)];
 end
subplot(2,3,5);
plot(ds_sig);
xlabel('TIME');
ylabel('AMPLITUDE');
title('DSSS SIGNAL');
ylim([-0.5 1.5]);
subplot(2,3,6);
plot(carr_sig);
xlabel('TIME');
ylabel('AMPLITUDE');
title('CARRIER SIGNAL');
figure
subplot(2,3,1);
plot(bpsk);
xlabel('TIME');
ylabel('AMPLITUDE');
title('DSSS-BPSK MODULATED SIGNAL');
rec_sig=awgn(bpsk,10);
subplot(2,3,2);
plot(rec_sig);
xlabel('TIME');
ylabel('AMPLITUDE');
title('RECIEVED SIGNAL');
demod=rec_sig.*carr_sig;
subplot(2,3,3);
plot(demod);
xlabel('TIME');
ylabel('AMPLITUDE');
title('DEMODULATED SIGNAL');
without_error=[]; ds_rec=[];
 for i=1:length(ds)
     k=sum(demod((1+(i-1)*length(t)):(i*length(t))));
     if k>0
         without_error=[without_error ones(1,length(t))];
         ds_rec=[ds_rec 1];
     else
         
         without_error=[without_error zeros(1,length(t))];
         ds_rec=[ds_rec 0];
     end  
 end
subplot(2,3,4);
plot(without_error);
xlabel('TIME');
ylabel('AMPLITUDE');
title('RECIEVED DSSS SIGNAL');
ylim([-0.5 1.5]);
msg_rec=[];
msg_rec=ds_rec.*PN_seq;
subplot(2,3,5);
stem(msg_rec);
xlabel('TIME');
ylabel('AMPLITUDE');
title('RECIEVED SIGNAL');
rc_msg=[]; 
k=1;
for i=1:15:length(msg_rec)
    if sum(msg_rec(i:i+6))>1
        rc_msg(k)=1;
    else
        rc_msg(k)=0;
    end
    k=k+1;
end
subplot(2,3,6);
stem(rc_msg);
xlabel('TIME');
ylabel('AMPLITUDE');
title('RECIEVED MESSAGE');