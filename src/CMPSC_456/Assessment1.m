%CMPSC_456_Assessment 1

%%
%A2

h = 0.125;  %step size
a = 0;  %start of interval
b = 1; %end of interval

x = a:h:b; %x values
y = 1:h:2; %y
y(1) = -1/2;    %initial condition


%this is technically wrt x as well, but since that doesnt matter here, I'm 
%just using y
f = @(y) 2- y - y^2;

for i=2:1:((b-a)/h+1)
    k1 = h * f(y(i-1));
    k2 = h * f(y(i-1) + (1/2)*k1);
    k3 = h * f(y(i-1) + (1/2)*k2);
    k4 = h * f(y(i-1) + k3);
    y(i) = y(i-1) + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
end

plot(x,y)
hold on
[xx yy] = ode45(@(x,y) 2- y - y^2, [a b], -1/2);
plot(xx,yy);

%%
%A4

h = 0.2;
a = 1;
b = 2;

x = a:h:b;
y = a:h:b;
y(1) = 1;

f = @(x,y) (1/x)*(y^2+y);

y(2) = y(1) + h*f(x(1),y(1));

for i=3:1:((b-a)/h+1)
    Yimp = y(i-1) + (h/2)*(3*f(x(i-1),y(i-1)) - f(x(i-2),y(i-2)));
    y(i) = y(i-1) + (h/2)*(f(x(i),Yimp) + f(x(i-1),y(i-1)));
end

plot(x,y)

%%
%A5

%y'' + e^y * x^2 = 0
%u1 = y
%u2 = y'

%u2' + e^u1 * x^2 = 0
%u2' = -e^u1 * x^2

a = 0;
b = 2;
h = 0.25;

x = a:h:b;
u1 = a:h:b;
u2 = a:h:b;

u1(1) = -1;
u2(1) = 3;

f = @(x,y) -exp(y)*x^2;

for i =2:1:((b-a)/h+1)
    u1(i) = u1(i-1) + h*u2(i-1);
    u2(i) = u2(i-1) + h*f(x(i-1),u1(i-1));
end
    
plot(x,u2);

%%
%A6

%y'' = 4(y-x)

%u1 = y
%u2 = y'

%u2' = 4(u1 - x)

a = 0;
b = 1;
h = 0.25;

x = a:h:b;
u1 = a:h:b;
u2 = a:h:b;

u1(1) = 1;
u2(1) = 2;

f = @(x,y) 4*(y-x);

for i=2:1:((b-a)/h+1)
    u1(i) = u1(i-1) + h*u2(i-1);
    u2(i) = u2(i-1) + h*f(x(i-1),u1(i-1));
end

plot(x,u1);

