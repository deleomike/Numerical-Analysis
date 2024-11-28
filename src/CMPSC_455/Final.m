%CMPSC 455 Final
%Q11

%Use aitkens method to speed up convergence for the sequence
%xn = sum(k=1->n){1/k^(1.01)}
clear all

xn = zeros(1,10000);

x = zeros(1,5);
i = 2;
x1 = 0;
x2 = 0;
x3 = 0;
p1 = 0;
p2 = 0;
p3 = 0;

for k=1:1:1
    x(1) = x(1) + 1/((k^(1.01)));
end
for k=1:1:2
    x(2) = x(2) + 1/((k^(1.01)));
end

x(3) = x(2) + 1/(((i+1)^(1.01)));
x(4) = x(3) + 1/(((i+1)^(1.01)));
x(5) = x(4) + 1/(((i+1)^(1.01)));

triplecount = 0;
count = 2;
while (true)

    if (triplecount == 2)
        x(1) = xn(i-2);
        x(2) = xn(i-1);
        x(3) = xn(i);
        triplecount = 0;
        count = 2;
    end
    %finds the normal variables
    %upper = x_normal(i+1)^2-x_normal(i+2)*x_normal(i);
    %lower = 2*x_normal(i+1)-x_normal(i+2) - x_normal(i);
    upper = (x(count) - x(count-1))^2;
    lower = (x(count+1) - 2*x(count) + x(count-1));

    xn(i) = x(count-1) - upper/lower;
    txt = sprintf("x: %.8f i: %d",xn(i),i);
    disp(txt);
    %x_normal(i) = xn(i);
    %xn(i) = upper/lower;
    
    if (i ~= 1)
        if (floor(xn(i)*10^10) == floor(xn(i-1)*10^10))
            break;
        end
    end
    i = i+ 1;
    triplecount = triplecount + 1;
    count = count + 1;
    %for k=1:1:4
    %    x(k) = x(k+1);
        %shift the values
    %end
end
xn = xn(1,1:i+1);

sz = size(xn);
sz = sz(2);
disp("Steffenson's Method:");
txt = sprintf("Last Value of Iteration: %.12f\nSecond Last Value of Iteration %.12f\nDifference: %e\nIterations: %d",xn(sz),xn(sz-1),abs(xn(sz)-xn(sz-1)),sz);
disp (txt);
disp("-----------------");