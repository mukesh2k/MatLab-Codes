a=input('enter the sequence, x(n)=')
xo=input("position of origin,  ");xo=xo-1;
b=input('enter the sequence, h(n)=')
ho=input("position of origin,  ");ho=ho-1;
al=-xo
ah=length(a)-xo-1
bl=-ho
bh=length(b)-ho-1
hl=min(al,bl)
hh=max(ah,bh) %obtaining max and min index
a=[zeros(1,al-hl) a zeros(1,hh-ah)]
b=[zeros(1,bl-hl) b zeros(1,hh-bh)]
ans1=IDFT(DFT(a).*DFT(b)) %calling functions
figure
stem(hl:hh,a)
title(' x(n)=')
xlabel('time n------>')
ylabel('amplitude----->')
figure
stem(hl:hh,b)
title(' h(n)=')
xlabel('time n------>')
ylabel('amplitude----->')
figure
stem(hl:hh,ans1,'r'); grid on;
title('output Y(n) (Circular convolution using frequencyD)')
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