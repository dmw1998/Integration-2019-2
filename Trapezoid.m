function T = Trapezoid(f,a,b,n)
t = linspace(a,b,n+1);
y = f(t);
h = (b-a)/n;
T = h*(sum(y)-1/2*y(1)-1/2*y(n+1));
end