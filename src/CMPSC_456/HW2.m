%CMPSC456_HW2

x = 0:0.25:1;
y = [1 0.969706 0.889398 0.784893 0.683967];

figure(1);
plot(x,y)

[xx yy] = ode45(@(x,y) (1-2*y)*x, [0 1], 1)

hold on;
plot(xx,yy)


y = [3 3.5 4 4.72265625 6.03564453];
yy = [2 2 2.890625 5.25195312 7.12219238];

figure(2);

plot(x,y,'-o',x,yy,'-o');

hold on;

[xx yy] = ode45(@(x,y) [y(2); y(2)*x + x*y(1)^2], [0 1], [2 3]);

%[xx yy] = ode45(@dxdt, [0 T], [ 1 3 ])
plot(xx,yy,'-x');

legend('u1','u2','odeu1','odeu2')
