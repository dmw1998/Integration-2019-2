f = @(x) 4/(1+x^2);
b = 2;
a = 0;

%Calculate the approximation values and errors
result = [];
for k = 2 : 7
    h = 1/2^k;
    t = a:h:b;
	s = 0;
	for i = 1:length(t)-1
		s = s + f(t(i)) + 4*f((t(i)+t(i+1))/2) + f(t(i+1));
	end
	s = h/6 * s;
    error = abs(4*atan(2) - s);
    result = [result; s error];
end

%Calculate the convergence rate and save to the result
for i = 2:6
    r = log2(result(i-1,2)/result((i),2));
    result(i,3) = r;
end



save result_of_simpson.mat result
