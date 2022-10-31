function [val] = integral_approximation(x, f)
% This function returns the integral approximations using left-point
% approximation. It uses function f (taken as input) and computes the
% approximation under the f function curve.
sum=0;
n=length(x);
for i=1:n-1
    a=x(i);
    b=x(i+1);
    sum = sum + abs(f(i) *(b-a));
end
val = sum;
