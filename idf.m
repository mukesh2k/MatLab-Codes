a=complex(0 ,0)
o=input("enter n th point  ")
disp("Minimum "+num2str(round(o/2))+" points required")
a=input("Enter in format [] ")
u=input("Required length ") %[4 1-2.414j 0 1-.414j]
l=u
if mod(o,2)==0
npt=[a(1:o/2) flip(conj(a(1:o/2)))]

else
    npt=[a(1:round(o/2)-1) a(round(o/2)) flip(conj(a(1:round(o/2)-1)))]
    
end
disp(a)
W=complex(0,0)
l=o
for k=0:l-1
for n=0:l-1%twiddle matrix generator
W(k+1,n+1)=complex(cos(2*pi*k*n/l),sin(2*pi*k*n/l));
end
end
f=0
f=npt*W;
f=f/l; %divide the matrix by N
f=[f f f f f f f f f]
disp("Inverse fourier transform")
disp(f);
figure
stem(0:length(a)-1,a)
title("MAGNITUDE of X(f)")
xlabel("frequency (f)--->")
ylabel("Magnitude--->")
figure
stem(0:u-1,abs(f(1:u)),'r')
title("MAGNITUDE of x(n)")
xlabel("time(n)--->")
ylabel("Magnitude--->")
figure
stem(0:u-1,angle(f(1:u)),'g')
xlabel("time(n)--->")
ylabel("radians")
title("PHASE of x(n)")