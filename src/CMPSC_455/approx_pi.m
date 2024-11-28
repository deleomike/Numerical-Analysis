%%Approximating Pi

f = @(k) k*sin(pi/k);
g = @(k) k*tan(pi/k);

k = 4;
while (abs(g(k) - f(k)) > 10^-5)
    disp("pk: " + f(k));
    disp("Pk: " + g(k));
    diff = f(k) - g(k);
    disp("Diff: " + diff);
    disp("K: " + k);
    disp("---------------");
    k = k * 2;
end