f = @(x) 4/(1+x^2);
b = 2;
a = 0;

result = [];
for k = 2 : 7
    h = 1/2^k;
    t = a:h:b;
	m = 0;
	for i = 1:length(t)-1
		m = m+ f((t(i)+t(i+1))/2);
	end
	m = h*m;
    error = abs(4*atan(2) - m);
    result = [result; m error];
end

%Calculate the convergence rate and save to the result
for i = 2:6
    r = log2(result(i-1,2)/result((i),2));
    result(i,3) = r;
end

save result_of_midpoint.mat result