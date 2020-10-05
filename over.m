clc
clear all
hn=[1 1 1]
M=length(hn)
L=4
R=L-M+1
b=10
i=0:b
p=0:b+M-1
xn=1.5.^i
pn=xn         %copying values for final execution
xn=[zeros(1,M-1) xn]   %appending M-1 zeros
t=round(((length(xn)-L)/(L-M+1)))+1     %calculating the number of blocks required
tim=t+1
xn=[xn zeros(1,R) zeros(1,L) ]  %adding zeros at the end to satisfy all the blocks
k=1
l=1
h=L
for t=1:tim               %converting the array into column wise splitted blocks
        xf(:,t)=xn(l:h)';
        l=l+L-M+1;
        h=h+L-M+1;      
end
xn=xf
kn=xf
hn=[hn zeros(1,L-length(hn))]   %appending zeros in h(n)
for i=1:tim
    xn(:,i)=(DFT((xn(:,i)')))'    %taking DFT for all x(n) blocks
end
xf=xn
for i=1:tim
    hf(:,i)=(DFT(hn))'              %taking DFT for h(t)
    yk(:,i)=hf(:,i).*xf(:,i)       %multiplying the h(f) and x(f)
    yn(:,i)=IDFT(yk(:,i)')'           %taking IDFT for x(f)*h(f)
end
ys=[]
for i=1:tim
    ys=[ys yn(M:L,i)']        % eliminating 0 to M-1 in all blocks of y(n)
end
disp("Each column corresponds to a block ")
xn=kn
xf=xf
hf=hf              %equalised just to show output in command window
yk=yk
yn=yn
disp("final y(n)")
disp(ys)
figure
stem(p,ys(p+1))
title(' overlapsave method x(n)=')
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