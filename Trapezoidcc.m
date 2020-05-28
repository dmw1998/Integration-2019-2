f = @(x) exp(x).*sin(x);
tol = 10^(-2);

a = 0;
b = pi;
I = 0;
n = 0;
points = [a];
x = [];
se = [];
while length(points) > 0
    h = (b-a)/2^n;
    k = 0;
    for i = 1:length(points)
        [T1,T2,err] = adaptive_Trapezoid(f,points(i),points(i)+h);
        if err < tol/2^n
            I = I+4/3*T2-1/3*T1;
            x = [x points(i) points(i)+h/2 points(i)+h];
            points(i) = 10;
            se = [se err];
        else
            points = [points points(i)+h/2];
        end
    end
    points = sort(unique(points));
    points(points==10) = [];
    n = n+1;
end

error = sum(se);
x = sort(x);
x = unique(x);
hold on;

p = bar(x,y,'hist');
set(p,'FaceColor',[1,1,0.8],'EdgeColor','k');

tt = linspace(a,b,200);
ff = f(tt);
plot(tt,ff,'r','LineWidth',1)

y = f(x);
plot(x,y,'k','LineWidth',0.5)

xlim([-0.05 3.15]);
