%Use ode45 to compare the approximated differential equations
[x, y] = ode45(@(x,y)-y+x*y^(1/2),[2 3],2);
xi = 2:0.125:3;
yi = [2 2.10355339 2.2258619 2.367235 2.528097 2.70895 2.91039 3.133032 3.3775];

figure(1)
plot(x,y,"-O")
hold on
plot(xi,yi,"-x")

[x, y] = ode45(@(x,y) -4*y, [0 2], 1);
xi = 0:0.25:2;
yi = [1 0 0 0 0 0 0 0 0];

figure(2)
plot(x,y,"-O")
hold on
plot(xi,yi,"-x")