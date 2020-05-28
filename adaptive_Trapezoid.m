function [T1,T2,err] = adaptive_Trapezoid(f,a,b)
T1 = Trapezoid(f,a,b,1);
T2 = Trapezoid(f,a,b,2);
err = 1/3*abs(T2-T1);
end