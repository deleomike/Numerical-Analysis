function area = quad_rec(func,left_bound,right_bound,tolerance,prev)
%function

%fprintf("Left: %4.4f Right: %4.4f\n",left_bound,right_bound);

avg = (right_bound + left_bound)/2;
not_avg = (right_bound - left_bound)/2;
%fprintf("avg: %f not_avg: %f\n",avg,not_avg);

upper = not_avg * (func(left_bound) + func(avg))/2;
lower = not_avg * (func(avg) + func(right_bound))/2;

%fprintf("%5.10f - %5.10f - %5.10f = %5.5f < %5.10f\n\n",prev,upper,lower,abs(prev-upper-lower),tolerance);


if (abs(prev - upper - lower) < tolerance)
    area = upper + lower;
else
    area = quad_rec(func,left_bound,avg,tolerance/2,upper) + quad_rec(func,avg,right_bound,tolerance/2,lower);
    
end

