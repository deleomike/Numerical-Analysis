%CMPSC 456 Programming assignment 1

%Robber = [a b];
%Police = [x y];

N=250;
h=0.1;

t=linspace(0,N*h,N);
c=0.5;
 
a=@(t) (0.125).*t.*cos(5.*t);
b=@(t) -(0.125).*t.*sin(5.*t);
da=@(t) 1;
db=@(t) 0;

x(1,1)=1;
y(1,1)=0;

%Cop's path
for k=1:length(t)
    x(k+1,1)= x(k) + h * c * sqrt((da(t(k))^2+db(t(k))^2)/ ((a(t(k))-x(k)).^2+ (b(t(k)) - y(k)).^2)) * (a(t(k))-x(k));
    y(k+1,1)=y(k)+h*c*sqrt((da(t(k))^2+db(t(k))^2)/((a(t(k))-x(k)).^2+(b(t(k))-y(k)).^2))*(b(t(k))-y(k));
end

%plot(x,y)
%hold on
plot(a(t),b(t),'-')

%%
    clear
   N = 100; % number of steps.
   a_t(1) = 0; %initial x-coordinate
   b_t(1) = 0; %initial y-coordinate
   for n = 1:N
       A = sign(randn); % Generates either +1/-1
       a_t(n+1) = a_t(n) + A;
       A = sign(randn); % Generates either +1/-1
       b_t(n+1) = b_t(n) + A;
   end
   
   h=10/N;
   t(1)=0;
   for n=1:N
       t(n+1)=t(n)+h;
   end
   a=cumsum(a_t)/(10*mean(a_t)); %the robber?s x-coordinates
   b=cumsum(b_t)/(10*mean(b_t)); %the robber?s y-coordinates
   
   da=@(t) 1;
   db=@(t) 0;
   
   c = 1;
   
   x(1,1)=1;
   y(1,1)=0;
   %Cop's path
    for k=1:length(t)
        upper = (da(t(k))^2+db(t(k))^2);
        disp(k)
        lower = ((a(k))-x(k)).^2 + (b(k) - y(k)).^2;
        x(k+1,1)= x(k) + h * c * sqrt(upper/ lower) * (a(k)-x(k));
        y(k+1,1)=y(k)+h*c*sqrt((da(t(k))^2+db(t(k))^2)/((a(k)-x(k)).^2+(b(k)-y(k)).^2))*(b(k)-y(k));
    end
   plot(a,b,'-','MarkerSize',1) %uncomment to plot robber?s path
   hold on
   plot(x,y)
   %axis square; %uncomment when plotting
