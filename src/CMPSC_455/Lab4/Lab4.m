%%CMPSC 455 Lab 4
%Mike DeLeo
%a
a = 1;
b = 2;
H = abs(a-b);

f = @(x)exp(x)/x;
disp("Integral of (e^x)/x from 1 to 2");
disp("---------");

%---------------------------------
%Trapezoid
format long
sum = [0 0 0 0];
for n =5:5:20
    h = H/n;
    for i = 1:1:n-1
        xi = i*h + a;
        sum(n/5)=f(xi)+sum(n/5);
    end
    sum(n/5) = (h/2)*(2 * sum(n/5) + f(a) + f(b));
end

txt = sprintf("n = %13.d %16.d %15.d %15.d",5,10,15,20);
disp(txt);
txt = sprintf("Trapezoidal: %15.10f %15.10f %15.10f %15.10f",sum(1),sum(2),sum(3),sum(4));
disp(txt);

%---------------------------------
%Simpsons
sum = [0 0 0 0];
xi_1 = 0;
for n =5:5:20
    tempsum = 0;
    h = H/n;
    for i=1:1:n-1
        xi = i*h + a;
        sum(n/5) = f(xi) + sum(n/5);
        tempsum = tempsum + f((xi+xi_1)/2);
    end
    sum(n/5) = (h/6)*(f(a) + f(b) + 2*sum(n/5) + 4 * tempsum);
    xi_1 = xi;
end

txt = sprintf("Simpson's: %17.10f %15.10f %15.10f %15.10f",sum(1),sum(2),sum(3),sum(4));
disp(txt);
disp("---------");
disp(" ");

%%
%b
a = 0;
b = 1;
H = abs(a-b);

f = @(x)sin(x)/x;
disp("Integral of (sin(x))/x from 0 to 1");
disp("---------");

%---------------------------------
%Trapezoid
format long
sum = [0 0 0 0];
for n =5:5:20
    h = H/n;
    for i = 1:1:n-1
        xi = i*h + a;
        sum(n/5)=f(xi)+sum(n/5);
    end
    sum(n/5) = (h/2)*(2 * sum(n/5) + 1 + f(b));
end

txt = sprintf("n = %13.d %16.d %15.d %15.d",5,10,15,20);
disp(txt);
txt = sprintf("Trapezoidal: %15.10f %15.10f %15.10f %15.10f",sum(1),sum(2),sum(3),sum(4));
disp(txt);

%---------------------------------
%Simpsons
sum = [0 0 0 0];
xi_1 = 0;
for n =5:5:20
    tempsum = 0;
    h = H/n;
    for i=1:1:n-1
        xi = i*h + a;
        sum(n/5) = f(xi) + sum(n/5);
        tempsum = tempsum + f((xi+xi_1)/2);
    end
    sum(n/5) = (h/6)*(1 + f(b) + 2*sum(n/5) + 4 * tempsum);
    xi_1 = xi;
end

txt = sprintf("Simpson's: %17.10f %15.10f %15.10f %15.10f",sum(1),sum(2),sum(3),sum(4));
disp(txt);
disp("---------");
disp(" ");
%%
%c
a = -1;
b = 1;
H = abs(a-b);

f = @(x)sqrt(1-x^2);
disp("Integral of sqrt(1-x^2) from -1 to 1");
disp("---------");

%---------------------------------
%Trapezoid
format long
sum = [0 0 0 0];
for n =5:5:20
    h = H/n;
    for i = 1:1:n-1
        xi = i*h + a;
        sum(n/5)=f(xi)+sum(n/5);
    end
    sum(n/5) = (h/2)*(2 * sum(n/5) + f(a) + f(b));
end

txt = sprintf("n = %13.d %16.d %15.d %15.d",5,10,15,20);
disp(txt);
txt = sprintf("Trapezoidal: %15.10f %15.10f %15.10f %15.10f",sum(1),sum(2),sum(3),sum(4));
disp(txt);

%---------------------------------
%Simpsons
sum = [0 0 0 0];
xi_1 = 0;
for n =5:5:20
    tempsum = 0;
    h = H/n;
    for i=1:1:n-1
        xi = i*h + a;
        sum(n/5) = f(xi) + sum(n/5);
        tempsum = tempsum + f((xi+xi_1)/2);
    end
    sum(n/5) = (h/6)*(f(a) + f(b) + 2*sum(n/5) + 4 * tempsum);
    xi_1 = xi;
end

txt = sprintf("Simpson's: %17.10f %15.10f %15.10f %15.10f",sum(1),sum(2),sum(3),sum(4));
disp(txt);
disp("---------");
disp(" ");
%%
%d
a = 0;
b = 2;
H = abs(a-b);

f = @(x)(sqrt(2)/(2-sqrt(2)))*(2-x);
g = @(x)x;
disp("The PieceWise Function f(x)");
disp("Where f(x) = x when 0<= x <= Sqrt(2)");
disp("f(x) = (sqrt(2)/(2-sqrt(2)))*(2-x) elsewhere");

%---------------------------------
%Trapezoid
format long
sum = [0 0 0 0];
for n =5:5:20
    h = H/n;
    for i = 1:1:n-1
        xi = i*h + a;
        if (xi < sqrt(2))
            sum(n/5)=g(xi)+sum(n/5);
        else
            sum(n/5)=f(xi)+sum(n/5);
        end
    end
    sum(n/5) = (h/2)*(2 * sum(n/5) + g(a) + f(b));
end

txt = sprintf("n = %13.d %16.d %15.d %15.d",5,10,15,20);
disp(txt);
txt = sprintf("Trapezoidal: %15.10f %15.10f %15.10f %15.10f",sum(1),sum(2),sum(3),sum(4));
disp(txt);

%---------------------------------
%Simpsons
sum = [0 0 0 0];
xi_1 = 0;
for n =5:5:20
    tempsum = 0;
    h = H/n;
    for i=1:1:n-1
        xi = i*h + a;
        if (xi < sqrt(2))
            sum(n/5) = g(xi) + sum(n/5);
            tempsum = tempsum + g((xi+xi_1)/2);
        else
            sum(n/5) = f(xi) + sum(n/5);
            tempsum = tempsum + f((xi+xi_1)/2);
        end
    end
    sum(n/5) = (h/6)*(g(a) + f(b) + 2*sum(n/5) + 4 * tempsum);
    xi_1 = xi;
end

txt = sprintf("Simpson's: %17.10f %15.10f %15.10f %15.10f",sum(1),sum(2),sum(3),sum(4));
disp(txt);
disp("---------");