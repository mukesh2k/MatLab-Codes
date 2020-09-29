






function W=DTF(u)
W=complex(0,0)
f=1
for o=0:u-length(a)-1
    a=[a 0]
end
l=length(a)
for k=0:l-1
    for n=0:l-1
        W(k+1,n+1)=complex(cos(2*pi*f*k*n/l),-sin(2*pi*k*f*n/l));
    end
end
end