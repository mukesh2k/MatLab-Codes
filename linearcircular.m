a=input('enter the sequence, x(n)=')
xo=input("position of origin,  ");xo=xo-1;
b=input('enter the sequence, h(n)=')
ho=input("position of origin,  ");ho=ho-1;
m=length(a);
n=length(b);
al=-xo
ah=length(a)-xo-1
bl=-ho
bh=length(b)-ho-1
hl=min(al,bl)
hh=max(ah,bh) %obtaining max and min index 
ao=[a zeros(1,n-1)]
bo=[b zeros(1,m-1)] %appending zeros
ans1=IDFT(DFT(ao).*DFT(bo)) %calling functions
disp(-xo-ho:m-xo+n-ho-1-1)
figure
stem(-xo:m-xo-1,a)
title(' x(n)=')
xlabel('time n------>')
ylabel('amplitude----->')
figure
stem(-ho:n-ho-1,b)
title(' h(n)=')
xlabel('time n------>')
ylabel('amplitude----->')
figure
stem(-xo-ho:m-xo+n-ho-1-1,ans1,'r'); grid on;
title('output Y(n) (Linear convolution using circular covolution)')
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


