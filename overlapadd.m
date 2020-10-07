clc %%program used in matlab to process overlap add method dft
clear all
hn=input("Enter h(n)   : ")
M=length(hn)
L=input("Enter the length of block required :  ")
R=L-M+1
b=input("Number of points from 0  :  ")
i=0:b
p=0:b+M-1                %copying values for final execution
xn=1.5.^i

figure
stem(0:length(conv(xn,hn))-1,conv(xn,hn))

pn=xn
xn=[xn zeros(1,R-mod(length(xn),2))]  %adding zeros at the end to satisfy all the blocks completely
tim=round(((length(xn)-L)/(L-M+1))+1) %calculating the number of blocks required
xf=[]
for t=1:tim   %converting the array into row wise splitted blocks
    xf(t,:)= [xn(1+R*(t-1):R+R*(t-1)) zeros(1,M-1)]
end
kn=xf
xn=xf
hn=[hn zeros(1,L-M)] %appending zeros in h(n)
hf=fft(hn)       %taking DFT for h(t)
for i=1:tim
    xn(i,:)=(DFT((xn(i,:)))) %taking DFT for all x(n) blocks
    yk(i,:)=hf.*xn(i,:)      %multiplying the h(f) and x(f)
    yn(i,:)=IDFT(yk(i,:))    %taking IDFT for x(f)*h(f)
end
xf=xn
ys=[]
for i=1:tim          %loop to generate the sequence from the blocks by addind
    if i==1          %M-1 from previous block to present block
        ys=[yn(i,1:R)]
        ys=[ys yn(i+1,1:M-1)+yn(i,R+1:L)]
    else if i==tim
            ys=[ys yn(i,M:L)]
        else
            ys=[ys yn(i,M:R) yn(i+1,1:M-1)+yn(i,R+1:L)]
        end
    end
end

disp("Each row corresponds to a block ")
xn=kn
xf=xf
hf=hf              %equalised just to show output in command window
yk=yk
yn=yn
disp("final")
disp(ys)
figure
stem(p,ys(p+1))
title(' overlapadd method x(n)=')
xlabel('time n------>')
ylabel('amplitude----->')
figure
stem(0:length(pn)-1,pn)
title(' x(n)=')
xlabel('time n------>')
ylabel('amplitude----->')
figure
stem(0:length(hn)-1,hn)
title(' h(n)=')
xlabel('time n------>')
ylabel('amplitude----->')
figure
function f=DFT(a) %function for DFT
W=complex(0,0)
f=1
l=length(a)
for k=0:l-1
    for n=0:l-1
        W(k+1,n+1)=complex(cos(2*pi*f*k*n/l),-sin(2*pi*k*f*n/l));
    end
end
f=0
f=a*W;
end
function f=IDFT(a) %function for IDFT
W=complex(0,0)
f=1
l=length(a)
for k=0:l-1
    for n=0:l-1
        W(k+1,n+1)=complex(cos(2*pi*f*k*n/l),sin(2*pi*k*f*n/l));
    end
end
f=0
f=a*W;
f=f/l;
end
